using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RequestDetailPage : System.Web.UI.Page
{
    class RqDeatail
    {
        public string RequestId { get; set; }
        public string ItemId { get; set; }
        public DateTime RequestDate { get; set; }
        public string Description { get; set; }
        public string UOM { get; set; }
        public int RequestQty { get; set; }
        public string Status { get; set; }
        public string Comment { get; set; }


        public RqDeatail(string rqId, string itemid, DateTime date, string des, string uom, int qty, string status, string comment)
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
    string rqId;
    List<RqDeatail> deList;
    string userId;
    protected void Page_Load(object sender, EventArgs e)
    {
        userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }

        rqId = Request.QueryString["id"];

        if (!IsPostBack)
        {
            
            List<RequestDetail> rdList = Work.getRequestDetail(rqId);

            deList = new List<RqDeatail>();
            foreach (RequestDetail rd in rdList)
            {
                string comment = "NA";
                if (rd.Request.Comment != null)
                {
                    comment = rd.Request.Comment;
                }
                RqDeatail de = new RqDeatail(rqId, rd.ItemID, rd.Request.RequestDate, rd.Item.Description, rd.Item.UOM, rd.RequestQty, rd.Status, comment);
                deList.Add(de);
                Session["deList"] = deList;
            }

            if (rdList[0].Status != "PendingApproval")
            {
                Panel1.Visible = false;
                GridView1.DataSource = deList;
                GridView1.DataBind();
            }
            else
            {
                GridView2.DataSource = deList;
                GridView2.DataBind();
            }
        }

    }

    public void GridView1_RowCommand(object sender, GridViewDeleteEventArgs e)
    {
        deList = (List<RqDeatail>)Session["deList"];
        RqDeatail rd = deList[e.RowIndex];
        Work.DeleteRequestItem(rd.RequestId, rd.ItemId);
        Response.Redirect("RequestDetailPage.aspx?id=" + rd.RequestId);


    }

    protected void ButtonCancel_Click(object sender, EventArgs e)
    {
        Work.CancelRequest(rqId);
        string headID = Work.getDeptHeadId(Work.getUser(userId).DepartmentID);
        string subject = "Request " + rqId + " cancelled ";
        string body = "Dear Sir/ Madam,<br />" + "<br />Request " + rqId + " has been cancelled by requester. No approval is required now.<br />" + "<br />Thanks & regards.";
        SendEmail sm = new SendEmail(headID, subject, body);
        sm.initEmail();
        sm.sendEmail();
        Response.Redirect("RequestHistory.aspx");
    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {
        deList = (List<RqDeatail>)Session["deList"];
        for (int i = 0; i < deList.Count(); i++)
        {
            TextBox quantity = GridView2.Rows[i].FindControl("quantity") as TextBox;
            int qty = 0;
            if (!String.IsNullOrEmpty(quantity.Text))
            {
                bool isInt = int.TryParse(quantity.Text, out qty);
            }

            if (qty > 0 && qty!= deList[i].RequestQty)
            {
                Work.UpdateRqQty(deList[i].RequestId, deList[i].ItemId, qty);
                Response.Redirect("RequestHistory.aspx");
            }
        }
    }
}