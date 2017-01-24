using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangeRep : System.Web.UI.Page
{
    //GetInfo getInfo = new GetInfo();
    

    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            DropDownList1.DataSource = Work.getDptSfInfo().Select(x => x.Name).ToList();
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem(""));
            TextBox1.Text = Work.someInfo("oldrep").Name;
        }
        
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //Team5ADProjectEntities ctx = new Team5ADProjectEntities();
        //TextBox1.Text = DropDownList1.Text;
        //Staff newrep = ctx.Staffs.Where(x => x.Name == DropDownList1.Text).First();
        //newrep.Role = "DeptRep";
        //string oldrepid = getInfo.someInfo("oldrep").UserID;
        //Staff oldrep = ctx.Staffs.Where(x => x.UserID == oldrepid).First();
        //oldrep.Role = "Employee";
        //ctx.SaveChanges();
        
        
        Work.ChangeRep(DropDownList1.Text);
    }
}