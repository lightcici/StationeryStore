using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order_EditOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }
        if (!IsPostBack)
        {
            OrderIDLbl.Text = Request.QueryString["Order"];
            ItemIDLbl.Text = Request.QueryString["Item"];
            DescriptionLbl.Text = Request.QueryString["Description"];
            QuantityTextBox.Text = Request.QueryString["Quantity"];
            JustificationTextBox.Text = Request.QueryString["Justification"];
        }
    }

    protected void SubmitBtn_Click(object sender, EventArgs e)
    {
        Work.UpdateOrder(OrderIDLbl.Text, QuantityTextBox.Text, JustificationTextBox.Text);
        string message = "The order " + OrderIDLbl.Text + " is submitted.";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('" + message + "');window.location='OrderList.aspx'", true);
    }



    protected void CancelBtn_Click(object sender, EventArgs e)
    {
        string userID = (string)Session["user"];
        string status = "Cancelled";
        Work.UpdateOrderStatus(OrderIDLbl.Text, status);

        string headID = Work.getDeptHeadId(Work.getUser(userID).DepartmentID);
        string subject = "Order " + OrderIDLbl.Text + " has been cancelled";
        string body = "Dear Sir/ Madam,<br />" + "<br />Order " + OrderIDLbl.Text + " is cancelled. Please click <a href = 'http://localhost/StationeryStore/OrderHistory.aspx'>here</a> to see more details.<br />" + "<br />Thanks & regards.";
        SendEmail sm = new SendEmail(headID, subject, body);
        sm.initEmail();
        sm.sendEmail();

        string message = "Email about cancelling order has successfully been sent. The order " + OrderIDLbl.Text + " is cancelled.";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('" + message + "');window.location='OrderList.aspx'", true);
    }
}