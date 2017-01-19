using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RequestHistory : System.Web.UI.Page
{
    static String ALL = "All";
    class RqHistory
    {
        public string rqId { get; set; }
        public DateTime date { get; set; }
        public string requester { get; set; }
        public string status{ get; set; }
        public string comment { get; set; }


        public RqHistory(string rqId, DateTime date,string requester,string status, string comment)
        {
            this.rqId = rqId;
            this.date = date;
            this.requester = requester;
            this.status = status;
            this.comment = comment;
        }

    }

    string userId;
   
    protected void Page_Load(object sender, EventArgs e)
    {


        string userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }


        if (!IsPostBack)
        {

            var list = Work.getRequestSatus();
            list.Insert(0, ALL);
            DropDownList1.DataSource = list;
            DropDownList1.DataBind();

            List<RqHistory> hList = new List<RqHistory>();
            List<Request> rqList = Work.getRequest(userId);
                   
            foreach (Request rq in rqList)
            {
                string status = null;
                string comment = "NA";
                List<RequestDetail> rdList = Work.getRequestDetail(rq.RequestID);
                foreach (RequestDetail rd in rdList)
                {
                    if (rd.Status == "Unfufilled")
                    {
                        status = "Unfufilled";
                        break;
                    }
                    else
                    {
                        status = rd.Status;
                    }
                }

                if (rq.Comment != null)
                {
                    comment = rq.Comment;
                }

                RqHistory h = new RqHistory(rq.RequestID, rq.RequestDate, Work.getUser(rq.UserID).Name, status, comment);
                hList.Add(h);
            }
            Session["history"] = hList;
            GridView1.DataSource = hList;
            GridView1.DataBind();
        }
    }




    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string status = DropDownList1.SelectedValue;
        List <RqHistory> hList = (List<RqHistory>)Session["history"];
        List<RqHistory> list = new List<RqHistory>();
        if (status == ALL)
        {
            list = hList;
        }
        else
        {
            foreach (RqHistory rh in hList)
            {
                if (rh.status == status)
                { list.Add(rh); }
            }
        }
        GridView1.DataSource = list;
        GridView1.DataBind();

    }
}