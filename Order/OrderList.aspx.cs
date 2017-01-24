using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order_OrderList : System.Web.UI.Page
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

            List<OrderList> oList = Work.getOrderList();
            OrderListGV.DataSource = oList;
            OrderListGV.DataBind();
            if (OrderListGV.Rows.Count == 0)
            {
                Label2.Text = "No order!";
            }
           else if (OrderListGV.Rows.Count > 1)
            {
                Label2.Text = "There are totally " + OrderListGV.Rows.Count + " orders.";
            }
            else
            {
                Label2.Text = "There is only " + OrderListGV.Rows.Count + " order.";
            }
        }
        Label1.Text = "";        
    }



    protected void OrderBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("ItemList.aspx");
    }

    protected void SearchDDL_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewState["status"] = SearchDDL.SelectedValue;
        List<OrderList> list = Work.getOrderList((string)ViewState["status"]);
        OrderListGV.DataSource = list;
        OrderListGV.DataBind();

        if (!list.Any())
        {
            Label2.Text = "No item found!";
        }
        else
        {
            if (OrderListGV.Rows.Count > 1)
            {
                Label2.Text = "There are totally " + OrderListGV.Rows.Count + " orders.";
            }
            else
            {
                Label2.Text = "There is only " + OrderListGV.Rows.Count + " order.";
            }
            
        }
    }



    protected void OrderListGV_RowCreated(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        List<TableCell> columns = new List<TableCell>();
        foreach (DataControlField column in OrderListGV.Columns)
        {
            //Get the first Cell /Column
            TableCell cell = row.Cells[0];
            // Then Remove it after
            row.Cells.Remove(cell);
            //And Add it to the List Collections
            columns.Add(cell);
        }

        // Add cells
        row.Cells.AddRange(columns.ToArray());
    }


    protected void OrderListGV_SelectedIndexChanged(object sender, EventArgs e)
    {
        StringBuilder x;
        GridViewRow row = OrderListGV.SelectedRow;
        string stt = row.Cells[5].Text;
        string orderID = row.Cells[0].Text;
        string itemID = row.Cells[1].Text;
        string description = row.Cells[2].Text;
        string quantity = row.Cells[3].Text;
        string justification = row.Cells[4].Text;

        if ((stt == "Cancelled") || (stt == "Completed"))
        {
            Label1.Text = "The order <b>" + orderID + "</b> is <b>" + stt.ToLower() + "</b>. No more further process.";
        }
        else if (stt == "Rejected")
        {
            x = new StringBuilder();
            x.Append("The order <b>" + orderID + "</b> is <b>" + stt.ToLower() + "</b>.");

            string cmt = Work.ShowComment(orderID);
            if (cmt != null)
            {
                x.Append(" The reason is " + cmt + ".");
            }
            Label1.Text = x.ToString();
        }
        else if (stt == "Approved")
        {
            Response.Redirect("ProceedApprovedOrder.aspx?Order=" + orderID + "&Item=" + itemID + "&Description=" + description + "&Quantity=" + quantity);
        }
        else if (stt == "Ordered")
        {
            Response.Redirect("AcknowledgeOrder.aspx?OrderID=" + orderID + "&Item=" + itemID + "&Description=" + description);
        }
        else if (stt == "PendingApproval")
        {
            Response.Redirect(String.Format("EditOrder.aspx?Order={0}&Item={1}&Description={2}&Quantity={3}&Justification={4}", orderID, itemID, Server.UrlEncode(description), quantity, justification.Replace("\n", " ")));
            //  Response.Redirect("EditOrder.aspx?Order=" + orderID + "&Item=" + itemID + "&Description=" + description + "&Quantity=" + quantity + "&Justification=" + justification.Replace("\n", " "));
        }

    }
}