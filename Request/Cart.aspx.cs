﻿using System;
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
        string userId = (string)Session["user"];
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

        MailMessage mail = new MailMessage("e0046825@u.nus.edu", "e0046825@u.nus.edu");
        SmtpClient client = new SmtpClient();
        client.EnableSsl = true;
        client.Port = 25;
        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.UseDefaultCredentials = false;
        client.Host = "lynx.class.iss.nus.edu.sg";
        client.UseDefaultCredentials = false;
        client.Credentials = new System.Net.NetworkCredential("e0046825@u.nus.edu", "");
        mail.Subject = "this is a test email.";
        mail.Body = "this is my test email body";
        client.Send(mail);

        Response.Redirect("RequestHistory.aspx");
    }
}