using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Order_MakeNewOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ItemIDLbl.Text = Request.QueryString["ItemID"];
            DescriptionLbl.Text = Request.QueryString["Description"];
        }
    }

    protected void SubmitBtn_Click(object sender, EventArgs e)
    {
        string userID = (string)Session["user"];
        string orderID = Work.InsertNewOrder(ItemIDLbl.Text, QuantityTextBox.Text, JustificationTextBox.Text, userID);

        string headID = Work.getDeptHeadId(Work.getUser(userID).DepartmentID);
        string subject = "Order " + orderID + " for approval";
        string body = "Dear Sir/ Madam,<br />" + "<br />Order " + orderID + " is pending your approval. Please click <a href = 'http://localhost/StationeryStore/Order/ApproveOrder.aspx'>here</a> to see more details.<br />" + "<br />Thanks & regards.";
        SendEmail sm = new SendEmail(headID, subject, body);
        sm.initEmail();
        sm.sendEmail();

        string message = "Your order id is " + orderID + ".";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('" + message + "');window.location='OrderList.aspx'", true);
    }
}