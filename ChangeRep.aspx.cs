using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangeRep : System.Web.UI.Page
{


    string userId;
    string oldRep;
    protected void Page_Load(object sender, EventArgs e)
    {
        userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }

        if (!IsPostBack)
        {
            DropDownList1.DataSource = Work.getDptSfInfo(userId).Select(x => x.Name).ToList();
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Please Select"));
            oldRep = Work.getUser(Work.getDeptRep(userId)).Name;
            TextBox1.Text = oldRep;
        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string newRep = DropDownList1.Text;
        Work.ChangeRep(Work.getUser(Work.getDeptRep(userId)).Name,newRep);
        Response.Redirect("ChangeRep.aspx");
    }
}