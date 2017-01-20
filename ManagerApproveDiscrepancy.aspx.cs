﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class ApproveDiscrepancy : System.Web.UI.Page
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
        if (work.getSpecificDiscrepancies().Count == 0)
        {
            Label1.Visible = true;
            Label1.Text = "All things run well so far!No discrepancy!";
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int i = work.updateDiscrepancy(e.CommandArgument.ToString(), e.CommandName);
        if (i > 0)
        {
            DialogResult dr = MessageBox.Show("Successful Operation!", "Message", MessageBoxButtons.OK, MessageBoxIcon.Question);
            if (dr == DialogResult.OK)
            {
                Response.Redirect("/ManagerApproveDiscrepancy.aspx");
            }
        }
    }
}