using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class LowInStock : System.Web.UI.Page
{
    string userId;
    protected void Page_Load(object sender, EventArgs e)
    {
        userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }

        if (!IsPostBack)
        {
            List<Item> list = Work.lowInStock();
            GridView1.DataSource = list;
            GridView1.DataBind();
        }
    }
}