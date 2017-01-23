using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order_AcknowledgeOrder : System.Web.UI.Page
{
    Team5ADProjectEntities context;
    string orderID;
    string itemID;
    protected void Page_Load(object sender, EventArgs e)
    {
        orderID = Request.QueryString["OrderID"];
        context = new Team5ADProjectEntities();
        if (!IsPostBack)
        {
            OrderIDLbl.Text = orderID;
            ItemIDLbl.Text = Request.QueryString["Item"];
            DescriptionLbl.Text = Request.QueryString["Description"];
            DisplayData(orderID);
        }
    }

    void DisplayData(String orderID)
    {
        var q = from x in context.OrderDetails
                where x.Order.OrderID == orderID
                select new { x.PurchaseOrderID, x.SupplierID, x.OrderQty };
        GridView1.DataSource = q.ToList();
        GridView1.DataBind();
    }


    protected void SubmitBtn_Click1(object sender, EventArgs e)
    {
        orderID = Request.QueryString["OrderID"];
        itemID = Request.QueryString["Item"];
        string stt = "Completed";
        Work.UpdateOrderStatus(orderID, stt);
        Work.UpdateItemStock(orderID, itemID);
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            string poNumber = GridView1.Rows[i].Cells[0].Text;
            Work.UpdateOrderDetails(poNumber);
        }

        orderID = Request.QueryString["OrderID"];
        string message = "Acknowledgement for order " + orderID + " is successful.";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "message", "alert('" + message + "');window.location='OrderList.aspx'", true);
    }
}