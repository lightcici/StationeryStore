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
        List<DiscrepancySupplyDetailsModel> li2 = new List<DiscrepancySupplyDetailsModel>();
        for (int j = 0; j < li1.Count; j++)
        {
            if (userId.Equals(li1[j].CoveringHeadID) && li1[j].StartDate < now && li1[j].EndDate > now)
            {
                var sql3 = from d in ctx.Discrepancies
                           join i in ctx.Items on d.ItemID equals i.ItemID
                           join s in ctx.SupplyDetails on i.ItemID equals s.ItemID
                           where d.Status == "Pending Approval"
                           group new { d.DiscrepancyID, s.Price } by new { d.DiscrepancyID, d.UserID, d.ItemID, i.Description, d.Quantity, d.Reason } into a
                           select new DiscrepancySupplyDetailsModel
                           {
                               DiscrepancyId = a.Key.DiscrepancyID,
                               Requester = a.Key.UserID,
                               ItemCode = a.Key.ItemID,
                               Description = a.Key.Description,
                               Quantity = a.Key.Quantity,
                               Reason = a.Key.Reason,
                               Price = a.Max(s => s.Price),
                           };
                return sql3.ToList();

                // && li1[j].EndDate >= time && time >= li1[j].StartDate
            }
        }
        if (role[0].Equals("Manager"))
        {
            //DialogResult dr = MessageBox.Show("Manager", "Message", MessageBoxButtons.OK, MessageBoxIcon.Question);
            var sql3 = from d in ctx.Discrepancies
                       join i in ctx.Items on d.ItemID equals i.ItemID
                       join s in ctx.SupplyDetails on i.ItemID equals s.ItemID
                       where s.Price >= 250 && d.Status == "Pending Approval"
                       group new { d.DiscrepancyID, s.Price } by new { d.DiscrepancyID, d.UserID, d.ItemID, i.Description, d.Quantity, d.Reason } into a
                       select new DiscrepancySupplyDetailsModel
                       {
                           DiscrepancyId = a.Key.DiscrepancyID,
                           Requester = a.Key.UserID,
                           ItemCode = a.Key.ItemID,
                           Description = a.Key.Description,
                           Quantity = a.Key.Quantity,
                           Reason = a.Key.Reason,
                           Price = a.Max(s => s.Price),
                       };
            li2 = sql3.ToList();
        }
        else if (role[0].Equals("Supervisor"))
        {
            //DialogResult dr = MessageBox.Show("Supervisor", "Message", MessageBoxButtons.OK, MessageBoxIcon.Question);
            var sql3 = from d in ctx.Discrepancies
                       join i in ctx.Items on d.ItemID equals i.ItemID
                       join s in ctx.SupplyDetails on i.ItemID equals s.ItemID
                       where s.Price < 250 && d.Status == "Pending Approval"
                       group new { d.DiscrepancyID, s.Price } by new { d.DiscrepancyID, d.UserID, d.ItemID, i.Description, d.Quantity, d.Reason } into a
                       select new DiscrepancySupplyDetailsModel
                       {
                           DiscrepancyId = a.Key.DiscrepancyID,
                           Requester = a.Key.UserID,
                           ItemCode = a.Key.ItemID,
                           Description = a.Key.Description,
                           Quantity = a.Key.Quantity,
                           Reason = a.Key.Reason,
                           Price = a.Max(s => s.Price),
                       };
            li2 = sql3.ToList();
        }
        return li2;
    }

    public static OrderDetail InsertOrderDetails(string supplier, string qty, string orderid)
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

        return o;
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

    public static Order InsertNewOrder(string itemid, string quantity, string justification)
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
        o.UserID = "00242"; //temporarily hardcode

        return o;
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
}