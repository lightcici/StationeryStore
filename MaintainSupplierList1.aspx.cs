using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MaintainSupplierList1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //GridView1.DataSource = GetSuppliers();
            //no input argument
            //return type is list of suppliers (select * from suppliers)
            GridView1.DataBind();


        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        //GridView1.DataSource = GetSuppliers();
        //no input argument
        //return type is list of suppliers (select * from suppliers)
        GridView1.DataBind();


    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        e.Cancel = true;
        GridView1.EditIndex = -1;
        //GridView1.DataSource = GetSuppliers();
        //no input argument
        //return type is list of suppliers (select * from suppliers)
        GridView1.DataBind();
    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];


        TextBox txtSupplierName = (TextBox)row.FindControl("txtSupplierName");
        TextBox txtGSTRegistrationNo = (TextBox)row.FindControl("txtGSTRegistrationNo");
        TextBox txtContactName = (TextBox)row.FindControl("txtContactName");
        TextBox txtPhone = (TextBox)row.FindControl("txtPhone");
        TextBox txtFax = (TextBox)row.FindControl("txtFax");
        TextBox txtAddress = (TextBox)row.FindControl("txtAddress");

        string SupplierName = txtSupplierName.Text;
        string GSTRegistrationNo = txtGSTRegistrationNo.Text;
        string ContactName = txtContactName.Text;
        string Phone = txtPhone.Text;
        string Fax = txtFax.Text;
        string Address = txtAddress.Text;
        string SupplierCode = GridView1.DataKeys[e.RowIndex].Value.ToString();

        //UpdateSupplier(SupplierCode,SupplierName,GSTRegistrationNo,ContactName,Phone,Fax,Address);
        //method name: UpdateSupplier
        //input arguments: SupplierCode,SupplierName,GSTRegistrationNo,ContactName,Phone,Fax,Address
        //return type: void
    }

    protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = Convert.ToInt32(e.RowIndex);

        GridView1.DeleteRow(index);


        string SupplierCode = GridView1.DataKeys[e.RowIndex].Value.ToString();
        //deletesuppliers(SupplierCode);
        //input argument: SupplierCode;
        //return type: void;


        //GridView1.DataSource = GetSuppliers();
        //no input argument
        //return type is list of suppliers (select * from suppliers)
        GridView1.DataBind();

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("MaintainSupplierList2.aspx");
    }
}