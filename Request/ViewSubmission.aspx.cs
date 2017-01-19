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


        public RqHistory(string rqId, DateTime date,string requester,string status)
        {
            this.rqId = rqId;
            this.date = date;
            this.requester = requester;
            this.status = status;
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