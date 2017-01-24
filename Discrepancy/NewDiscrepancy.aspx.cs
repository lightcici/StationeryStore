﻿using System;
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
        work = new Work();
        TextBox1.Text = Request.QueryString["id"];
        TextBox2.Text = Request.QueryString["description"];
        TextBox3.Text = work.getMaxPrice(Request.QueryString["id"]).ToString();
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
            //string staffId = (string)Session["user"];
            Staff staff = work.getSpecificStaff("10101");
            int i = work.saveDiscrepancy(String.Format("{0:d5}", (Convert.ToInt32(work.getMaxDiscrepancyId()) + 1)), Convert.ToInt32(TextBox4.Text), TextBox5.Text, "Pending Approval", Work.getItem(TextBox1.Text), staff, DateTime.Now);
            if (i > 0)
            {
                //string emailToId = work.getEmailToPersonId(TextBox3.Text);
                //string subject = "Request " + work.getMaxDiscrepancyId() + " for approval";
                //string body = "Dear Sir/ Madam,<br />" + "<br />Request " + work.getMaxDiscrepancyId() + " is pending your approval.Please click <a href = 'http://localhost/StationeryStore/Discrepancy/ApproveDiscrepancy.aspx'>here</a> to see more details.<br />" + "<br />Thanks & regards.";
                //SendEmail sm = new SendEmail(emailToId, subject, body);
                //sm.initEmail();
                //sm.sendEmail();
                DialogResult dr = MessageBox.Show("Updated Successfully!", "New Discrepancy", MessageBoxButtons.OK, MessageBoxIcon.Question);
                if (dr == DialogResult.OK)
                {
                    Response.Redirect("ViewDiscrepancy.aspx");
                }
            }
        }
    }
}