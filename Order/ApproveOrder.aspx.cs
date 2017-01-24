using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order_ApproveOrder : System.Web.UI.Page
{
    string userId;
    protected void Page_Load(object sender, EventArgs e)
    {
        userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }

        ConfirmLbl.Visible = YesBtn.Visible = NoBtn.Visible = ReasonLbl.Visible = ReasonTextBox.Visible = Button1.Visible = false;

        if (!IsPostBack)
        {
            List<OrderList> oList = Work.listPendingOrder();
            GridView1.DataSource = oList;
            GridView1.DataBind();
            if (GridView1.Rows.Count == 0)
            {
                Label2.Text = "No pending approval order!";
            }
            else if (GridView1.Rows.Count > 1)
            {
                Label2.Text = "There are totally " + GridView1.Rows.Count + " orders.";
            }
            else
            {
                Label2.Text = "There is only " + GridView1.Rows.Count + " order.";
            }
        }
    }

    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        GridViewRow row = e.Row;
        List<TableCell> columns = new List<TableCell>();
        foreach (DataControlField column in GridView1.Columns)
        {
            TableCell cell = row.Cells[0];
            row.Cells.Remove(cell);
            columns.Add(cell);
        }

        row.Cells.AddRange(columns.ToArray());
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        // Retrieve the row index stored in the CommandArgument property. 
        int index = Convert.ToInt32(e.CommandArgument);

        // Retrieve the row that contains the button from the Rows collection.
        GridViewRow row = GridView1.Rows[index];
        string orderID = row.Cells[0].Text;

        if (e.CommandName == "Approve")
        {
            ConfirmLbl.Text = "Are you sure to <u>approve</u> order " + orderID + "? ";
        }
        else
        {
            ConfirmLbl.Text = "Are you sure to <u>reject</u> order " + orderID + "? ";
        }

        ConfirmLbl.Visible = YesBtn.Visible = NoBtn.Visible = true;
    }

    protected void YesBtn_Click(object sender, EventArgs e)
    {
        string lbl = ConfirmLbl.Text;
        string orderID = lbl.Substring(lbl.Length - 11, 9);

        if (ConfirmLbl.Text.Contains("approve"))
        {
            string stt = "Approved";
            Work.UpdateOrderStatus(orderID, stt);

            string message = "The order " + orderID + " is approved successfully.";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('" + message + "');window.location='ApproveOrder.aspx'", true);
        }
        else
        {
            ConfirmLbl.Visible = YesBtn.Visible = NoBtn.Visible = false;
            ReasonLbl.Visible = ReasonTextBox.Visible = Button1.Visible = true;
            ReasonLbl.Text = "Specify reasons for reject order " + orderID + " (optional): ";
        }
    }

    protected void NoBtn_Click(object sender, EventArgs e)
    {
        ConfirmLbl.Visible = YesBtn.Visible = NoBtn.Visible = false;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string lbl = ConfirmLbl.Text;
        string orderID = lbl.Substring(lbl.Length - 11, 9);
        string stt = "Rejected";
        Work.UpdateOrderStatus(orderID, stt);
        if (ReasonTextBox.Text != String.Empty)
        {
            Work.UpdateComment(orderID, ReasonTextBox.Text);
        }
        string message = "The order " + orderID + " is rejected.";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('" + message + "');window.location='ApproveOrder.aspx'", true);
    }
}