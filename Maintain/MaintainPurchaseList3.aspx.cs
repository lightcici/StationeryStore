using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MaintainPurchaseList3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Text = Request.QueryString["field1"];
        TextBox2.Text = Request.QueryString["field2"];
        TextBox4.Text = Request.QueryString["field3"];
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("MaintainPurchaseList1.aspx");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string supplierID = Request.QueryString["field4"];
        string ItemID = TextBox1.Text;
        string price = TextBox3.Text;
        string priority = DropDownList1.SelectedValue;
        Work.CreateSupplierDetail(supplierID, ItemID, price, priority);
        string chosenSupplierID = Request.QueryString["field4"];
        Response.Redirect("MaintainPurchaseList1.aspx?field1=" + chosenSupplierID);
        
    }
}