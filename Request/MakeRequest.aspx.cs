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
        string userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }

        if (!IsPostBack)
        {
            List<Item> list = Work.getAllItems();
            Session["itemList"] = list;
            display();
            
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        List<Item> search = Work.getFoundItems(TextBox1.Text);
        Session["itemList"] = search;
        display();

    }

    protected void display()
    {
        List<Item> list = (List <Item> ) Session["itemList"];
        itemGridView.DataSource = list;
        itemGridView.DataBind();
        
    }

    protected void itemGridView_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        itemGridView.PageIndex = e.NewPageIndex;
        display();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Dictionary<string, int> cart = (Dictionary <string, int>) Session["cart"];
        if (cart == null)
            cart = new Dictionary<string, int>();
        List<Item> list = (List <Item> )Session["itemList"];
        int page = itemGridView.PageIndex;
        int size = 0;
        if(page != itemGridView.PageCount - 1)
        {
            size = 10;
        }else
        {
            size = list.Count() - 10 *page;
        }
        
        for (int i = 0; i < size; i++)
        {
            TextBox quantity = itemGridView.Rows[i].FindControl("quantity") as TextBox;
            int qty = 0;
            if (!String.IsNullOrEmpty(quantity.Text))
            {
                bool isInt = int.TryParse(quantity.Text, out qty);
            }

            if (qty > 0)
            {
                if(cart.Count() !=0 && cart.ContainsKey(list[page * 10 + i].ItemID))
                {
                    cart[list[page*10+i].ItemID] = qty;

                }
                else
                {
                    cart.Add(list[page * 10 + i].ItemID, qty);

                }

            }

        }
        Session["cart"] = cart;
        if (cart.Count() != 0)
        {
            Label1.Text = "Your items haven been added to cart successfully.";

        }else
        {
            Label1.Text = "Please select item to add.";
        }

    }


    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Dictionary<string, int> cart = (Dictionary<string, int>)Session["cart"];
        if(cart == null || cart.Count()==0)
        {
            Label3.Text = "Your cart is currently empty.";
        }
        else
        {
            Response.Redirect("Cart.aspx");

        }
    }
}