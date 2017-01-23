using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

public partial class ApproveDiscrepancy : System.Web.UI.Page
{
    Work work;
    List<DiscrepancySupplyDetailsModel> li;
    protected void Page_Load(object sender, EventArgs e)
    {
        //string userId = (string)Session["user"];
        string userId = "54188";
        work = new Work();
        if (!IsPostBack)
        {
            if (work.listPendingDiscrepancies(userId).Count == 0)
            {
                Label1.Visible = true;
                Label1.Text = "All things run well so far!No discrepancy!";
            }
            else
            {
                li = work.listPendingDiscrepancies(userId);
                GridView1.DataSource = li;
                GridView1.DataBind();
            }
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
                Response.Redirect("ApproveDiscrepancy.aspx");
            }
        }
    }
    protected void display()
    {
        GridView1.DataBind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        TableCell myCell1 = e.Row.Cells[0];
        e.Row.Cells.RemoveAt(0);
        e.Row.Cells.Add(myCell1);
    }

    protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView2.PageIndex = e.NewPageIndex;
    }
}
