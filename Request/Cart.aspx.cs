using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class Cart : System.Web.UI.Page
{
    Dictionary<string, int> cart;
    List<CartItem> cartItemList;
    string userId;
    class CartItem
    {
        public String cat { get; set; }
        public String description { get; set; }
        public int quantity { get; set; }
        public string itemId { get; set; }

        public CartItem(string itemId, string cat, string des, int quantity)
        {
            this.itemId = itemId;
            this.cat = cat;
            this.description = des;
            this.quantity = quantity;

        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }

        cart = (Dictionary<string, int>)Session["cart"];
        if (!IsPostBack)
        {
            cartItemList = new List<CartItem>();
            foreach (KeyValuePair<string, int> entry in cart)
            {
                Item i = Work.getItem(entry.Key);
                cartItemList.Add(new CartItem(i.ItemID, i.Category, i.Description, entry.Value));
            }
            Session["cartItemDisplay"] = cartItemList;
            cartGridView.DataSource = cartItemList;
            cartGridView.DataBind();
        }
        else
        {
            cartItemList = (List<CartItem>)Session["cartItemDisplay"];


        }
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("MakeRequest.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["cart"] = null;
        Response.Redirect("MakeRequest.aspx");
    }

    public void GridView1_RowCommand(object sender, GridViewDeleteEventArgs e)
    {
        cart = (Dictionary<string, int>)Session["cart"];
        cartItemList = (List < CartItem > )Session["cartItemDisplay"];
        CartItem c = cartItemList[e.RowIndex];
        cart.Remove(c.itemId);
        cartItemList.RemoveAt(e.RowIndex);
        cartGridView.DataSource = cartItemList;
        cartGridView.DataBind();
        if (cart.Count() == 0)
        {
            Response.Redirect("MakeRequest.aspx");
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        string userid = (string) Session["user"];
        
        DateTime date = DateTime.Now;
        string deptId = Work.getUser(userid).DepartmentID;
        string id = Work.getRequestId(deptId);
        
        
        string newId = null; ;
        if (id == null)
        {
            newId = deptId + "/00001";

        }
        else
        {
            newId = deptId + "/"+(String.Format("{0:D5}", Convert.ToInt32(id.Substring(id.Length - 2)) + 1));
        }
        Request rq = new Request();
        rq.RequestID = newId;
        rq.RequestDate = date;
        rq.UserID = userid;
        Work.createRequest(rq);

        for (int i=0;i<cartItemList.Count();i++) 
        {
          
            TextBox quantity = cartGridView.Rows[i].FindControl("quantity") as TextBox;
            int qty = 0;
            if (!String.IsNullOrEmpty(quantity.Text))
            {
                bool isInt = int.TryParse(quantity.Text, out qty);
            }
  
            
            RequestDetail rd = new RequestDetail();
            rd.RequestID = newId;
            rd.ItemID = cartItemList[i].itemId;
            rd.RequestQty = qty;
            rd.Status = "PendingApproval";
            Work.createRequestDetail(rd);

            
            


        }
        Session["cart"] = null;

        string headID = Work.getDeptHeadId(Work.getUser(userId).DepartmentID);
        string subject = "Request " + newId + " for approval";
        string body = "Dear Sir/ Madam,<br />" + "<br />Request " + newId + " is pending your approval.Please click <a href = 'http://localhost/StationeryStore/Request/ViewSubmission.aspx'>here</a> to see more details.<br />" + "<br />Thanks & regards.";
        SendEmail sm = new SendEmail(headID, subject, body);
        sm.initEmail();
        sm.sendEmail();
        Response.Redirect("RequestHistory.aspx");
    }
}