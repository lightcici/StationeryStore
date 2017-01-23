using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ShowItemList : System.Web.UI.Page
{
    Work work;
    List<ItemModel> ilist;
    protected void Page_Load(object sender, EventArgs e)
    {
        work = new Work();
        if (ViewState["category"] == null)
        {
            ilist = work.showAllItems();
            GridView1.DataSource = ilist;
            GridView1.DataBind();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        ViewState["category"] = TextBox1.Text;
        if (TextBox1.Text.Trim() == String.Empty)
        {
            ilist = work.showAllItems();
        }
        else
        {
            ilist = work.searchItems((string)ViewState["category"]);
        }
        GridView1.DataSource = ilist;
        GridView1.DataBind();
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "if(this!=prevselitem){this.style.backgroundColor='#Efefef'}");
            e.Row.Attributes.Add("onmouseout", "if(this!=prevselitem){this.style.backgroundColor='#ffffff'}");
            e.Row.Attributes.Add("onclick", e.Row.ClientID.ToString() + ".checked=true;selectx(this)");
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("NewDiscrepancy.aspx?id=1&description=2");
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