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



        public RqDeatail(string rqId, string itemid, DateTime date, string des, string uom, int qty, string status,string comment)
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

                RqDeatail de = new RqDeatail(rqId, rd.ItemID, rd.Request.RequestDate, rd.Item.Description, rd.Item.UOM, rd.RequestQty, rd.Status,rd.Request.Comment);
                deList.Add(de);
                Session["deList"] = deList;
            }

            if (rdList[0].Status == "PendingApproval")
            {
                GridView1.DataSource = deList;
                GridView1.DataBind();
                Panel1.Visible = true;

            }
            else
            {
                GridView2.DataSource = deList;
                GridView2.DataBind();
            }





        }

    }





    protected void ButtonApprove_Click(object sender, EventArgs e)
    {
        string comment = TextBox1.Text;
        Work.ApproveRequest(rqId,comment);
        Response.Redirect("ViewSubmission.aspx");
    }

    protected void ButtonReject_Click(object sender, EventArgs e)
    {
        string comment = TextBox1.Text;
        Work.RejecteRequest(rqId, comment);
        Response.Redirect("ViewSubmission.aspx");
    }
}