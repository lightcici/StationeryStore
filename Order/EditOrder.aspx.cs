using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order_EditOrder : System.Web.UI.Page
{
    Team5ADProjectEntities context;
    protected void Page_Load(object sender, EventArgs e)
    {
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
        string status = "Cancelled";
        Work.UpdateOrderStatus(OrderIDLbl.Text, status);
        string message = "The order " + OrderIDLbl.Text + " is cancelled.";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('" + message + "');window.location='OrderList.aspx'", true);
    }
}