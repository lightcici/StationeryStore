using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Request_AllocateStationery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Team5ADProjectEntities ctx = new Team5ADProjectEntities();
        var q = from r in ctx.RequestDetails
                where (r.Status == "InProgress" || r.Status == "Unfulfilled") && r.Request.Staff.DepartmentID == "COMM"
                select new { r.Item, r.Item.Description, r.RequestID, r.Request.RequestDate, r.Request.UserID, r.Request.Staff.Name, r.RequestQty, r.RetrievedQty, r.Status };
        List<Object> list = q.ToList();
        GridView1.DataSource = q.ToList();
        GridView1.DataBind();
    }
}