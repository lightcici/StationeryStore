using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;


/// <summary>
/// Summary description for Work
/// </summary>
public class Work
{
    static Team5ADProjectEntities ctx = new Team5ADProjectEntities();
    List<ItemDiscrepancyModel> idlist;
    List<ItemModel> ilist;
    List<Decimal> pricelist;
    Discrepancy discrepancy;
    Item item;
    public Work()
    {

    }

    public static bool Authenticate(string userId, string pwd)
    {
        Staff s = ctx.Staffs.Where(x => x.UserID == userId && x.Password == pwd).ToList().FirstOrDefault();
        if (s != null)
        {
            return true;
        }
        else return false;
    }

    public static bool delegated(string userId)
    {
        Delegation de = ctx.Delegations.Where(x => x.CoveringHeadID == userId && x.StartDate <= DateTime.Today && x.EndDate >= DateTime.Today).ToList().FirstOrDefault();
        if (de != null)
        {
            return true;
        }
        else return false;
    }

    public static bool delegateTo(string userId)
    {
        Delegation de = ctx.Delegations.Where(x => x.DepartmentHeadID == userId && x.StartDate <= DateTime.Today && x.EndDate >= DateTime.Today).ToList().FirstOrDefault();
        if (de != null)
        {
            return true;
        }
        else return false;
    }

    public static Delegation getDlgtInfo(string userId)
    {
        return ctx.Delegations.Where(x => x.DepartmentHeadID == userId && x.StartDate <= DateTime.Today && x.EndDate >= DateTime.Today).ToList().FirstOrDefault();
    }

    public List<Staff> getDptSfInfo(string userId)
    {
        string deptId = Work.getUser(userId).DepartmentID;
        List<Staff> st1 = new List<Staff>();
        st1 = ctx.Staffs.Where(x => x.DepartmentID == deptId).ToList();
        return st1;
    }
    public static string getDeptHeadId(string deptId)
    {
        return ctx.Staffs.Where(x => x.DepartmentID == deptId && x.Role == "DeptHead").ToList().FirstOrDefault().UserID;
    }

    public static Request getRequestById(string id)
    {
        return ctx.Requests.Where(x => x.RequestID == id).ToList().FirstOrDefault();
    }
    public static List<Item> getAllItems()
    {
        return ctx.Items.ToList();
    }
    public static List<Item> getFoundItems(string text)
    {
        return ctx.Items.Where(x => x.Category.Contains(text) || x.Description.Contains(text)).ToList();
    }

    public static Item getItem(string itemId)
    {
        return ctx.Items.Where(x => x.ItemID == itemId).FirstOrDefault();
    }

    public static void createRequest(Request rq)
    {

        ctx.Requests.Add(rq);
        ctx.SaveChanges();


    }

    public static string getRequestId(string deptId)
    {
        Request rq = ctx.Requests.Where(x => x.RequestID.Contains(deptId)).OrderByDescending(y => y.RequestDate).FirstOrDefault();
        if (rq == null) { return null; }
        else
        {
            return rq.RequestID;
        }
    }

    public static Staff getUser(string id)
    {
        return ctx.Staffs.Where(x => x.UserID == id).FirstOrDefault();
    }

    public static void createRequestDetail(RequestDetail rd)
    {
        ctx.RequestDetails.Add(rd);
        ctx.SaveChanges();
    }

    public static void updateOutstangQty(string deptId, string itemId, int qty)
    {
        OutstandingRequest or = ctx.OutstandingRequests.Where(x => x.DepartmentID == deptId && x.ItemID == itemId).FirstOrDefault();
        if (or == null)
        {
            or = new OutstandingRequest();
            or.DepartmentID = deptId;
            or.ItemID = itemId;
            or.OutstandingQty = qty;
            ctx.OutstandingRequests.Add(or);
            ctx.SaveChanges();
        }
        else
        {
            or.OutstandingQty += qty;
            ctx.SaveChanges();
        }
    }

    public static List<Request> getRequest(string userId)
    {

        return ctx.Requests.Where(x => x.UserID == userId).OrderByDescending(y => y.RequestDate).ToList();

    }

    public static List<Request> getDeptRequests(string userId)
    {
        string deptId = getUser(userId).DepartmentID;
        return ctx.Requests.Where(x => x.Staff.DepartmentID == deptId).OrderByDescending(y => y.RequestDate).ToList();
    }



    public static List<RequestDetail> getRequestDetail(string id)
    {
        return ctx.RequestDetails.Where(x => x.RequestID == id).OrderByDescending(y => y.Request.RequestDate).ToList();
    }

    public static List<String> getRequestSatus()
    {
        var list = ctx.RequestDetails.GroupBy(y => y.Status).Select(x => x.FirstOrDefault()).ToList();
        return list.Select(o => o.Status).ToList();
    }

    public static List<RqHistory> getRqHistory(string userId)
    {
        List<RqHistory> hList = new List<RqHistory>();
        List<Request> rqList = Work.getDeptRequests(userId);

        foreach (Request rq in rqList)
        {
            string status = null;
            List<RequestDetail> rdList = Work.getRequestDetail(rq.RequestID);
            if (rdList[0].Status != "Cancelled")
            {
                if (rdList[0].Status == "InProgress" || rdList[0].Status == "Completed" || rdList[0].Status == "Unfulfilled")
                {
                    status = "Approved";
                }
                else
                {
                    status = rdList[0].Status;
                }
                RqHistory h = new RqHistory(rq.RequestID, rq.RequestDate, Work.getUser(rq.UserID).Name, status);
                hList.Add(h);
            }

        }
        return hList;
    }

    public static List<RqDetail> getRqDetail(string rqId)
    {
        List<RequestDetail> rdList = Work.getRequestDetail(rqId);

        List<RqDetail> deList = new List<RqDetail>();
        foreach (RequestDetail rd in rdList)
        {

            RqDetail de = new RqDetail(rqId, rd.ItemID, rd.Request.RequestDate, rd.Item.Description, rd.Item.UOM, rd.RequestQty, rd.Status, rd.Request.Comment);
            deList.Add(de);

        }
        return deList;
    }

    public static void CancelRequest(string id)
    {
        List<RequestDetail> list = ctx.RequestDetails.Where(x => x.RequestID == id).ToList();
        foreach (RequestDetail rd in list)
        {
            rd.Status = "Cancelled";
            ctx.SaveChanges();
        }

    }

    public static void DeleteRequestItem(string rqId, string itemId)
    {
        RequestDetail rd = ctx.RequestDetails.Where(x => x.RequestID == rqId && x.ItemID == itemId).ToList().First();
        ctx.RequestDetails.Remove(rd);
        ctx.SaveChanges();
    }

    public static void UpdateRqQty(string rqId, string itemId, int qty)
    {
        RequestDetail rd = ctx.RequestDetails.Where(x => x.RequestID == rqId && x.ItemID == itemId).ToList().First();
        rd.RequestQty = qty;
        ctx.SaveChanges();

    }

    public static void ApproveRequest(string rqId, string comment)
    {
        Request rq = ctx.Requests.Where(x => x.RequestID == rqId).ToList().First();
        rq.Comment = comment;
        List<RequestDetail> list = Work.getRequestDetail(rqId);
        foreach (RequestDetail rd in list)
        {
            rd.Status = "InProgress";
            ctx.SaveChanges();
            string deptId = rq.Staff.DepartmentID;
            Work.updateOutstangQty(deptId, rd.ItemID, rd.RequestQty);

        }
    }

    public static void RejecteRequest(string rqId, string comment)
    {
        Request rq = ctx.Requests.Where(x => x.RequestID == rqId).ToList().First();
        rq.Comment = comment;
        List<RequestDetail> list = Work.getRequestDetail(rqId);
        foreach (RequestDetail rd in list)
        {
            rd.Status = "Rejected";
            ctx.SaveChanges();

        }


    }

    public static void AllocateItems(string rqId, string itemId, int qty)
    {
        RequestDetail rd = ctx.RequestDetails.Where(x => x.RequestID == rqId && x.ItemID == itemId).ToList().FirstOrDefault();
        int result = rd.RetrievedQty + qty;
        if (result == rd.RequestQty)
        {
            rd.Status = "Completed";
        }
        else
        {
            rd.Status = "Unfulfilled";
        }
        rd.RetrievedQty = result;
        ctx.SaveChanges();
    }
    /// <summary>
    /// the param will be added with retrievenumber
    /// first param is bySummary, second param is byDepartment
    /// the result will be number of retrieveLog
    /// </summary>
    /// <param name="bySummary"></param>
    /// <param name="byDepartment"></param>
    /// <returns></returns>
    public static int GetRetrieveLog(List<DisbursementModel> bySummary, List<DisbursementModel> byDepartment)
    {
        HistoryDisbursement finder = new HistoryDisbursement();
        int result = finder.GetProgressingLog();
        if (result != 0)
        {
            foreach (DisbursementModel dm in bySummary)
                if (finder.SummaryByItem.ContainsKey(dm.ItemID))
                    dm.RetrivedNumber = finder.SummaryByItem[dm.ItemID].RetrivedNumber;
            foreach (DisbursementModel dm in byDepartment)
                if (finder.SummaryByDepartment.ContainsKey(dm.DepartmentID))
                    if (finder.SummaryByDepartment[dm.DepartmentID].ContainsKey(dm.ItemID))
                    {
                        dm.RetrivedNumber = finder.SummaryByDepartment[dm.DepartmentID][dm.ItemID].RetrivedNumber;
                        dm.GivenNumber = finder.SummaryByDepartment[dm.DepartmentID][dm.ItemID].GivenNumber;
                    }
        }
        return result;
    }

    //public int GetRetrieveLogBySummary(List<DisbursementModel> bySummary)
    //{
    //    var qry = from x in ctx.DisbursementLogs where x.Flag.Contains("Progressing Retrieve") select x;
    //    Dictionary<string, DisbursementLog> dic = new Dictionary<string, DisbursementLog>();
    //    // group by item
    //    foreach (DisbursementLog log in qry.ToList())
    //    {
    //        if (!dic.ContainsKey(log.ItemID))
    //            dic.Add(log.ItemID, log);
    //        else
    //            dic[log.ItemID].RetrivedNumber += log.RetrivedNumber;
    //    }
    //    int result = dic.Values.Count();
    //    if (result != 0)
    //    {
    //        foreach (DisbursementModel dm in bySummary)
    //        {
    //            dm.RetrivedNumber = dic[dm.ItemID].RetrivedNumber;
    //        }
    //    }
    //    return result;
    //}
    //public static List<DisbursementModel> GetRetrieveLogByDepartment(List<DisbursementModel> byDepartment)
    //{
    //    List<DisbursementModel> result = new List<DisbursementModel>();
    //    var qry = from x in ctx.DisbursementLogs where x.Flag.Contains("Progressing Retrieve") select x;
    //    // for every department and item, should be only one log in "Progressing"

    //    foreach (DisbursementLog log in qry.ToList())
    //    {
    //        DisbursementModel dm = new DisbursementModel(log.DepartmentID, log.Department.DepartmentName, log.ItemID, log.Item.Description, log.NeededNumber);
    //        dm.RetrivedNumber = log.RetrivedNumber;
    //        result.Add(dm);
    //    }
    //    return result;
    //}
	
    public static List<DisbursementModel> viewRequestSummary()
    {
        List<DisbursementModel> list = new List<DisbursementModel>();
        var q = from O in ctx.OutstandingRequests
                join I in ctx.Items on O.ItemID equals I.ItemID
                group O by new { O.ItemID, I.Description, I.InStock, I.BinNumber } into g
                select new
                {
                    ItemID = g.Key.ItemID,
                    Description = g.Key.Description,
                    Needed = g.Sum(o => o.OutstandingQty),
                    InStock = g.Key.InStock,
                    g.Key.BinNumber
                };
        foreach (var a in q.ToList())
        {
            DisbursementModel dm = new DisbursementModel(a.ItemID, a.Description, a.Needed, a.InStock, a.BinNumber);
            list.Add(dm);
        }
        return list;
    }

    public static List<DisbursementModel> viewRequestByDept()
    {
        List<DisbursementModel> list = new List<DisbursementModel>();
        var q = from O in ctx.OutstandingRequests
                orderby O.Department.DepartmentName
                select new
                {
                    DepartmentID = O.DepartmentID,
                    Department = O.Department.DepartmentName,
                    ItemID = O.ItemID,
                    Description = O.Item.Description,
                    Needed = O.OutstandingQty

                };
        foreach (var a in q.ToList())
        {
            DisbursementModel dm = new DisbursementModel(a.DepartmentID, a.Department, a.ItemID, a.Description, a.Needed);
            list.Add(dm);
        }
        return list;
    }

    public Decimal getMaxPrice(string itemId)
    {
        var sql = from s in ctx.SupplyDetails where s.ItemID == itemId select s.Price;
        pricelist = sql.ToList();
        Decimal maxPrice = pricelist[0];
        for (int i = 0; i < 3; i++)
        {
            if (pricelist[0] < pricelist[1])
            {
                maxPrice = pricelist[1];
                if (maxPrice < pricelist[2])
                {
                    maxPrice = pricelist[2];
                }
            }
        }
        return maxPrice;
    }
    public List<ItemModel> showAllItems()
    {
        var sql = from i in ctx.Items
                  select new ItemModel
                  {
                      ItemID = i.ItemID,
                      Category = i.Category,
                      Description = i.Description,
                      ReorderLevel = i.ReorderLevel,
                      InStock = i.InStock,
                      GUOM = i.UOM,
                  };
        ilist = sql.ToList();
        return ilist;
    }

    public List<ItemModel> searchItems(string category)
    {
        var sql = from i in ctx.Items
                  where i.Category.Contains(category) || i.Description.Contains(category)
                  select new ItemModel
                  {
                      ItemID = i.ItemID,
                      Category = i.Category,
                      Description = i.Description,
                      ReorderLevel = i.ReorderLevel,
                      InStock = i.InStock,
                      GUOM = i.UOM,
                  };
        ilist = sql.ToList();
        return ilist;
    }
    public List<ItemDiscrepancyModel> getAllDiscrepancies(string selectedValue)
    {
        if (!selectedValue.Equals("ShowAll"))
        {
            var sql = from i in ctx.Items
                      join d in ctx.Discrepancies on i.ItemID equals d.ItemID
                      where d.Status == selectedValue
                      select new ItemDiscrepancyModel
                      {
                          DiscrepancyId = d.DiscrepancyID,
                          ItemCode = d.ItemID,
                          Description = i.Description,
                          Quantity = d.Quantity,
                          Reason = d.Reason,
                          Status = d.Status,
                      };
            idlist = sql.ToList();
        }
        else if (selectedValue.Equals("ShowAll"))
        {
            var sql = from i in ctx.Items
                      join d in ctx.Discrepancies on i.ItemID equals d.ItemID
                      select new ItemDiscrepancyModel
                      {
                          DiscrepancyId = d.DiscrepancyID,
                          ItemCode = d.ItemID,
                          Description = i.Description,
                          Quantity = d.Quantity,
                          Reason = d.Reason,
                          Status = d.Status,
                      };
            idlist = sql.ToList();
        }
        return idlist;
    }

    public string getMaxDiscrepancyId()
    {
        var sql = from d in ctx.Discrepancies orderby d.DiscrepancyID select d.DiscrepancyID;
        List<string> li = sql.ToList();
        List<int> newli = li.Select(x => int.Parse(x)).ToList();
        return newli.Max().ToString();
    }

    public Staff getSpecificStaff(string staffId)
    {
        var sql = from s in ctx.Staffs where s.UserID == staffId select s;
        return sql.FirstOrDefault();
    }

    public int saveDiscrepancy(string discrepancyId, int quantity, string reason, string status, Item item, Staff staff, DateTime now)
    {
        Discrepancy discrepancy = new Discrepancy();
        discrepancy.DiscrepancyID = discrepancyId;
        discrepancy.Quantity = quantity;
        discrepancy.Reason = reason;
        discrepancy.Status = status;
        discrepancy.Item = item;
        discrepancy.Staff = staff;
        discrepancy.Date = now;
        ctx.Discrepancies.Add(discrepancy);
        return ctx.SaveChanges();
    }

    public Discrepancy getDiscrepancy(string id)
    {
        var sql = from d in ctx.Discrepancies where d.DiscrepancyID == id select d;
        discrepancy = sql.FirstOrDefault();
        return discrepancy;
    }

    public int updateDiscrepancy(string id, string status)
    {
        discrepancy = getDiscrepancy(id);
        var sql = from i in ctx.Items where i.ItemID == discrepancy.ItemID select i;
        item = sql.FirstOrDefault();
        if (status.Equals("Approved"))
        {
            discrepancy.Status = "Approved";
            item.InStock = item.InStock + discrepancy.Quantity;
        }
        else if (status.Equals("Rejected"))
        {
            discrepancy.Status = "Rejected";
        }
        return ctx.SaveChanges();
    }

    public List<Discrepancy> getSpecificDiscrepancies()
    {
        var sql = from d in ctx.Discrepancies
                  join i in ctx.Items on d.ItemID equals i.ItemID
                  join s in ctx.SupplyDetails on i.ItemID equals s.ItemID
                  where s.Price > 250 && d.Status == "Pending Approval"
                  select d;
        return sql.ToList();
    }

    //method
    public static List<Department> GetDepartment()
    {

        List<Department> departmentlist = new List<Department>();
        ////foreach(Supplier sup in model.Supplier)
        ////{

        ////    supplierlist.Add(sup);
        ////}

        departmentlist = ctx.Departments.ToList<Department>();

        return departmentlist;


    }
    public static List<Department> GetCollectionPoint()
    {

        List<Department> departmentlist = new List<Department>();
        ////foreach(Supplier sup in model.Supplier)
        ////{

        ////    supplierlist.Add(sup);
        ////}

        departmentlist = ctx.Departments.GroupBy(x => new { x.Collection_Point }).Select(x => x.FirstOrDefault()).ToList<Department>();

        return departmentlist;


    }




    public static void UpdateDepartment(string DepartmentCode, string departmentname, string contact,
        string telephone, string headname, string collectionPoint, string repName)
    {


        //List<Department> departmentlist = new List<Department>();
        //departmentlist = ctx.Departments.Where(department => department.DepartmentID == DepartmentCode).ToList<Department>();
        //foreach (Department dept in departmentlist)
        //{
        //    dept.DepartmentName = departmentname;
        //    dept.ContactName = contact;
        //    dept.Telephone = telephone;
        //    dept.HeadName = headname;
        //    dept.Collection_Point = collectionPoint;
        //    dept.RepresentativeName = repName;

        //}
        //ctx.SaveChanges();
    }

    public static void DeleteDepartment(string departmentCode)
    {

        List<Department> departmentlist = new List<Department>();
        departmentlist = ctx.Departments.Where(department => department.DepartmentID == departmentCode).ToList<Department>();

        foreach (Department dept in departmentlist)
        {
            if (dept.DepartmentID == departmentCode)
            {
                ctx.Departments.Remove(dept);
            }
        }
        ctx.SaveChanges();
    }

    //Method name: CreateSupplier
    //CreateSupplier(SupplierCode, SupplierName, ContactName, PhoneNo, FaxNo, Address, GSTNo); 
    //input arguments are SupplierCode, SupplierName, ContactName, PhoneNo, FaxNo, Address, GSTNo
    //return type: void

    public static void CreateDepartment(string DepartmentCode, string departmentname, string contact,
        string telephone, string headname, string collectionPoint, string repName)
    {

        //List<Supplier> currentList = GetSupplier();
        //foreach(Supplier sup in currentList)
        //{
        //    if (sup.SupplierID==SupplierCode)
        //    {

        //        break; 
        //    }


        //Department toAddDepartment = new Department();


        //toAddDepartment.DepartmentID = DepartmentCode;
        //toAddDepartment.DepartmentName = departmentname;
        //toAddDepartment.ContactName = contact;
        //toAddDepartment.Telephone = telephone;

        //toAddDepartment.HeadName = headname;
        //toAddDepartment.Collection_Point = collectionPoint;
        //toAddDepartment.RepresentativeName = repName;

        //ctx.Departments.Add(toAddDepartment);
        //try
        //{
        //    ctx.SaveChanges();
        //}

        //catch (DbEntityValidationException ex)
        //{
        //    string errorMessages = string.Join("; ", ex.EntityValidationErrors.SelectMany(x => x.ValidationErrors).Select(x => x.ErrorMessage));
        //    throw new DbEntityValidationException(errorMessages);
        //}

    }
    //method
    public static List<Item> GetItems()
    {

        List<Item> itemlist = new List<Item>();
        ////foreach(Supplier sup in model.Supplier)
        ////{

        ////    supplierlist.Add(sup);
        ////}

        itemlist = ctx.Items.ToList<Item>();

        return itemlist;


    }

    public static List<Item> GetCategory()
    {

        List<Item> itemlist = new List<Item>();
        ////foreach(Supplier sup in model.Supplier)
        ////{

        ////    supplierlist.Add(sup);
        ////}

        itemlist = ctx.Items.GroupBy(x => new { x.Category }).Select(x => x.FirstOrDefault()).ToList<Item>();

        return itemlist;


    }



    public static void UpdateItem(string ItemCode, string description, string category,
        string reorderLevel, string reorderQty, string uom)
    {

        List<Item> itemlist = new List<Item>();

        itemlist = ctx.Items.Where(item => item.ItemID == ItemCode).ToList<Item>();
        foreach (Item item in itemlist)
        {
            item.Description = description;
            item.Category = category;
            item.ReorderLevel = Convert.ToInt32(reorderLevel);
            item.ReorderQty = Convert.ToInt32(reorderQty);
            item.UOM = uom;

        }
        ctx.SaveChanges();
    }

    public static void DeleteItem(string itemCode)
    {

        List<Item> itemlist = new List<Item>();
        itemlist = ctx.Items.Where(item => item.ItemID == itemCode).ToList<Item>();

        foreach (Item item in itemlist)
        {
            if (item.ItemID == itemCode)
            {
                ctx.Items.Remove(item);
            }
        }
        ctx.SaveChanges();
    }

    //Method name: CreateSupplier
    //CreateSupplier(SupplierCode, SupplierName, ContactName, PhoneNo, FaxNo, Address, GSTNo); 
    //input arguments are SupplierCode, SupplierName, ContactName, PhoneNo, FaxNo, Address, GSTNo
    //return type: void

    public static void CreateItem(string ItemCode, string description,
        string Category, string ReorderLevel, string ReorderQty, string UOM, string binNo)
    {

        //List<Supplier> currentList = GetSupplier();
        //foreach(Supplier sup in currentList)
        //{
        //    if (sup.SupplierID==SupplierCode)
        //    {

        //        break; 
        //    }



        Item toAddItem = new Item();

        toAddItem.ItemID = ItemCode;
        toAddItem.Description = description;
        toAddItem.Category = Category;
        toAddItem.ReorderLevel = Convert.ToInt32(ReorderLevel);

        toAddItem.ReorderQty = Convert.ToInt32(ReorderQty);
        toAddItem.UOM = UOM;
        toAddItem.BinNumber = binNo;

        ctx.Items.Add(toAddItem);
        try
        {
            ctx.SaveChanges();
        }

        catch (DbEntityValidationException ex)
        {
            string errorMessages = string.Join("; ", ex.EntityValidationErrors.SelectMany(x => x.ValidationErrors).Select(x => x.ErrorMessage));
            throw new DbEntityValidationException(errorMessages);
        }
    }
    //method
    public static List<Supplier> GetSupplier()
    {

        List<Supplier> supplierlist = new List<Supplier>();
        ////foreach(Supplier sup in model.Supplier)
        ////{

        ////    supplierlist.Add(sup);
        ////}

        supplierlist = ctx.Suppliers.ToList<Supplier>();

        return supplierlist;


    }

    public static void UpdateSupplier(string SupplierCode, string SupplierName, string GSTRegistrationNo, string ContactName, string Phone, string Fax, string Address)
    {

        List<Supplier> supplierlist = new List<Supplier>();

        supplierlist = ctx.Suppliers.Where(sup => sup.SupplierID == SupplierCode).ToList<Supplier>();
        foreach (Supplier supt in supplierlist)
        {
            supt.SupplierName = SupplierName;
            supt.GSTRegistrationNo = GSTRegistrationNo;
            supt.ContactName = ContactName;
            supt.Phone = Phone;
            supt.Address = Address;
            supt.FaxNo = Fax;

        }
        ctx.SaveChanges();
    }

    public static void DeleteSupplier(string SupplierCode)
    {

        List<Supplier> supplierlist = new List<Supplier>();
        supplierlist = ctx.Suppliers.Where(sup => sup.SupplierID == SupplierCode).ToList<Supplier>();

        foreach (Supplier supt in supplierlist)
        {
            if (supt.SupplierID == SupplierCode)
            {
                ctx.Suppliers.Remove(supt);
            }
        }
        ctx.SaveChanges();
    }

    //Method name: CreateSupplier
    //CreateSupplier(SupplierCode, SupplierName, ContactName, PhoneNo, FaxNo, Address, GSTNo); 
    //input arguments are SupplierCode, SupplierName, ContactName, PhoneNo, FaxNo, Address, GSTNo
    //return type: void

    public static void CreateSupplier(string SupplierCode, string SupplierName, string ContactName, string PhoneNo, string FaxNo, string Address, string GSTNo)
    {

        //List<Supplier> currentList = GetSupplier();
        //foreach(Supplier sup in currentList)
        //{
        //    if (sup.SupplierID==SupplierCode)
        //    {

        //        break; 
        //    }



        Supplier toAddSupplier = new Supplier();

        toAddSupplier.SupplierID = SupplierCode;
        toAddSupplier.SupplierName = SupplierName;
        toAddSupplier.GSTRegistrationNo = GSTNo;
        toAddSupplier.ContactName = ContactName;
        toAddSupplier.Phone = PhoneNo;
        toAddSupplier.FaxNo = FaxNo;
        toAddSupplier.Address = Address;
        ctx.Suppliers.Add(toAddSupplier);
        try
        {
            ctx.SaveChanges();
        }

        catch (DbEntityValidationException ex)
        {
            string errorMessages = string.Join("; ", ex.EntityValidationErrors.SelectMany(x => x.ValidationErrors).Select(x => x.ErrorMessage));
            throw new DbEntityValidationException(errorMessages);
        }


    }

    public static void UpdateSupplierDetail(string SupplierCode, string itemid, decimal price, int priority)
    {


        List<SupplyDetail> supplydetaillist = new List<SupplyDetail>();

        supplydetaillist = ctx.SupplyDetails.Where(sup => sup.SupplierID == SupplierCode && sup.ItemID == itemid).ToList<SupplyDetail>();
        foreach (SupplyDetail suptdetail in supplydetaillist)
        {
            suptdetail.Price = price;
            suptdetail.Priority = priority;
        }
        ctx.SaveChanges();
    }

    public static void DeleteSupplierDetail(string SupplierCode, string ItemID)
    {

        List<SupplyDetail> supplierdetaillist = new List<SupplyDetail>();
        supplierdetaillist = ctx.SupplyDetails.Where(sup => sup.SupplierID == SupplierCode && sup.ItemID == ItemID).ToList<SupplyDetail>();

        foreach (SupplyDetail suptdetail in supplierdetaillist)
        {
            if (suptdetail.SupplierID == SupplierCode && suptdetail.ItemID == ItemID)
            {
                ctx.SupplyDetails.Remove(suptdetail);
            }
        }
        ctx.SaveChanges();
    }

    public static void CreateSupplierDetail(string SupplierCode, string ItemID, string Price, string priority)
    {


        SupplyDetail toAddSupplyDetail = new SupplyDetail();

        toAddSupplyDetail.SupplierID = SupplierCode;
        toAddSupplyDetail.ItemID = ItemID;
        toAddSupplyDetail.Price = Convert.ToDecimal(Price);
        toAddSupplyDetail.Priority = Convert.ToInt32(priority);

        ctx.SupplyDetails.Add(toAddSupplyDetail);
        try
        {
            ctx.SaveChanges();
        }

        catch (DbEntityValidationException ex)
        {
            string errorMessages = string.Join("; ", ex.EntityValidationErrors.SelectMany(x => x.ValidationErrors).Select(x => x.ErrorMessage));
            throw new DbEntityValidationException(errorMessages);
        }



    }
    public string isNormalStockNumber(string itemID, string quantity)
    {
        int result;
        string returnMessage = "";
        var sql = from i in ctx.Items where i.ItemID == itemID select i.InStock;
        if (!int.TryParse(quantity, out result))
        {
            return "Please enter positive/negative number!";
        }
        else if (Convert.ToInt32(quantity) > sql.FirstOrDefault())
        {
            return "Out range of stock!Please key in correct number!";
        }
        return returnMessage;
    }

    public static List<Item> GetUOM()
    {

        List<Item> itemlist = new List<Item>();
        ////foreach(Supplier sup in model.Supplier)
        ////{

        ////    supplierlist.Add(sup);
        ////}

        itemlist = ctx.Items.GroupBy(x => new { x.UOM }).Select(x => x.FirstOrDefault()).ToList<Item>();

        return itemlist;


    }

    public static void insertNotification(Notification n)
    {
        ctx.Notifications.Add(n);
        ctx.SaveChanges();
    }

    public List<DiscrepancySupplyDetailsModel> listPendingDiscrepancies(string userId)
    {
        DateTime now = DateTime.Now;
        var sql1 = from d in ctx.Delegations select d;
        var sql2 = from s in ctx.Staffs where s.UserID == userId select s.Role;
        List<string> role = sql2.ToList();
        List<Delegation> li1 = sql1.ToList();
        List<string> headId = new List<string>();
        List<DiscrepancySupplyDetailsModel> li2 = new List<DiscrepancySupplyDetailsModel>();
        //DialogResult dr = MessageBox.Show("list", "Message", MessageBoxButtons.OK, MessageBoxIcon.Question);
        if (role[0].Equals("Employee"))
        {
            //DialogResult dr1 = MessageBox.Show("Employee", "Message", MessageBoxButtons.OK, MessageBoxIcon.Question);
            for (int m = 0; m < li1.Count; m++)
            {
                if (li1[m].CoveringHeadID.Equals(userId))
                {
                    headId.Add(li1[m].DepartmentHeadID);
                }
            }
            if (headId.Count == 2)
            {
                return listAllDiscrepancies(userId);
            }
            else if (headId[0].Equals("54213"))
            {
                return listManagerDiscrepancy(userId);
            }
            else if (headId[0].Equals("54188"))
            {
                return listSupervisorDiscrepancy(userId);
            }
        }
        else
        {
            //DialogResult dr1 = MessageBox.Show("Others", "Message", MessageBoxButtons.OK, MessageBoxIcon.Question);
            for (int j = 0; j < li1.Count; j++)
            {
                if (userId.Equals(li1[j].CoveringHeadID) && li1[j].StartDate < now && li1[j].EndDate > now)
                {
                    return listAllDiscrepancies();
                }
            }
            if (role[0].Equals("Manager"))
            {
                //DialogResult dr2 = MessageBox.Show("Manager", "Message", MessageBoxButtons.OK, MessageBoxIcon.Question);
                li2 = listManagerDiscrepancy();
            }
            else if (role[0].Equals("Supervisor"))
            {
                //DialogResult dr2 = MessageBox.Show("Supervisor", "Message", MessageBoxButtons.OK, MessageBoxIcon.Question);
                li2 = listSupervisorDiscrepancy();
            }
        }
        return li2;
    }

    private List<DiscrepancySupplyDetailsModel> listSupervisorDiscrepancy(string userId)
    {
        //getMaxPrice(string itemId);
        var sql = from d in ctx.Discrepancies
                  join st in ctx.Staffs on d.UserID equals st.UserID
                  join i in ctx.Items on d.ItemID equals i.ItemID
                  join s in ctx.SupplyDetails on i.ItemID equals s.ItemID
                  where d.UserID != userId && s.Priority == 1 && s.Price < 250 && d.Status == "Pending Approval"
                  group new { d.DiscrepancyID } by new { d.DiscrepancyID, st.Name, d.ItemID, i.Description, d.Quantity, d.Reason, s.Price } into a
                  select new DiscrepancySupplyDetailsModel
                  {
                      DiscrepancyId = a.Key.DiscrepancyID,
                      Requester = a.Key.Name,
                      ItemCode = a.Key.ItemID,
                      Description = a.Key.Description,
                      Quantity = a.Key.Quantity,
                      Reason = a.Key.Reason,
                      Price = a.Key.Price,
                  };
        return sql.ToList();
    }

    private List<DiscrepancySupplyDetailsModel> listManagerDiscrepancy(string userId)
    {
        var sql = from d in ctx.Discrepancies
                  join st in ctx.Staffs on d.UserID equals st.UserID
                  join i in ctx.Items on d.ItemID equals i.ItemID
                  join s in ctx.SupplyDetails on i.ItemID equals s.ItemID
                  where d.UserID != userId && s.Priority == 1 && s.Price >= 250 && d.Status == "Pending Approval"
                  group new { d.DiscrepancyID } by new { d.DiscrepancyID, st.Name, d.ItemID, i.Description, d.Quantity, d.Reason, s.Price } into a
                  select new DiscrepancySupplyDetailsModel
                  {
                      DiscrepancyId = a.Key.DiscrepancyID,
                      Requester = a.Key.Name,
                      ItemCode = a.Key.ItemID,
                      Description = a.Key.Description,
                      Quantity = a.Key.Quantity,
                      Reason = a.Key.Reason,
                      Price = a.Key.Price,
                  };
        return sql.ToList();
    }

    private List<DiscrepancySupplyDetailsModel> listAllDiscrepancies(string userId)
    {
        var sql = from d in ctx.Discrepancies
                  join st in ctx.Staffs on d.UserID equals st.UserID
                  join i in ctx.Items on d.ItemID equals i.ItemID
                  join s in ctx.SupplyDetails on i.ItemID equals s.ItemID
                  where d.UserID != userId && s.Priority == 1 && d.Status == "Pending Approval"
                  group new { d.DiscrepancyID } by new { d.DiscrepancyID, st.Name, d.ItemID, i.Description, d.Quantity, d.Reason, s.Price } into a
                  select new DiscrepancySupplyDetailsModel
                  {
                      DiscrepancyId = a.Key.DiscrepancyID,
                      Requester = a.Key.Name,
                      ItemCode = a.Key.ItemID,
                      Description = a.Key.Description,
                      Quantity = a.Key.Quantity,
                      Reason = a.Key.Reason,
                      Price = a.Key.Price,
                  };
        return sql.ToList();
    }

    public List<DiscrepancySupplyDetailsModel> listAllDiscrepancies()
    {
        var sql = from d in ctx.Discrepancies
                  join st in ctx.Staffs on d.UserID equals st.UserID
                  join i in ctx.Items on d.ItemID equals i.ItemID
                  join s in ctx.SupplyDetails on i.ItemID equals s.ItemID
                  where s.Priority == 1 && d.Status == "Pending Approval"
                  group new { d.DiscrepancyID } by new { d.DiscrepancyID, st.Name, d.ItemID, i.Description, d.Quantity, d.Reason, s.Price } into a
                  select new DiscrepancySupplyDetailsModel
                  {
                      DiscrepancyId = a.Key.DiscrepancyID,
                      Requester = a.Key.Name,
                      ItemCode = a.Key.ItemID,
                      Description = a.Key.Description,
                      Quantity = a.Key.Quantity,
                      Reason = a.Key.Reason,
                      Price = a.Key.Price,
                  };
        return sql.ToList();
    }

    public List<DiscrepancySupplyDetailsModel> listManagerDiscrepancy()
    {
        var sql = from d in ctx.Discrepancies
                  join st in ctx.Staffs on d.UserID equals st.UserID
                  join i in ctx.Items on d.ItemID equals i.ItemID
                  join s in ctx.SupplyDetails on i.ItemID equals s.ItemID
                  where s.Priority == 1 && s.Price >= 250 && d.Status == "Pending Approval"
                  group new { d.DiscrepancyID } by new { d.DiscrepancyID, st.Name, d.ItemID, i.Description, d.Quantity, d.Reason, s.Price } into a
                  select new DiscrepancySupplyDetailsModel
                  {
                      DiscrepancyId = a.Key.DiscrepancyID,
                      Requester = a.Key.Name,
                      ItemCode = a.Key.ItemID,
                      Description = a.Key.Description,
                      Quantity = a.Key.Quantity,
                      Reason = a.Key.Reason,
                      Price = a.Key.Price,
                  };
        return sql.ToList();
    }

    public List<DiscrepancySupplyDetailsModel> listSupervisorDiscrepancy()
    {
        var sql = from d in ctx.Discrepancies
                  join st in ctx.Staffs on d.UserID equals st.UserID
                  join i in ctx.Items on d.ItemID equals i.ItemID
                  join s in ctx.SupplyDetails on i.ItemID equals s.ItemID
                  where s.Priority == 1 && s.Price < 250 && d.Status == "Pending Approval"
                  group new { d.DiscrepancyID } by new { d.DiscrepancyID, st.Name, d.ItemID, i.Description, d.Quantity, d.Reason, s.Price } into a
                  select new DiscrepancySupplyDetailsModel
                  {
                      DiscrepancyId = a.Key.DiscrepancyID,
                      Requester = a.Key.Name,
                      ItemCode = a.Key.ItemID,
                      Description = a.Key.Description,
                      Quantity = a.Key.Quantity,
                      Reason = a.Key.Reason,
                      Price = a.Key.Price,
                  };
        return sql.ToList();
    }

    public static string InsertOrderDetails(string supplier, string qty, string orderid)
    {
        OrderDetail o = new OrderDetail();
        OrderDetail od = ctx.OrderDetails.OrderByDescending(x => x.PurchaseOrderID).FirstOrDefault();
        if (od == null)
        {
            o.PurchaseOrderID = "PO0000001";
        }
        else
        {
            string a = od.PurchaseOrderID.Substring(0, 2);
            int b = Convert.ToInt32(od.PurchaseOrderID.Substring(2, 7));
            int x = b + 1;
            string newID = String.Format("{0:0000000}", x);
            newID = newID.Insert(0, a);
            o.PurchaseOrderID = newID;
        }
        o.OrderID = orderid;
        o.SupplierID = supplier;
        o.OrderQty = Convert.ToInt32(qty);
        o.ReceivedQty = 0;

        ctx.OrderDetails.Add(o);
        ctx.SaveChanges();

        return o.PurchaseOrderID;
    }

    public static string GetSupplierDetails(decimal price, string supplierLabel)
    {

        var q = from a in ctx.Suppliers
                where a.SupplierID == supplierLabel
                select a;
        Supplier sd = q.First();
        string result = "<ul><li> Contact name: <b>" + sd.ContactName + "</b></li><br/><li> Contact No: <b>" + sd.Phone + "</b></li><br/><li> Fax No : <b>" + sd.FaxNo + "</b></li><br/><li> Price: <b>" + price + "</b></li></ul>";
        return result;
    }

    public static SupplyDetail GetSupplier(int priority, string itemid)
    {

        var qry = from x in ctx.SupplyDetails
                  where x.ItemID == itemid && x.Priority == priority
                  select x;
        SupplyDetail s = qry.First();
        return s;
    }

    public static string ShowComment(string orderID)
    {
        string cmt = "";
        var q = from x in ctx.Orders
                where x.OrderID == orderID
                select x;
        Order com = q.First();
        cmt = com.Comment;
        return cmt;
    }

    public static List<OrderList> listPendingOrder()
    {
        List<OrderList> list = new List<OrderList>();
        var q = from x in ctx.Orders
                 where x.Status == "PendingApproval"
                 orderby x.OrderDate
                 select new { x.OrderID, x.ItemID, x.Item.Category, x.Item.Description, x.TotalQty, x.Justification };

        foreach (var a in q.ToList())
        {
            OrderList ol = new OrderList(a.OrderID, a.ItemID, a.Category, a.Description, a.TotalQty, a.Justification);
            list.Add(ol);
        }
        return list;
    }

    public static List<String> getOrderStatus()
    {
        var list = ctx.Orders.GroupBy(y => y.Status).Select(x => x.FirstOrDefault()).ToList();
        return list.Select(o => o.Status).ToList();
    }

    public static List<OrderList> getOrderList()
    {
        List<OrderList> oList = new List<OrderList>();
        var q = from x in ctx.Orders
                orderby x.OrderDate descending
                select new { x.OrderID, x.ItemID, x.Item.Description, x.TotalQty, x.Justification, x.Status };

        foreach (var a in q.ToList())
        {
            OrderList ol = new OrderList(a.OrderID, a.ItemID, a.Description, a.TotalQty, a.Justification, a.Status);
            oList.Add(ol);
        }
        return oList;
    }

    public static List<OrderList> getOrderHistory()
    {
        List<OrderList> oList = new List<OrderList>();
        var q = from x in ctx.Orders
                where x.Status != "PendingApproval"
                orderby x.OrderDate descending
                select new { x.OrderID, x.ItemID, x.Item.Category, x.Item.Description, x.TotalQty, x.Justification, x.Status, x.OrderDate, x.Comment };

        foreach (var a in q.ToList())
        {
            OrderList ol = new OrderList(a.OrderID, a.ItemID, a.Category, a.Description, a.TotalQty, a.Justification, a.Status, a.OrderDate, a.Comment);
            oList.Add(ol);
        }
        return oList;
    }

    public static List<OrderList> getOrderList(string stt)
    {
        List<OrderList> list = new List<OrderList>();
        if (!stt.Equals("Show All"))
        {
            var q = from x in ctx.Orders
                    where x.Status == stt
                    orderby x.OrderDate descending
                    select new { x.OrderID, x.ItemID, x.Item.Description, x.TotalQty, x.Justification, x.Status };

            foreach (var a in q.ToList())
            {
                OrderList ol = new OrderList(a.OrderID, a.ItemID, a.Description, a.TotalQty, a.Justification, a.Status);
                list.Add(ol);
            }
        }
        else
        {
            list = getOrderList();
        }
        return list;
    }

    public static List<OrderList> getOrderHistory(string stt)
    {
        List<OrderList> list = new List<OrderList>();
        if (!stt.Equals("Show All"))
        {
            var q = from x in ctx.Orders
                    where x.Status == stt
                    orderby x.OrderDate descending
                    select new { x.OrderID, x.ItemID, x.Item.Category, x.Item.Description, x.TotalQty, x.Justification, x.Status, x.OrderDate, x.Comment };

            foreach (var a in q.ToList())
            {
                OrderList ol = new OrderList(a.OrderID, a.ItemID, a.Category, a.Description, a.TotalQty, a.Justification, a.Status, a.OrderDate, a.Comment);
                list.Add(ol);
            }
        }
        else
        {
            list = getOrderHistory();
        }
        return list;
    }

    public static string InsertNewOrder(string itemid, string quantity, string justification, string userId)
    {
        Order o = new Order();
        Order od = ctx.Orders.OrderByDescending(x => x.OrderID).FirstOrDefault();
        if (od == null)
        {
            o.OrderID = "DO0000001";
        }
        else
        {
            string a = od.OrderID.Substring(0, 2);
            int b = Convert.ToInt32(od.OrderID.Substring(2, 7));
            int x = b + 1;
            string newID = String.Format("{0:0000000}", x);
            newID = newID.Insert(0, a);
            o.OrderID = newID;
        }
        o.ItemID = itemid;
        o.TotalQty = Convert.ToInt32(quantity);
        o.Justification = justification;
        o.Status = "PendingApproval";
        o.OrderDate = DateTime.Now;
        o.UserID = userId;

        ctx.Orders.Add(o);
        ctx.SaveChanges();

        return o.OrderID;
    }

    public static void UpdateOrder(string orderid, string qty, string justification)
    {
        Order o = ctx.Orders.Where(x => x.OrderID == orderid).First();
        o.TotalQty = Convert.ToInt32(qty);
        if (justification != String.Empty)
        {
            o.Justification = justification;
        }
        ctx.SaveChanges();
    }

    public static void UpdateOrderStatus(string orderid, string stt)
    {
        Order o = ctx.Orders.Where(x => x.OrderID == orderid).First();
        o.Status = stt;
        ctx.SaveChanges();
    }

    public static void UpdateComment(string orderID, string comment)
    {
        Order o = ctx.Orders.Where(x => x.OrderID == orderID).First();
        o.Comment = comment;
        ctx.SaveChanges();
    }

    public static void UpdateOrderDetails(string poNumber)
    {
        OrderDetail od = ctx.OrderDetails.Where(x => x.PurchaseOrderID == poNumber).First();
        od.ReceivedQty = od.OrderQty;
        ctx.SaveChanges();
    }

    public static void UpdateItemStock(string orderID, string itemID)
    {
        Order o = ctx.Orders.Where(x => x.OrderID == orderID).First();
        Item i = ctx.Items.Where(x => x.ItemID == itemID).First();
        int updatedStock = i.InStock + o.TotalQty;
        i.InStock = updatedStock;
        ctx.SaveChanges();
    }

    public static List<WCFNotification> ViewNotificationByUserID(string userID)
    {
        List<Notification> nList = ctx.Notifications.Where(x => x.UserID == userID).ToList();

        List<WCFNotification> wcfnList = new List<WCFNotification>();
        foreach (Notification notification in nList)
        {

            WCFNotification wn = new WCFNotification(notification.NotificationID, userID, notification.Subject, notification.Message, notification.Status, notification.Date);
            wcfnList.Add(wn);

        }
        return wcfnList;
    }


    
    public static Staff getLoginUserInfo()
    {
        Staff s = ctx.Staffs.Where(x => x.UserID == "98040").First();
        return s;
    }

    public static Delegation getDlgtInfo()   //select exsting delegationg info
    {
        Delegation lastdlgt = new Delegation();
        string a = getLoginUserInfo().UserID;  //headID
        int b = ctx.Delegations.Count(x => x.DepartmentHeadID == a);//if there are info about delegation

        if (b != 0)
        {
            List<Delegation> d = new List<Delegation>();
            d = ctx.Delegations.Where(x => x.DepartmentHeadID == a).ToList(); //get dept delegation list
            string c = d.Max(x => x.DelegationID).ToString();//the max delegationID in list
            lastdlgt = ctx.Delegations.Where(x => x.DelegationID == c).First();
        }
        return lastdlgt;
    }


    public static List<Staff> getDptSfInfo()
    {
        string a = getLoginUserInfo().DepartmentID;
        List<Staff> st1 = new List<Staff>();
        st1 = ctx.Staffs.Where(x => x.DepartmentID == a).ToList();
        return st1;

    }

    public static Staff someInfo(string z)
    {
        Delegation d = getDlgtInfo();
        Staff s1 = new Staff();

        if (z == "stf")
        {
            if (d.DelegationID != null)
            {
                string ch = d.CoveringHeadID;
                s1 = ctx.Staffs.Where(x => x.UserID == ch).First();
            }
           

        }
        else if (z == "oldrep")
        {
            s1 = getDptSfInfo().Where(x => x.Role == "DeptRep").First();
        }
        else if (z == "manager")
        {
            s1 = getDptSfInfo().Where(x => x.Role == "Manager").First();
        }
        return s1;
    }
    public static void ChangeRep(string DropDownList1)
    {
        GetInfo getInfo = new GetInfo();
        Staff newrep = ctx.Staffs.Where(x => x.Name == DropDownList1).First();
        newrep.Role = "DeptRep";
        string oldrepid = someInfo("oldrep").UserID;
        Staff oldrep = ctx.Staffs.Where(x => x.UserID == oldrepid).First();
        oldrep.Role = "Employee";
        ctx.SaveChanges();
    }

    public static Order getOrderById(string id)
    {
        return ctx.Orders.Where(x => x.OrderID == id).ToList().FirstOrDefault();
    }
}