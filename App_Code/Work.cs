using System;
using System.Collections.Generic;
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
      
            return ctx.Requests.Where(x => x.UserID == userId).OrderByDescending(y=>y.RequestDate).ToList();
  
    }

    public static List<Request> getDeptRequests(string userId)
    {
        string deptId = getUser(userId).DepartmentID;
        return ctx.Requests.Where(x => x.Staff.DepartmentID == deptId).OrderByDescending(y => y.RequestDate).ToList();
    }

    public static List<RequestDetail> getRequestDetail(string id)
    {
        return ctx.RequestDetails.Where(x => x.RequestID == id).OrderByDescending(y=>y.Request.RequestDate).ToList();
    }

    public static List<String> getRequestSatus()
    {
        var list= ctx.RequestDetails.GroupBy(y => y.Status).Select(x => x.FirstOrDefault()).ToList();
        return list.Select(o => o.Status).ToList();
    }

   
    public static void CancelRequest(string id)
    {
        List<RequestDetail> list = ctx.RequestDetails.Where(x => x.RequestID == id).ToList();
        foreach(RequestDetail rd in list)
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

    public static void UpdateRqQty(string rqId,string itemId,int qty)
    {
        RequestDetail rd = ctx.RequestDetails.Where(x => x.RequestID == rqId && x.ItemID == itemId).ToList().First();
        rd.RequestQty = qty;
        ctx.SaveChanges();

    }

    public static void ApproveRequest(string rqId, string comment)
    {
        Request rq = ctx.Requests.Where(x => x.RequestID == rqId).ToList().First();
        rq.Comment = comment;
        List <RequestDetail> list  = Work.getRequestDetail(rqId);
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
                  where i.Category == category
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

    public Item getItem(string itemId)
    {
        var sql = from i in ctx.Items
                  where i.ItemID == itemId
                  select i;
        return sql.FirstOrDefault();
    }

    public int saveDiscrepancy(string discrepancyId, int quantity, string reason, string status, Item item)
    {
        Discrepancy discrepancy = new Discrepancy();
        discrepancy.DiscrepancyID = discrepancyId;
        discrepancy.Quantity = quantity;
        discrepancy.Reason = reason;
        discrepancy.Status = status;
        discrepancy.Item = item;
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

}