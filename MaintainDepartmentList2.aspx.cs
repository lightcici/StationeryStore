using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MaintainDepartmentList2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.DataSource = Work.GetCollectionPoint();
            DropDownList1.DataTextField = "Collection_Point";
            DropDownList1.DataValueField = "Collection_Point";

            DropDownList1.DataBind();
            string chosenCollectionPoint = DropDownList1.SelectedValue;

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string DeptID = TextBox1.Text;
        string collectionpoint = DropDownList1.SelectedValue;
        string departmentname = TextBox3.Text;
        string contact = TextBox4.Text;
        string tel = TextBox5.Text;
        string headname = TextBox6.Text;
        string repName = TextBox7.Text;

        Work.CreateDepartment(DeptID, departmentname, contact,
        tel, headname, collectionpoint, repName);


        Response.Redirect("MaintainDepartmentList1.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("MaintainDepartmentList1.aspx");
    }
}