using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Request_AllocateStationery : System.Web.UI.Page
{
    class AlloItem
    {
        public string itemId { get; set; }
        public string description { get; set; }
        public string requestId { get; set; }
        public DateTime date { get; set; }
        public string userId { get; set; }
        public string userName { get; set; }
        public int rqQty { get; set; }
        public int rcQty { get; set; }
        public int neededQty { get; set; }
        public string uom { get; set; }

        public AlloItem(string itemId, string description, string requestId, DateTime date, string userId, string userName, int rqQty, int rcQty,string uom)
        {
            this.itemId = itemId;
            this.description = description;
            this.requestId = requestId;
            this.date = date;
            this.userId = userId;
            this.userName = userName;
            this.rqQty = rqQty;
            this.rcQty = rcQty;
            this.neededQty = rqQty - rcQty;
            this.uom = uom;

        }
    }
    List<AlloItem> list;
    protected void Page_Load(object sender, EventArgs e)
    {
        string userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }

        if (!IsPostBack)
        {
            Team5ADProjectEntities ctx = new Team5ADProjectEntities();
            string deptId = Work.getUser(userId).DepartmentID;
            var q = from r in ctx.RequestDetails
                    orderby r.ItemID
                    where (r.Status == "InProgress" || r.Status == "Unfulfilled") && r.Request.Staff.DepartmentID == deptId
                    select new { r.ItemID, r.Item.Description, r.RequestID, r.Request.RequestDate, r.Request.UserID, r.Request.Staff.Name, r.RequestQty, r.RetrievedQty, r.Status,r.Item.UOM };
            list = new List<AlloItem>();
            foreach (var i in q.ToList())
            {
                AlloItem ai = new AlloItem(i.ItemID, i.Description, i.RequestID, i.RequestDate, i.UserID, i.Name, i.RequestQty, i.RetrievedQty,i.UOM);
                list.Add(ai);
            }
            Session["AllocateList"] = list;
            GridView1.DataSource = list;
            GridView1.DataBind();
        }
    }


    protected void Button1_Click1(object sender, EventArgs e)
    {
        list = (List<AlloItem>)Session["AllocateList"];
        for (int i = 0; i < list.Count(); i++)
        {

            TextBox quantity = GridView1.Rows[i].FindControl("allocated") as TextBox;
            int qty = 0;
            if (!String.IsNullOrEmpty(quantity.Text))
            {
                bool isInt = int.TryParse(quantity.Text, out qty);
            }

            Work.AllocateItems(list[i].requestId, list[i].itemId, qty);
        }

        Response.Redirect("AllocateStationery.aspx");
    }
}