using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UnitTestForCoreLogic.CoreLayer
{

    class HistoryDisbursement
    {
        // key ItemID
        Dictionary<string, DisbursementLog> summaryByItem;
        // key DepartmentID, key ItemID
        Dictionary<string, Dictionary<string, DisbursementLog>> summaryByDepartment;

        // key ItemID
        Dictionary<string, List<DisbursementLog>> logByItem;
        // key DepartmentID
        Dictionary<string, List<DisbursementLog>> logByDepartment;
        // key DepartmentID, key ItemID
        Dictionary<string, Dictionary<string, List<DisbursementLog>>> groupLogByDepartment;
        
        public HistoryDisbursement()
        {
            summaryByItem = new Dictionary<string, DisbursementLog>();
            summaryByDepartment = new Dictionary<string, Dictionary<string, DisbursementLog>>();
            logByItem = new Dictionary<string, List<DisbursementLog>>();
            logByDepartment = new Dictionary<string, List<DisbursementLog>>();
            groupLogByDepartment = new Dictionary<string, Dictionary<string, List<DisbursementLog>>>();
        }

        public HistoryDisbursement(DateTime start, DateTime end)
        {
            summaryByItem = new Dictionary<string, DisbursementLog>();
            summaryByDepartment = new Dictionary<string, Dictionary<string, DisbursementLog>>();
            logByItem = new Dictionary<string, List<DisbursementLog>>();
            logByDepartment = new Dictionary<string, List<DisbursementLog>>();
            groupLogByDepartment = new Dictionary<string, Dictionary<string, List<DisbursementLog>>>();

            GetHistory(start, end);
        }

        public Dictionary<string, DisbursementLog> SummaryByItem
        {
            get { return summaryByItem; }
            //set { summaryByItem = value; }
        }
        public Dictionary<string, Dictionary<string, DisbursementLog>> SummaryByDepartment
        {
            get { return summaryByDepartment; }
            //set { summaryByDepartment = value; }
        }


        public Dictionary<string, List<DisbursementLog>> LogByItem {
            get { return logByItem; }
            //set { logByItem = value; }
        }
        public Dictionary<string, List<DisbursementLog>> LogByDepartment
        {
            get { return logByDepartment; }
            //set { logByDepartment = value; }
        }
        public Dictionary<string, Dictionary<string, List<DisbursementLog>>> GroupLogByDepartment
        {
            get { return groupLogByDepartment; }
            //set { groupLogByDepartment = value; }
        }

        // This is to check whether the value of parameter keys in the Dictionary is null and instantiate it if null
        public int checkKey(string itemID, string departmentID)
        {
             
            // logByItem
            if (!logByItem.ContainsKey(itemID))
                logByItem.Add(itemID, new List<DisbursementLog>());

            // logByDepartment
            if (!logByDepartment.ContainsKey(departmentID))
                logByDepartment.Add(departmentID, new List<DisbursementLog>());

            // groupLogByDepartment
            if (!groupLogByDepartment.ContainsKey(departmentID))
                groupLogByDepartment.Add(departmentID, new Dictionary<string, List<DisbursementLog>>());
            if (!groupLogByDepartment[departmentID].ContainsKey(itemID))
                groupLogByDepartment[departmentID].Add(itemID ,new List<DisbursementLog>());

            // summaryByItem
            if (!summaryByItem.ContainsKey(itemID))
            {
                // Initiate summary
                DisbursementLog log = new DisbursementLog();
                log.ItemID = itemID;
                log.DepartmentID = departmentID;
                log.NeededNumber = 0;
                log.RetrivedNumber = 0;
                log.GivenNumber = 0;
                summaryByItem.Add(itemID, log);
            }

            // summaryByDepartment
            if (!summaryByDepartment.ContainsKey(departmentID))
                summaryByDepartment.Add(departmentID, new Dictionary<string, DisbursementLog>());
            if (!summaryByDepartment[departmentID].ContainsKey(itemID))
            {
                // Initiate summary
                DisbursementLog log = new DisbursementLog();
                log.ItemID = itemID;
                log.DepartmentID = departmentID;
                log.NeededNumber = 0;
                log.RetrivedNumber = 0;
                log.GivenNumber = 0;
                summaryByDepartment[departmentID].Add(itemID, log);
            }

            return 0;
        }

        public int GetHistory(DateTime start, DateTime end)
        {
            Team5ADProjectEntities ctx = new Team5ADProjectEntities();

            var qry = from x in ctx.DisbursementLogs where x.DateTime >= start && x.DateTime <= end select x;
            List<DisbursementLog> logList = qry.ToList();
            foreach (DisbursementLog log in logList)
                // if both GivenNumber and RetrievedNumber are < 0 (one is -1 while another is -100)
                // it means that this is a tempory Log that waiting for update and should not show in History
                // if both GivenNumber and RetrievedNumber are > 0
                // it means that you are facing a fake database

                // * TODO Here we can use Flag to decide whether to show or not (hide Waiting and Confirmed)
                if ((log.GivenNumber > 0) ^ (log.RetrivedNumber > 0))
                {
                    // check if value of this key is null, and instanciate new one if null
                    this.checkKey(log.ItemID, log.DepartmentID);
                    // record log
                    this.LogByItem[log.ItemID].Add(log);
                    this.LogByDepartment[log.DepartmentID].Add(log);
                    this.GroupLogByDepartment[log.DepartmentID][log.ItemID].Add(log);

                    // summary
                    // Because it calculate with start and end instead of one deal, so accumulating
                    if (log.RetrivedNumber < 0)
                    {
                        // Give
                        // By Item
                        this.SummaryByItem[log.ItemID].GivenNumber += log.GivenNumber;
                        // By Department and Item
                        this.SummaryByDepartment[log.DepartmentID][log.ItemID].GivenNumber += log.GivenNumber;
                    }
                    else
                    {
                        // Retrieve
                        // By Item
                        this.SummaryByItem[log.ItemID].NeededNumber += log.NeededNumber;
                        this.SummaryByItem[log.ItemID].RetrivedNumber += log.RetrivedNumber;
                        // By Department and Item
                        this.SummaryByDepartment[log.DepartmentID][log.ItemID].NeededNumber += log.NeededNumber;
                        this.SummaryByDepartment[log.DepartmentID][log.ItemID].RetrivedNumber += log.RetrivedNumber;
                    }
                }

            return 0;
        }

    }

    //struct Key
    //{
    //    public readonly string dimension1;
    //    public readonly string dimension2;
    //    public Key(string d1, string d2)
    //    {
    //        dimension1 = d1; dimension2 = d2;
    //    }

    //}
}
