using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order_OrderHistory : System.Web.UI.Page
{
    Team5ADProjectEntities context;
    protected void Page_Load(object sender, EventArgs e)
    {
        context = new Team5ADProjectEntities();
        if (!IsPostBack)
        {
            ShowData();
        }
        // Label1.Text = "";
    }

    void ShowData()
    {
        var q = from x in context.Orders
                where x.Status != "PendingApproval"
                orderby x.OrderDate descending
                select new { x.OrderID, x.ItemID, x.Item.Category, x.Item.Description, x.TotalQty, x.Justification, x.Status, x.OrderDate, x.Comment };
        HistoryGV.DataSource = q.ToList();
        HistoryGV.DataBind();
        Label1.Text = "There are totally " + q.Count() + " orders.";
    }

    protected void SearchDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        context = new Team5ADProjectEntities();
        if (SearchDDL.SelectedIndex != 1)
        {
            var q = from x in context.Orders
                    where x.Status == SearchDDL.SelectedItem.Text
                    orderby x.OrderDate descending
                    select new { x.OrderID, x.ItemID, x.Item.Category, x.Item.Description, x.TotalQty, x.Justification, x.Status, x.OrderDate, x.Comment };
            if (!q.Any())
            {
                Label1.Text = "No item!";
            }
            else
            {
                Label1.Text = "There are " + q.Count() + " orders.";
            }
            HistoryGV.DataSource = q.ToList();
        }
        else
        {
            var q = from x in context.Orders
                    where x.Status != "PendingApproval"
                    orderby x.OrderDate descending
                    select new { x.OrderID, x.ItemID, x.Item.Category, x.Item.Description, x.TotalQty, x.Justification, x.Status, x.OrderDate, x.Comment };
            if (!q.Any())
            {
                Label1.Text = "No item!";
            }
            else
            {
                Label1.Text = "There are totally " + q.Count() + " orders.";
            }
            HistoryGV.DataSource = q.ToList();
        }

        HistoryGV.DataBind();
    }
}