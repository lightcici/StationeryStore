using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MakeRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            List<Item> list = Work.getAllItems();
            display(list);
            
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        List<Item> search = Work.getFoundItems(TextBox1.Text);
        display(search);

    }

    protected void display(List<Item> list)
    {
        Session["itemList"] = list;
        itemGridView.DataSource = list;
        itemGridView.DataBind();
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Dictionary<string, int> cart = (Dictionary <string, int>) Session["cart"];
        if (cart == null)
            cart = new Dictionary<string, int>();
        List<Item> list = (List <Item> )Session["itemList"];
        for (int i = 0; i < list.Count(); i++)
        {
            TextBox quantity = itemGridView.Rows[i].FindControl("quantity") as TextBox;
            int qty = 0;
            if (!String.IsNullOrEmpty(quantity.Text))
            {
                bool isInt = int.TryParse(quantity.Text, out qty);
            }

            if (qty > 0)
            {
                if(cart.Count() !=0 && cart.ContainsKey(list[i].ItemID))
                {
                    cart[list[i].ItemID] = qty;

                }
                else
                {
                    cart.Add(list[i].ItemID, qty);

                }

            }

        }
        Session["cart"] = cart;
        Label1.Text = "Your items haven been added to cart successfully.";
        
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        if(Session["cart"] == null)
        {
            Label1.Text = "Your cart is currently empty.";
        }else
        {
            Response.Redirect("Cart.aspx");

        }
    }
}