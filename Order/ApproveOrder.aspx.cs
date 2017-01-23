using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order_ApproveOrder : System.Web.UI.Page
{
    Team5ADProjectEntities context;
    protected void Page_Load(object sender, EventArgs e)
    {
        context = new Team5ADProjectEntities();
        Label2.Visible = ConfirmLbl.Visible = YesBtn.Visible = NoBtn.Visible = ReasonLbl.Visible = ReasonTextBox.Visible = Button1.Visible = false;
        if (!IsPostBack)
        {
            ShowData();
        }
    }

    void ShowData()
    {
        var q1 = from x in context.Orders
                 where x.Status == "PendingApproval"
                 orderby x.OrderDate
                 select new { x.OrderID, x.ItemID, x.Item.Category, x.Item.Description, x.TotalQty, x.Justification };
        if (!q1.Any())
        {
            Label2.Visible = true;
            Label2.Text = "Currently, there are no pending approval order!";
        }
        GridView1.DataSource = q1.ToList();
        GridView1.DataBind();
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
            ConfirmLbl.Text = "Are you sure to approve order " + orderID + "? ";
            // Order o = context.Orders.Where(x => x.OrderID == orderID).First();
            //  o.Status = "Approved";
            // context.SaveChanges();

            // string message = "The order " + orderID + " is approved successfully.";
            //  ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('" + message + "');window.location='ApproveOrder.aspx'", true);
        }
        else
        {
            ConfirmLbl.Text = "Are you sure to reject order " + orderID + "? ";
            //  ConfirmLbl.Visible = YesBtn.Visible = NoBtn.Visible = ReasonLbl.Visible = ReasonTextBox.Visible = Button1.Visible = Button2.Visible = true;

            //  Order o = context.Orders.Where(x => x.OrderID == orderID).First();
            //   if (ReasonTextBox.Text != String.Empty)
            //   {
            //       o.Comment = ReasonTextBox.Text;
            //   }
            //   o.Status = "Rejected";
            //   context.SaveChanges();

            //   string message = "The order " + orderID + " is rejected.";
            //   ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('" + message + "');window.location='ApproveOrder.aspx'", true);
        }

        ConfirmLbl.Visible = YesBtn.Visible = NoBtn.Visible = true;
    }

    protected void YesBtn_Click(object sender, EventArgs e)
    {
        context = new Team5ADProjectEntities();
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
        context = new Team5ADProjectEntities();
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