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
            e.Row.Attributes.Add("onmouseover", "if(this!=prevselitem){this.style.backgroundColor='#Efefef'}");//当鼠标停留时更改背景色
            e.Row.Attributes.Add("onmouseout", "if(this!=prevselitem){this.style.backgroundColor='#ffffff'}");//当鼠标移开时还原背景色
            e.Row.Attributes.Add("onclick", e.Row.ClientID.ToString() + ".checked=true;selectx(this)");//点击行变色
            //e.Row.Attributes["style"] = "Cursor:hand"; //设置悬浮鼠标指针形状为"小手"
            //GridView1.HeaderRow.Cells[10].Visible = false;
            //e.Row.Cells[10].Visible = false;//隐藏选择按钮
            //String evt = Page.ClientScript.GetPostBackClientHyperlink(sender as System.Web.UI.WebControls.GridView, "Select$" + e.Row.RowIndex.ToString());
            //e.Row.Attributes.Add("selected", e.Row.RowIndex.ToString());//执行选择行GridView1_SelectedIndexChanged事件
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