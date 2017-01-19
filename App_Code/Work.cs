﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Work
/// </summary>
public class Work
{
    static Team5ADProjectEntities ctx = new Team5ADProjectEntities();
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


}