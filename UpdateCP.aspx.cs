using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UpdateCP : System.Web.UI.Page
{
    Team5ADProjectEntities ctx = new Team5ADProjectEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Department d = ctx.Departments.Where(x => x.DepartmentID == "CPSC").First();
            TextBox1.Text = d.Collection_Point.ToString();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Team5ADProjectEntities ctx = new Team5ADProjectEntities();
        TextBox1.Text = RadioButtonList1.Text.ToString();
        Department d = ctx.Departments.Where(x => x.DepartmentID == "CPSC").First();
        if (RadioButtonList1.SelectedValue !="")
        {
            d.Collection_Point = RadioButtonList1.Text;
            ctx.SaveChanges();
        }
        else
        {
            
        }
        
       
        

    }
}