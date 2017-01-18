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
        public DateTime RequestDate { get; set; }
        public string Description { get; set; }
        public string UOM { get; set; }
        public int RequestQty { get; set; }
        public string Status { get; set; }
        public string Comment { get; set; }


        public RqDeatail(string rqId, DateTime date, string des, string uom, int qty, string status, string comment)
        {
            this.RequestId = rqId;
            this.RequestDate = date;
            this.Description = des;
            this.UOM = uom;
            this.RequestQty = qty;
            this.Status = status;
            this.Comment = comment;
        }

    }
    string rqId;
    protected void Page_Load(object sender, EventArgs e)
    {

        rqId = Request.QueryString["id"];
        List<RequestDetail> rdList = Work.getRequestDetail(rqId);

        List<RqDeatail> deList = new List<RqDeatail>();
        foreach (RequestDetail rd in rdList)
        {
            string comment = "NA";
            if (rd.Request.Comment != null)
            {
                comment = rd.Request.Comment;
            }
            RqDeatail de = new RqDeatail(rqId, rd.Request.RequestDate, rd.Item.Description, rd.Item.UOM, rd.RequestQty, rd.Status, comment);
            deList.Add(de);
        }

        if (rdList[0].Status != "Pending Approval")
        {
            //Panel1.Visible = false;
            GridView1.DataSource = deList;
            GridView1.DataBind();
        }
        else
        {
            GridView2.DataSource = deList;
            GridView2.DataBind();
        }

    }

    protected void ButtonCancel_Click(object sender, EventArgs e)
    {
        Work.CancelRequest(rqId);
    }

    protected void ButtonSubmit_Click(object sender, EventArgs e)
    {

    }
}