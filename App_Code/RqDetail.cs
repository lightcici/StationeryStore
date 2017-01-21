using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for RqDetail
/// </summary>
public class RqDetail
{
    public string RequestId { get; set; }
    public string ItemId { get; set; }
    public DateTime RequestDate { get; set; }
    public string Description { get; set; }
    public string UOM { get; set; }
    public int RequestQty { get; set; }
    public string Status { get; set; }
    public string Comment { get; set; }

    public RqDetail()
    {

    }

    public RqDetail(string rqId, string itemid, DateTime date, string des, string uom, int qty, string status, string comment)
    {
        this.RequestId = rqId;
        this.ItemId = itemid;
        this.RequestDate = date;
        this.Description = des;
        this.UOM = uom;
        this.RequestQty = qty;
        this.Status = status;
        this.Comment = comment;

    }

}