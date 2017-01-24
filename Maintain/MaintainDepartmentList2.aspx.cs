using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MaintainDepartmentList2 : System.Web.UI.Page
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
            DropDownList1.DataSource = Work.GetCollectionPoint();
            DropDownList1.DataTextField = "Collection_Point";
            DropDownList1.DataValueField = "Collection_Point";

            DropDownList1.DataBind();
            string chosenCollectionPoint = DropDownList1.SelectedValue;

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Team5ADProjectEntities model = new Team5ADProjectEntities();
        string DeptID = TextBox1.Text;
        string collectionpoint = DropDownList1.SelectedValue;
        string departmentname = TextBox3.Text;
        string contact = TextBox4.Text;
        string tel = TextBox5.Text;
        string headname = TextBox6.Text;
        string repName = TextBox7.Text;

        //Work.CreateDepartment(DeptID, departmentname, contact,
        //tel, collectionpoint);
        Department toAddDepartment = new Department();


        toAddDepartment.DepartmentID = DeptID;
        toAddDepartment.DepartmentName = departmentname;
        toAddDepartment.ContactName = contact;
        toAddDepartment.Telephone = tel;

        toAddDepartment.Collection_Point = collectionpoint;


        model.Departments.Add(toAddDepartment);
        try
        {
            model.SaveChanges();
        }

        catch (DbEntityValidationException ex)
        {
            string errorMessages = string.Join("; ", ex.EntityValidationErrors.SelectMany(x => x.ValidationErrors).Select(x => x.ErrorMessage));
            throw new DbEntityValidationException(errorMessages);
        }
        Staff departmentHead = model.Staffs.Where(p => p.Name == headname).First();
        departmentHead.Role = "DeptHead";
        departmentHead.DepartmentID = DeptID;
        Staff departmentRep = model.Staffs.Where(p => p.Name == repName).First();
        departmentRep.Role = "DeptRep";
        departmentRep.DepartmentID = DeptID;
        model.SaveChanges();
        Response.Redirect("MaintainDepartmentList1.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("MaintainDepartmentList1.aspx");
    }
}