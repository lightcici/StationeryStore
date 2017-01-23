using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class ViewDiscrepancy : System.Web.UI.Page
{
    Work work;
    List<ItemDiscrepancyModel> idlist;
    protected void Page_Load(object sender, EventArgs e)
    {
        string userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }
        work = new Work();
        if (ViewState["status"] == null)
        {
            idlist = work.getAllDiscrepancies("ShowAll");
            GridView1.DataSource = idlist;
            GridView1.DataBind();
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["status"] = DropDownList1.SelectedValue;
        idlist = work.getAllDiscrepancies((string)ViewState["status"]);
        GridView1.DataSource = idlist;
        GridView1.DataBind();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("ShowItemList.aspx");
    }
    protected void display()
    {
        GridView1.DataBind();
    }

    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
    }
}