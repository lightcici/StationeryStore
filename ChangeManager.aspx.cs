using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangeManager : System.Web.UI.Page
{
    GetInfo getInfo = new GetInfo();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.DataSource = getInfo.getDptSfInfo().Select(x => x.Name).ToList();
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem(""));
            TextBox1.Text = getInfo.someInfo("manager").Name;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Team5ADProjectEntities ctx = new Team5ADProjectEntities();
        TextBox1.Text = DropDownList1.Text;
        Staff newmanager = ctx.Staff.Where(x => x.Name == DropDownList1.Text).First();
        newmanager.Role = "Manager";
        string oldmanagerid = getInfo.someInfo("manager").UserID;
        Staff oldmanager = ctx.Staff.Where(x => x.UserID == oldmanagerid).First();
        oldmanager.Role = "Clerk";
        ctx.SaveChanges();
    }
}