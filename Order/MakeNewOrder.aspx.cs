using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Order_MakeNewOrder : System.Web.UI.Page
{
    Team5ADProjectEntities context;
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
        context = new Team5ADProjectEntities();
        Order o = Work.InsertNewOrder(ItemIDLbl.Text, QuantityTextBox.Text, JustificationTextBox.Text);
        context.Orders.Add(o);
        context.SaveChanges();

        string message = "Your order id is " + o.OrderID + ".";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('" + message + "');window.location='OrderList.aspx'", true);
    }
}