using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewNotification : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect("MakeNewOrder.aspx?ItemID=1&Description=2");
    }
}