using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MaintainDepartmentList1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }
        Team5ADProjectEntities model = new Team5ADProjectEntities();
        if (!IsPostBack)
        {

            var query = from head in model.Staffs.Where(head => head.Role == "DeptHead")
                        join rep in model.Staffs.Where(rep => rep.Role == "DeptRep")
                        on head.DepartmentID equals rep.DepartmentID
                        join
                        department in model.Departments
                        on head.DepartmentID equals department.DepartmentID
                        select new
                        {
                            ID = department.DepartmentID,
                            DepartmentName = department.DepartmentName,
                            ContactName = department.ContactName,
                            Telephone = department.Telephone,
                            DeptHead = head.Name,
                            CollectionPoint = department.Collection_Point,
                            DeptRep = rep.Name,

                        };


            GridView1.DataSource = query.ToList();
            GridView1.DataBind();
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;

        Team5ADProjectEntities model = new Team5ADProjectEntities();
        var query = from head in model.Staffs.Where(head => head.Role == "DeptHead")
                    join rep in model.Staffs.Where(rep => rep.Role == "DeptRep")
                    on head.DepartmentID equals rep.DepartmentID
                    join
                    department in model.Departments
                    on head.DepartmentID equals department.DepartmentID
                    select new
                    {
                        ID = department.DepartmentID,
                        DepartmentName = department.DepartmentName,
                        ContactName = department.ContactName,
                        Telephone = department.Telephone,
                        DeptHead = head.Name,
                        CollectionPoint = department.Collection_Point,
                        DeptRep = rep.Name,

                    };


        GridView1.DataSource = query.ToList();

        GridView1.DataBind();

    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        e.Cancel = true;
        GridView1.EditIndex = -1;

        Team5ADProjectEntities model = new Team5ADProjectEntities();
        var query = from head in model.Staffs.Where(head => head.Role == "DeptHead")
                    join rep in model.Staffs.Where(rep => rep.Role == "DeptRep")
                    on head.DepartmentID equals rep.DepartmentID
                    join
                    department in model.Departments
                    on head.DepartmentID equals department.DepartmentID
                    select new
                    {
                        ID = department.DepartmentID,
                        DepartmentName = department.DepartmentName,
                        ContactName = department.ContactName,
                        Telephone = department.Telephone,
                        DeptHead = head.Name,
                        CollectionPoint = department.Collection_Point,
                        DeptRep = rep.Name,

                    };


        GridView1.DataSource = query.ToList();

        GridView1.DataBind();



    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];


        TextBox txtDepartmentName = (TextBox)row.FindControl("txtDepartmentName");
        TextBox txtContactName = (TextBox)row.FindControl("txtContactName");
        TextBox txtTelephone = (TextBox)row.FindControl("txtTelephone");
        TextBox txtHeadName = (TextBox)row.FindControl("txtHeadName");
        TextBox txtCollection_Point = (TextBox)row.FindControl("txtCollection_Point");
        TextBox txtRepresentativeName = (TextBox)row.FindControl("txtRepresentativeName");

        string DepartmentName = txtDepartmentName.Text;
        string ContactName = txtContactName.Text;
        string Telephone = txtTelephone.Text;
        string HeadName = txtHeadName.Text;
        string Collection_Point = txtCollection_Point.Text;
        string RepresentativeName = txtRepresentativeName.Text;

        //string SupplierCode = GridView1.DataKeys[e.RowIndex].Value.ToString();
        string departmentCode = row.Cells[0].Text;

        Team5ADProjectEntities model = new Team5ADProjectEntities();
        //List<Department> departmentlist = new List<Department>();
        Department affectedDepartment = new Department();
        affectedDepartment = model.Departments.Where(department => department.DepartmentID == departmentCode).First();

        affectedDepartment.DepartmentName = DepartmentName;
        affectedDepartment.ContactName = ContactName;
        affectedDepartment.Telephone = Telephone;

        affectedDepartment.Collection_Point = Collection_Point;


        List<Staff> stafflistofdeptHead = new List<Staff>();
        stafflistofdeptHead = model.Staffs.Where(staff => staff.Role == "DeptHead" &&
        staff.DepartmentID == departmentCode).ToList();
        foreach (Staff c in stafflistofdeptHead)
        {
            c.Role = "Employee";
            stafflistofdeptHead.Remove(c);

        }
        Staff toAddtoList = new Staff();
        toAddtoList = model.Staffs.Where(staff => staff.Name == HeadName).First();

        toAddtoList.Role = "DeptHead";
        stafflistofdeptHead.Add(toAddtoList);

        List<Staff> stafflistofdeptRep = new List<Staff>();
        stafflistofdeptHead = model.Staffs.Where(staff => staff.Role == "DeptRep" &&
        staff.DepartmentID == departmentCode).ToList();
        foreach (Staff c in stafflistofdeptRep)
        {
            c.Role = "Employee";
            stafflistofdeptRep.Remove(c);

        }
        Staff toAddtoListofRep = new Staff();
        toAddtoListofRep = model.Staffs.Where(staff => staff.Name == RepresentativeName).First();
        toAddtoListofRep.Role = "DeptRep";
        stafflistofdeptHead.Add(toAddtoList);
        model.SaveChanges();

        //Work.UpdateDepartment(departmentCode, DepartmentName, ContactName, Telephone, HeadName, Collection_Point, RepresentativeName);


        var query = from head in model.Staffs.Where(head => head.Role == "DeptHead")
                    join rep in model.Staffs.Where(rep => rep.Role == "DeptRep")
                    on head.DepartmentID equals rep.DepartmentID
                    join
                    department in model.Departments
                    on head.DepartmentID equals department.DepartmentID
                    select new
                    {
                        ID = department.DepartmentID,
                        DepartmentName = department.DepartmentName,
                        ContactName = department.ContactName,
                        Telephone = department.Telephone,
                        DeptHead = head.Name,
                        CollectionPoint = department.Collection_Point,
                        DeptRep = rep.Name,

                    };

        GridView1.EditIndex = -1;
        GridView1.DataSource = query.ToList();
        GridView1.DataBind();


       
       


        //UpdateSupplier(SupplierCode,SupplierName,GSTRegistrationNo,ContactName,Phone,Fax,Address);
        //method name: UpdateSupplier
        //input arguments: SupplierCode,SupplierName,GSTRegistrationNo,ContactName,Phone,Fax,Address
        //return type: void
    }

    protected void GridView1_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = Convert.ToInt32(e.RowIndex);
        Team5ADProjectEntities model = new Team5ADProjectEntities();
        //GridView1.DeleteRow(index);
        GridViewRow row = GridView1.Rows[e.RowIndex];
        string departmentcode = row.Cells[0].Text;

        Work.DeleteDepartment(departmentcode);
        var query = from head in model.Staffs.Where(head => head.Role == "DeptHead")
                    join rep in model.Staffs.Where(rep => rep.Role == "DeptRep")
                    on head.DepartmentID equals rep.DepartmentID
                    join
                    department in model.Departments
                    on head.DepartmentID equals department.DepartmentID
                    select new
                    {
                        ID = department.DepartmentID,
                        DepartmentName = department.DepartmentName,
                        ContactName = department.ContactName,
                        Telephone = department.Telephone,
                        DeptHead = head.Name,
                        CollectionPoint = department.Collection_Point,
                        DeptRep = rep.Name,

                    };
        GridView1.DataSource = query.ToList();
        GridView1.DataBind();
    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("MaintainDepartmentList2.aspx");
    }
}