using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Order_ItemList : System.Web.UI.Page
{
    Team5ADProjectEntities context;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Text = "";
        context = new Team5ADProjectEntities();
        if (!IsPostBack)
        {
            ShowAllBtn.Enabled = false;
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

    protected void OrderBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("MakeNewOrder.aspx");
    }

    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        ShowAllBtn.Enabled = true;
        if (!(string.IsNullOrEmpty(SearchTextBox.Text)))
        {
            context = new Team5ADProjectEntities();
            var q = from x in context.Items
                    where x.Description.ToLower().Contains(SearchTextBox.Text.ToLower())
                    select new { x.ItemID, x.Category, x.Description, x.ReorderLevel, x.ReorderQty, x.UOM };
            if (!q.Any())
            {
                Label2.Text = "No item found!";
            }
            GridView1.DataSource = q.ToList();
            GridView1.DataBind();
        }
    }

    protected void ShowAllBtn_Click(object sender, EventArgs e)
    {
        ShowAllBtn.Enabled = false;
        SearchTextBox.Text = String.Empty;
        BindGV();
    }


    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes.Add("onmouseover", "this.style.textDecoration='underline';this.style.backgroundColor ='#CCCCCC'");
            e.Row.Attributes.Add("onmouseout", "this.style.textDecoration='none',this.style.backgroundColor=''");
            e.Row.ToolTip = "Click on item to order!";
            e.Row.Attributes.Add("style", "cursor:pointer;");
            e.Row.Attributes["onClick"] = string.Format("window.location = 'MakeNewOrder.aspx?ItemID={0}&Description={1}';", DataBinder.Eval(e.Row.DataItem, "ItemID"), DataBinder.Eval(e.Row.DataItem, "Description"));

        }
    }
}