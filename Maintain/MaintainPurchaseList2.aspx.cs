using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MaintainPurchaseList2 : System.Web.UI.Page
{
    Team5ADProjectEntities context;
    protected void Page_Load(object sender, EventArgs e)
    {
        string userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }
        context = new Team5ADProjectEntities();


        Page.ClientScript.GetPostBackEventReference(GridView1, "");



        if (!IsPostBack)
        {
            BindGV();

        }

    }
    void BindGV()
    {
        var q = from x in context.Items
                select new { x.ItemID, x.Category, x.Description, x.ReorderLevel, x.ReorderQty, x.UOM };
        GridView1.DataSource = q.ToList();
        GridView1.DataBind();
    }



    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        context = new Team5ADProjectEntities();
        var q = from x in context.Items
                where x.Description.ToLower().Contains(SearchTextBox.Text.ToLower())
                select new { x.ItemID, x.Category, x.Description, x.ReorderLevel, x.ReorderQty, x.UOM };
        GridView1.DataSource = q.ToList();
        GridView1.DataBind();
    }

    protected void ShowAllBtn_Click(object sender, EventArgs e)
    {
        SearchTextBox.Text = String.Empty;
        BindGV();
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        foreach (GridViewRow row in GridView1.Rows)
        {
            if (row.RowIndex == GridView1.SelectedIndex)
            {
                row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                row.ToolTip = string.Empty;
            }
            else
            {
                row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                row.ToolTip = "Click to select this row.";
            }
        }

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "Select$" + e.Row.RowIndex);
            e.Row.ToolTip = "Click to select this row.";
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        string ItemID = row.Cells[0].Text;
        string Description = row.Cells[2].Text;
        string UOM = row.Cells[5].Text;
        string chosenSupplierID = Request.QueryString["field1"];
        Response.Redirect("MaintainPurchaseList3.aspx?field1=" + ItemID + "&field2=" + Description +
            "&field3=" + UOM + "&field4=" + chosenSupplierID);

    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;

        GridView1.DataSource = Work.GetItems();

        GridView1.DataBind();
    }


}