using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

public class Transaction
{
    private Team5ADProjectEntities ctx;
    public Transaction()
    {
        // remove instanciation of Entites and put it into each Acton
        // because when server using existing ORM in memory
        // it cannot synchronize with database if there is action on database from other server
        // ctx = new Team5ADProjectEntities();
    }

    /// <summary>
    /// Clerk fetch items from WareHouse, we only record:
    ///     1. the condition, which is the NeededNumber, equals to up-to-date "OutstandingRequest"
    ///     2. the decision, which is the RetreivedNumber, equals to actual number of item fetched by Clerk
    /// </summary>
    /// <param name="itemID"></param>
    /// <param name="departmentID"></param>
    /// <param name="retrieveQty"></param>
    /// <returns></returns>
    public int Retrieve(string itemID, string departmentID, int retrieveQty)
    {
        ctx = new Team5ADProjectEntities();

        // Check if there is needed (OutstandingRequest) and retrieveQty should <= needed
        OutstandingRequest qry = ctx.OutstandingRequests.Where
            (x => x.ItemID.Equals(itemID) && x.DepartmentID.Equals(departmentID)).FirstOrDefault();
        if (qry == null)
            return -1;     // cannot find Needed
        if (qry.OutstandingQty < retrieveQty)
            return -21;     // retrieveQty > needed

        // Check all the retrieved number from all department of an Item
        // To reduce query, check on Service Layer

        // Get the LAST record means the most recent one, GivenNumber equals -1 means it's a Retrieve Action
        DisbursementLog updateRetrieveLog = (from x in ctx.DisbursementLogs
                                                where ((x.ItemID == itemID) && (x.DepartmentID == departmentID) && (x.GivenNumber == -1))
                                                select x).ToList().LastOrDefault();
        //DisbursementLog updateRetrieveLog = ctx.DisbursementLogs.Where
        //    (x => x.ItemID.Equals(itemID) && x.DepartmentID.Equals(departmentID) && x.GivenNumber.Equals(-1)).ToList().LastOrDefault();
        if (updateRetrieveLog == null)
        {
            // if cannot find DisbursementLog, create one
            updateRetrieveLog = new DisbursementLog();
            updateRetrieveLog.ItemID = itemID;
            updateRetrieveLog.DepartmentID = departmentID;
            ctx.DisbursementLogs.Add(updateRetrieveLog);
        }
        // Set Date
        updateRetrieveLog.DateTime = DateTime.Now;
        // Set NeededNumber to updated OutstandingQty
        updateRetrieveLog.NeededNumber = qry.OutstandingQty;
        // Set RetrievedNumber to retrieveQty
        updateRetrieveLog.RetrivedNumber = retrieveQty;

        // Set GivenNumber to -1 to indicate this is a retrieveLog
        updateRetrieveLog.GivenNumber = -1;
        updateRetrieveLog.Flag = "Progressing Retrieve";

        // SaveChanges
        int res = -100;
        try
        {
            res = ctx.SaveChanges();
            return res;
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        return res;
    }

    /// <summary>
    /// Clerk give items to Department at Collection Point, ew only record:
    ///     the decision, which is the GivenNumber, equals to actual number of item given by Clerk to Department
    /// </summary>
    /// <param name="itemID"></param>
    /// <param name="departmentID"></param>
    /// <param name="giveQty"></param>
    /// <returns></returns>
    public int Give(string itemID, string departmentID, int giveQty)
    {
        ctx = new Team5ADProjectEntities();

        // Retrieve current Retrieve record (last record, GivenNumber = -1) and givenQty should <= RetrieveNumber
        DisbursementLog currentRetrieve = (from x in ctx.DisbursementLogs
                                            where ((x.ItemID == itemID) && (x.DepartmentID == departmentID) && (x.GivenNumber == -1))
                                            select x).ToList().LastOrDefault();
        //DisbursementLog currentRetrieve = ctx.DisbursementLogs.Where
        //    (x => x.ItemID.Equals(itemID) && x.DepartmentID.Equals(departmentID) && x.GivenNumber.Equals(-1)).ToList().LastOrDefault();
        if (currentRetrieve == null)
            return -1;      // cannot find Retrieve
        if (currentRetrieve.RetrivedNumber < giveQty)
            return -22;     // givenQty > RetrievedNumber

        // Get the LAST record means the most recent one, RetrievedNumber equals -1 means it's a Give Action
        DisbursementLog updateGiveLog = (from x in ctx.DisbursementLogs
                                            where ((x.ItemID == itemID) && (x.DepartmentID == departmentID) && (x.RetrivedNumber == -1))
                                            select x).ToList().LastOrDefault();
        //DisbursementLog updateGiveLog = ctx.DisbursementLogs.Where
        //    (x => x.ItemID.Equals(itemID) && x.DepartmentID.Equals(departmentID) && x.RetrivedNumber.Equals(-1)).ToList().LastOrDefault();
        if (updateGiveLog == null)
        {
            // if cannot find DisbursementLog, create one
            updateGiveLog = new DisbursementLog();
            updateGiveLog.ItemID = itemID;
            updateGiveLog.DepartmentID = departmentID;
            ctx.DisbursementLogs.Add(updateGiveLog);
        }
        // Set Date    
        updateGiveLog.DateTime = DateTime.Now;
        // Set NeededNumber to -1 because Give action cares about Retrieve rather than Needed
        updateGiveLog.NeededNumber = -1;
        // Set GivenNumber to givenQty
        updateGiveLog.GivenNumber = giveQty;

        // Set RetrievedNumber to -1 to indicate this is a giveLog
        updateGiveLog.RetrivedNumber = -1;
        updateGiveLog.Flag = "Progressing Give";

        // SaveChanges
        int res = -100;
        try
        {
            res = ctx.SaveChanges();
            return res;
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        return res;
    }

    /// <summary>
    /// When department Approve a Request, 
    /// * update the Outstanding record by accumulate requestQty
    /// * update the recent Transcation record also by accumulate requestQty
    /// </summary>
    /// <param name="itemID"></param>
    /// <param name="departmentID"></param>
    /// <param name="requestQty"></param>
    /// <returns></returns>
    public  int requestUpdateOutstanding(string itemID, string departmentID, int requestQty)
    {
        ctx = new Team5ADProjectEntities();

        // Update OutstandingRequest
        OutstandingRequest updateOutstandingRequest = ctx.OutstandingRequests.Where(x => x.DepartmentID == departmentID && x.ItemID == itemID).FirstOrDefault();
        if (updateOutstandingRequest == null)
        {
            // if no record, create one
            updateOutstandingRequest = new OutstandingRequest();
            updateOutstandingRequest.DepartmentID = departmentID;
            updateOutstandingRequest.ItemID = itemID;
            updateOutstandingRequest.OutstandingQty = 0;
            ctx.OutstandingRequests.Add(updateOutstandingRequest);
        }
        updateOutstandingRequest.OutstandingQty += requestQty;

        // Update TranscationLog
        TransactionLog updateTranscationLog = (from x in ctx.TransactionLogs
                                                where ((x.ItemID == itemID) && (x.DepartmentID == departmentID))
                                                        select x).ToList().LastOrDefault();
        if (updateTranscationLog == null)
        {
            // if no record, create one
            updateTranscationLog = new TransactionLog();
            updateTranscationLog.ItemID = itemID;
            updateTranscationLog.DepartmentID = departmentID;
            updateTranscationLog.RequestQty = 0;
            ctx.TransactionLogs.Add(updateTranscationLog);
        }
        updateTranscationLog.Flag = "Request";
        updateTranscationLog.DateTime = DateTime.Now;
        updateTranscationLog.RequestQty += requestQty;

        // SaveChanges
        int res = -100;
        try
        {
            // returns the number of state entries written to the underlying database
            res = ctx.SaveChanges();
            return res;
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        return res;
    }

    /// <summary>
    /// When department Receive items, so this is a private method and access by Receive method
    /// * update the Outstanding record by minus receiveQty
    /// * update All the relative Transaction record:
    ///     1. set receiveQty to Min{receiveQty, requestQty}
    ///     2. for those fullfilled Transaction (receiveQty = requestQty), set (Flag fullfilled) just delete it.
    /// </summary>
    /// <param name="itemID"></param>
    /// <param name="departmentID"></param>
    /// <param name="receiveQty"></param>
    /// <returns></returns>
    private int receiveUpdateOutstanding(string itemID, string departmentID, int receiveQty)
    {
        ctx = new Team5ADProjectEntities();

        // Update OutstandingRequest
        OutstandingRequest updateOutstandingRequest = ctx.OutstandingRequests.Where
            (x => x.ItemID.Equals(itemID) && x.DepartmentID.Equals(departmentID)).FirstOrDefault();
        if (updateOutstandingRequest == null)
            return -121;     // cannot find return -12;
        if (updateOutstandingRequest.OutstandingQty >= receiveQty)
            updateOutstandingRequest.OutstandingQty -= receiveQty;
        else
            return -22;      // givenQty > needed

        // Update All relative TranscationLog
        List<TransactionLog> transcationLogs = (from x in ctx.TransactionLogs
                                                where ((x.ItemID == itemID) && (x.DepartmentID == departmentID))
                                                select x).ToList();
        int qty = receiveQty;
        foreach (TransactionLog log in transcationLogs)
        {
            if (qty == 0) break;
            if (log.ReceiveQty == null) log.ReceiveQty = 0;
            int putQty = (int) (log.RequestQty - log.ReceiveQty);
            putQty = Math.Min(putQty, qty);
            log.ReceiveQty += putQty;
            if (log.ReceiveQty == log.RequestQty)
                log.Flag = "Fullfilled";
            qty -= putQty;
        }
        // Delete All Fullfilled Transaction
        // Since we only need one Waiting, so delete duplicated
        foreach (TransactionLog log in transcationLogs)
            if ((log.Flag == "Fullfilled") || (log.Flag == "Waiting"))
                ctx.TransactionLogs.Remove(log);

        // Insert a New Transaction Log for next deal
        TransactionLog newDeal = new TransactionLog();
        newDeal.DepartmentID = departmentID;
        newDeal.ItemID = itemID;
        newDeal.Flag = "Waiting";
        newDeal.RequestQty = 0;
        ctx.TransactionLogs.Add(newDeal);

        // SaveChanges
        int res = -100;
        try
        {
            // returns the number of state entries written to the underlying database
            res = ctx.SaveChanges();
            return res;
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        return res;
    }

    /// <summary>
    /// Department confirm with Clerk and sign off
    /// This means the end of the deal, so we have to update the "OutstandingRequest" and "InStock" of "Item"
    /// We also need to start a new deal
    /// </summary>
    /// <param name="itemID"></param>
    /// <param name="departmentID"></param>
    /// <param name="receiveQty"></param>
    /// <returns></returns>
    public int Receive(string itemID, string departmentID, int receiveQty)
    {
        ctx = new Team5ADProjectEntities();

        // * actualGivenQty should <= GivenQty of this log
        DisbursementLog currentGiven = (from x in ctx.DisbursementLogs
                                        where ((x.ItemID == itemID) && (x.DepartmentID == departmentID) && (x.RetrivedNumber == -1))
                                        select x).ToList().LastOrDefault();

        if (currentGiven == null)
            return -11;     // cannot find return -11
        if (receiveQty > currentGiven.GivenNumber)
            return -21;     // actualGivenQty > currentGiven

        // * Update OutstandingRequest
        int updateRes = receiveUpdateOutstanding(itemID, departmentID, receiveQty);
        if (updateRes < 0)
            return updateRes;   // return wrong info from receiveUpdateOutstanding

        // * Update "InStock" of "Item"
        Item updateItem = ctx.Items.Where(x => x.ItemID.Equals(itemID)).FirstOrDefault();
        if (updateItem == null)
            return -13;     // cannot find return -13;
        if (updateItem.InStock >= receiveQty)
            updateItem.InStock -= receiveQty;
        else
            return -23;     // givenQty > InStock

        // Receive means confirmation of Clerk and Department
        // This means end of current deal and start of next deal
        // Insert a new RetrieveLog and a new GiveLog for next deal 
        // So that following Give and Retrieve will use these two records

        // new Retrieve
        DisbursementLog newRetrieveLog = new DisbursementLog();
        newRetrieveLog.ItemID = itemID;
        newRetrieveLog.DepartmentID = departmentID;
        newRetrieveLog.GivenNumber = -1;        // GivenNumber equals -1 means this is a retrieve log
        newRetrieveLog.RetrivedNumber = -100;   // RetrivedNumber equals -100 means this is a new retrieve log
        newRetrieveLog.Flag = "New Retrieve";
        // new Give
        DisbursementLog newGiveLog = new DisbursementLog();
        newGiveLog.ItemID = itemID;
        newGiveLog.DepartmentID = departmentID;
        newGiveLog.RetrivedNumber = -1;         // RetrivedNumber equals -1 means this is a give log
        newGiveLog.GivenNumber = -100;          // GivenNumber equals -100 means this is a new give log
        newGiveLog.Flag = "New Give";

        DisbursementLog lastGiven = (from x in ctx.DisbursementLogs
                                        where ((x.ItemID == itemID) && (x.DepartmentID == departmentID) && (x.RetrivedNumber == -1))
                                        select x).ToList().LastOrDefault();
        DisbursementLog lastRetrieve = (from x in ctx.DisbursementLogs
                                            where ((x.ItemID == itemID) && (x.DepartmentID == departmentID) && (x.GivenNumber == -1))
                                            select x).ToList().LastOrDefault();
        lastRetrieve.Flag = "Confirmed";
        lastGiven.Flag = "Confirmed";

        ctx.DisbursementLogs.Add(newRetrieveLog);
        ctx.DisbursementLogs.Add(newGiveLog);

        // SaveChanges
        int res = -100;
        try
        {
            // returns the number of state entries written to the underlying database
            // normally should be 4
            res = ctx.SaveChanges();
            // close current Retrieve and Give
            return res;
        }
        catch (Exception e)
        {
            Console.WriteLine(e.ToString());
        }
        return res;
    }

    /// <summary>
    /// Give a startDate and an endDate, to get all the records of Clerk's action 
    /// </summary>
    /// <param name="start"></param>
    /// <param name="end"></param>
    /// <returns>
    /// It returns a HistoryDisbursement Object, which contains all kinds of Summary and Log
    /// </returns>
    public HistoryDisbursement View(DateTime start, DateTime end)
    {
        return new HistoryDisbursement(start, end);
    }
    //public HistoryDisbursement View(DateTime start, DateTime end)
    //{
    //    ctx = new Team5ADProjectEntities();

    //    //List<DisbursementLog> log = ctx.DisbursementLogs.Where(x => x.DateTime.CompareTo(start).Equals(1)).ToList();
    //    var qry = from x in ctx.DisbursementLogs where x.DateTime >= start && x.DateTime <= end select x;
    //    List<DisbursementLog> logList = qry.ToList();
    //    HistoryDisbursement result = new HistoryDisbursement();
    //    foreach (DisbursementLog log in logList)
    //        // if both GivenNumber and RetrievedNumber are < 0 (one is -1 while another is -100)
    //        // it means that this is a tempory Log that waiting for update and should not show in History
    //        // if both GivenNumber and RetrievedNumber are > 0
    //        // it means that you are facing a fake database
    //        if ((log.GivenNumber > 0) ^ (log.RetrivedNumber > 0))
    //        {
    //            // check if value of this key is null, and instanciate new one if null
    //            result.checkKey(log.ItemID, log.DepartmentID);
    //            // record log
    //            result.LogByItem[log.ItemID].Add(log);
    //            result.LogByDepartment[log.DepartmentID].Add(log);
    //            result.GroupLogByDepartment[log.DepartmentID][log.ItemID].Add(log);

    //            // summary
    //            // Because it calculate with start and end instead of one deal, so accumulating
    //            if (log.RetrivedNumber < 0)        
    //            {
    //                // Give
    //                // By Item
    //                result.SummaryByItem[log.ItemID].GivenNumber += log.GivenNumber;
    //                // By Department and Item
    //                result.SummaryByDepartment[log.DepartmentID][log.ItemID].GivenNumber += log.GivenNumber;
    //            }
    //            else
    //            {
    //                // Retrieve
    //                // By Item
    //                result.SummaryByItem[log.ItemID].NeededNumber += log.NeededNumber;
    //                result.SummaryByItem[log.ItemID].RetrivedNumber += log.RetrivedNumber;
    //                // By Department and Item
    //                result.SummaryByDepartment[log.DepartmentID][log.ItemID].NeededNumber += log.NeededNumber;
    //                result.SummaryByDepartment[log.DepartmentID][log.ItemID].RetrivedNumber += log.RetrivedNumber;
    //            }
    //        }

    //    return result;
    //}
}

