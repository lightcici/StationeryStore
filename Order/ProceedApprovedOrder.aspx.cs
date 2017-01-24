using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class Order_ProceedApprovedOrder : System.Web.UI.Page
{
    string userid;

    protected void Page_Load(object sender, EventArgs e)
    {
        userid = (string)Session["user"];
        if (userid == null)
        {
            Response.Redirect("~/login.aspx");
        }
        if (!IsPostBack)
        {
            OrderIDLbl.Text = Request.QueryString["Order"];
            ItemIDLbl.Text = Request.QueryString["Item"];
            DescriptionLbl.Text = Request.QueryString["Description"];
            TotalQtyLbl.Text = Request.QueryString["Quantity"];

            Supplier1Lbl.Text = Work.GetSupplier(1, ItemIDLbl.Text).SupplierID;
            decimal price1 = Work.GetSupplier(1, ItemIDLbl.Text).Price;
            SupplierDetails1Lbl.Text = Work.GetSupplierDetails(price1, Supplier1Lbl.Text);

            Supplier2Lbl.Text = Work.GetSupplier(2, ItemIDLbl.Text).SupplierID;
            decimal price2 = Work.GetSupplier(2, ItemIDLbl.Text).Price;
            SupplierDetails2Lbl.Text = Work.GetSupplierDetails(price2, Supplier2Lbl.Text);

            Supplier3Lbl.Text = Work.GetSupplier(3, ItemIDLbl.Text).SupplierID;
            decimal price3 = Work.GetSupplier(3, ItemIDLbl.Text).Price;
            SupplierDetails3Lbl.Text = Work.GetSupplierDetails(price3, Supplier3Lbl.Text);
        }

        if (!Supplier1CB.Checked)
        {
            QuantityTextBox1.Enabled = false;
        }

        if (!Supplier2CB.Checked)
        {
            QuantityTextBox2.Enabled = false;
        }

        if (!Supplier3CB.Checked)
        {
            QuantityTextBox3.Enabled = false;
        }

        Label14.Text = "";
    }

    protected void Supplier1CB_CheckedChanged(object sender, EventArgs e)
    {
        if (Supplier1CB.Checked)
        {
            QuantityTextBox1.Enabled = true;
        }
    }

    protected void Supplier2CB_CheckedChanged(object sender, EventArgs e)
    {
        if (Supplier2CB.Checked)
        {
            QuantityTextBox2.Enabled = true;
        }
    }

    protected void Supplier3CB_CheckedChanged(object sender, EventArgs e)
    {
        if (Supplier3CB.Checked)
        {
            QuantityTextBox3.Enabled = true;
        }
    }

    protected void OrderBtn_Click(object sender, EventArgs e)
    {
        StringBuilder message = new StringBuilder();
        int total = 0;
        if ((QuantityTextBox1.Enabled == true) && (QuantityTextBox1.Text != String.Empty))
        {
            total = total + Convert.ToInt32(QuantityTextBox1.Text);
        }

        if ((QuantityTextBox2.Enabled == true) && (QuantityTextBox2.Text != String.Empty))
        {
            total = total + Convert.ToInt32(QuantityTextBox2.Text);
        }

        if ((QuantityTextBox3.Enabled == true) && (QuantityTextBox3.Text != String.Empty))
        {
            total = total + Convert.ToInt32(QuantityTextBox3.Text);
        }

        if ((!Supplier1CB.Checked) && (!Supplier2CB.Checked) && (!Supplier3CB.Checked))
        {
            Label14.Text = "Please select supplier!";

        }
        else if (((Supplier1CB.Checked) && (!Supplier2CB.Checked) && (!Supplier3CB.Checked) && (QuantityTextBox1.Text == String.Empty))
             || ((!Supplier1CB.Checked) && (Supplier2CB.Checked) && (!Supplier3CB.Checked) && (QuantityTextBox2.Text == String.Empty))
             || ((!Supplier1CB.Checked) && (!Supplier2CB.Checked) && (Supplier3CB.Checked) && (QuantityTextBox3.Text == String.Empty)))
        {
            Label14.Text = "Please fill in quantity!";
        }
        else
        {
            if (total == Convert.ToInt32(TotalQtyLbl.Text))
            {
                if ((Supplier1CB.Checked) && (QuantityTextBox1.Text != String.Empty))
                {
                    string po1 = Work.InsertOrderDetails(Supplier1Lbl.Text, QuantityTextBox1.Text, OrderIDLbl.Text);                 
                    message.Append("Purchase Order ID for 1st Supplier is " + po1 + ".");
                }

                if ((Supplier2CB.Checked) && (QuantityTextBox2.Text != String.Empty))
                {
                    string po2 = Work.InsertOrderDetails(Supplier2Lbl.Text, QuantityTextBox2.Text, OrderIDLbl.Text);
                    message.Append("Purchase Order ID for 2nd Supplier is " + po2 + ".");
                }

                if ((Supplier3CB.Checked) && (QuantityTextBox3.Text != String.Empty))
                {
                    string po3 = Work.InsertOrderDetails(Supplier3Lbl.Text, QuantityTextBox3.Text, OrderIDLbl.Text);
                    message.Append(" Purchase Order ID for 3rd Supplier is " + po3 + ".");
                }

                string stt = "Ordered";
                Work.UpdateOrderStatus(OrderIDLbl.Text, stt);
                ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('" + message.ToString() + "');window.location='OrderList.aspx'", true);
            }
            else
            {
                Label14.Text = "Sum of all quantity must be equal to Total Quantity!";
            }
        }
    }
}