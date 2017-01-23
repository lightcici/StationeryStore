using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RequestDetailPage : System.Web.UI.Page
{
    
    string rqId;
    List<RqDetail> deList;
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
            deList = Work.getRqDetail(rqId);


            if (deList[0].Status == "PendingApproval")
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
        if (comment == "")
        {
            comment = "NA";
        }
        Work.ApproveRequest(rqId,comment);
        string to = Work.getRequestById(rqId).UserID;
        string subject = "Your request " + rqId + " has been approved.";
        string body = "Dear Sir/ Madam,<br />" + "<br />Your request " + rqId + " has been approved. Please click <a href = 'http://localhost/StationeryStore/Request/RequestHistory.aspx'>here</a> to see more details.<br />" + "<br />Thanks & regards.";
        SendEmail sm = new SendEmail(to, subject, body);
        sm.initEmail();
        sm.sendEmail();
        Response.Redirect("ViewSubmission.aspx");


    }

    protected void ButtonReject_Click(object sender, EventArgs e)
    {
        string comment = TextBox1.Text;
        if (comment == "")
        {
            comment = "NA";
        }
        Work.RejecteRequest(rqId, comment);
        string to = Work.getRequestById(rqId).UserID;
        string subject = "Your request " + rqId + " has been rejected.";
        string body = "Dear Sir/ Madam,<br />" + "<br />Your request " + rqId + " has been rejected. Please click <a href = 'http://localhost/StationeryStore/Request/RequestHistory.aspx'>here</a> to see more details.<br />" + "<br />Thanks & regards.";
        SendEmail sm = new SendEmail(to, subject, body);
        sm.initEmail();
        sm.sendEmail();
        Response.Redirect("ViewSubmission.aspx");
    }
}