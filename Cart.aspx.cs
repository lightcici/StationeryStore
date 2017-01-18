using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            cartGridView.DataSource = Session["cartItemDisplay"];
            cartGridView.DataBind();
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
        cartGridView.DataBind();
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        //string userid = (string) Session["user"];
        string userid = "00281";
        DateTime date = DateTime.Now;
        //string deptId = Work.getUser(userid).DepartmentID;
        //string id = Work.getRequestId(depId);
        string deptId = "COMM";
        string id = Work.getRequestId("COMM");
        string newId = null; ;
        if (id == null)
        {
            newId = deptId + "00001";

        }
        else
        {
            newId = deptId + (String.Format("{0:D5}", Convert.ToInt32(id.Substring(id.Length - 2)) + 1));
        }
        Request rq = new Request();
        rq.RequestID = newId;
        rq.RequestDate = date;
        rq.UserID = userid;
        Work.createRequest(rq);

        foreach (CartItem ci in cartItemList)
        {
            RequestDetail rd = new RequestDetail();
            rd.RequestID = newId;
            rd.ItemID = ci.itemId;
            rd.RequestQty = ci.quantity;
            rd.Status = "Pending Approval";
            Work.createRequestDetail(rd);

            //Work.updateOutstangQty(deptId, ci.item.ItemID, ci.quantity);
            //Work.updateOutstangQty("COMM", ci.item.ItemID, ci.quantity);

        }
        Response.Redirect("RequestHistory.aspx");
    }
}