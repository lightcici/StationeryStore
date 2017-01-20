﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MaintainDepartmentList1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSource = Work.GetDepartment();

            GridView1.DataBind();
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataSource = Work.GetDepartment();

        GridView1.DataBind();


    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        e.Cancel = true;
        GridView1.EditIndex = -1;
        GridView1.DataSource = Work.GetDepartment();

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



        Work.UpdateDepartment(departmentCode, DepartmentName, ContactName, Telephone, HeadName, Collection_Point, RepresentativeName);
        GridView1.EditIndex = -1;
        GridView1.DataSource = Work.GetDepartment();

        GridView1.DataBind();


        //UpdateSupplier(SupplierCode,SupplierName,GSTRegistrationNo,ContactName,Phone,Fax,Address);
        //method name: UpdateSupplier
        //input arguments: SupplierCode,SupplierName,GSTRegistrationNo,ContactName,Phone,Fax,Address
        //return type: void
    }

    protected void GridView1_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = Convert.ToInt32(e.RowIndex);

        //GridView1.DeleteRow(index);
        GridViewRow row = GridView1.Rows[e.RowIndex];
        string departmentcode = row.Cells[0].Text;

        Work.DeleteDepartment(departmentcode);
        GridView1.DataSource = Work.GetDepartment();
        GridView1.DataBind();



        //GridView1.DataSource = GetSuppliers();
        //no input argument
        //return type is list of suppliers (select * from suppliers)


    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("MaintainDepartmentList2.aspx");
    }
}