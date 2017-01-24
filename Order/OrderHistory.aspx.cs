using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order_OrderHistory : System.Web.UI.Page
{
    string userId;
    static string all = "Show All";
    protected void Page_Load(object sender, EventArgs e)
    {
        userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }

        if (!IsPostBack)
        {
            var list = Work.getOrderStatus();
            list.Insert(0, all);
            SearchDDL.DataSource = list;
            SearchDDL.DataBind();

            List<OrderList> oList = Work.getOrderHistory();
            HistoryGV.DataSource = oList;
            HistoryGV.DataBind();
            if (HistoryGV.Rows.Count == 0)
            {
                Label2.Text = "No order!";
            }
            else if (HistoryGV.Rows.Count > 1)
            {
                Label1.Text = "There are totally " + HistoryGV.Rows.Count + " orders.";
            }
            else
            {
                Label1.Text = "There is only " + HistoryGV.Rows.Count + " order.";
            }
        }
    }

    protected void SearchDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["status"] = SearchDDL.SelectedValue;
        List<OrderList> list = Work.getOrderHistory((string)ViewState["status"]);
        HistoryGV.DataSource = list;
        HistoryGV.DataBind();

        if (!list.Any())
        {
            Label1.Text = "No item found!";
        }
        else
        {
            if (HistoryGV.Rows.Count > 1)
            {
                Label1.Text = "There are totally " + HistoryGV.Rows.Count + " orders.";
            }
            else
            {
                Label1.Text = "There is only " + HistoryGV.Rows.Count + " order.";
            }

        }
    }
}