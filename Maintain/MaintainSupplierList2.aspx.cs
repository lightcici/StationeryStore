using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MaintainSupplierList2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        String SupplierCode = TextBox1.Text;
        String SupplierName = TextBox2.Text;
        String ContactName = TextBox3.Text;
        String PhoneNo = TextBox4.Text;
        String FaxNo = TextBox5.Text;
        String Address = TextBox6.Text;
        String GSTNo = TextBox7.Text;

        Work.CreateSupplier(SupplierCode, SupplierName, ContactName, PhoneNo,
            FaxNo, Address, GSTNo);

        Response.Redirect("MaintainSupplierList1.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("MaintainSupplierList1.aspx");
    }
}