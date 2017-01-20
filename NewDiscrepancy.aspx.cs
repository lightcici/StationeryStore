using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Windows.Forms;
using System.Configuration;
using System.Web.Mail;

public partial class NewDiscrepancy : System.Web.UI.Page
{
    Work work;
    protected void Page_Load(object sender, EventArgs e)
    {
        string userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }
        work = new Work();
        TextBox1.Text = Request.QueryString["id"];
        TextBox2.Text = Request.QueryString["description"];
        TextBox3.Text = work.getMaxPrice(Request.QueryString["id"]).ToString();
        Console.WriteLine("ppppppppppppp");
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (!work.isNormalStockNumber(TextBox1.Text, TextBox4.Text).Equals(""))
        {
            Label7.Visible = true;
            Label7.Text = work.isNormalStockNumber(TextBox1.Text, TextBox4.Text);
        }
        else
        {
            int i = work.saveDiscrepancy(String.Format("{0:d5}", (Convert.ToInt32(work.getMaxDiscrepancyId()) + 1)), Convert.ToInt32(TextBox4.Text), TextBox5.Text, "Pending Approval", Work.getItem(TextBox1.Text));
            if (i > 0)
            {
                //Email.SendEmail("New Message", "Hello");
                //bool flag = SendMail();
                //if (flag)
                //{
                //    Response.Write("<script>alert('Success !');</script>");
                //}
                DialogResult dr = MessageBox.Show("Updated Successfully!", "New Discrepancy", MessageBoxButtons.OK, MessageBoxIcon.Question);
                if (dr == DialogResult.OK)
                {
                    Response.Redirect("/ViewDiscrepancy.aspx");
                }
            }
        }
    }
}