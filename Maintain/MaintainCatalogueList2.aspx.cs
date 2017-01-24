using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MaintainCatalogueList2 : System.Web.UI.Page
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
            DropDownList1.DataSource = Work.GetCategory();
            DropDownList1.DataTextField = "Category";
            DropDownList1.DataValueField = "Category";

            DropDownList1.DataBind();
            DropDownList2.DataSource = Work.GetUOM();
            DropDownList2.DataTextField = "UOM";
            DropDownList2.DataValueField = "UOM";

            DropDownList2.DataBind();
            

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string itemID = TextBox1.Text;
        string category = DropDownList1.SelectedValue;
        string description = TextBox3.Text;
        string reorderlevel = TextBox4.Text;
        string reorderQty = TextBox5.Text;
        string uom = DropDownList2.SelectedValue;
        string binNo = TextBox7.Text;

        Work.CreateItem(itemID, description, category, reorderlevel, reorderQty, uom, binNo);

        Response.Redirect("MaintainCatalogueList1.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("MaintainCatalogueList1.aspx");
    }
}