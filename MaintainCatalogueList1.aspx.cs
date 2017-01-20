using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MaintainCatalogueList1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataSource = Item1.GetItem();

            GridView1.DataBind();
        }
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        GridView1.DataSource = Item1.GetItem();

        GridView1.DataBind();


    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        e.Cancel = true;
        GridView1.EditIndex = -1;
        GridView1.DataSource = Item1.GetItem();

        GridView1.DataBind();


    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];


        TextBox txtDescription = (TextBox)row.FindControl("txtDescription");
        TextBox txtCategory = (TextBox)row.FindControl("txtCategory");
        TextBox txtReorderLevel = (TextBox)row.FindControl("txtReorderLevel");
        TextBox txtReorderQty = (TextBox)row.FindControl("txtReorderQty");
        TextBox txtUOM = (TextBox)row.FindControl("txtUOM");

        string Description = txtDescription.Text;
        string Category = txtCategory.Text;
        string ReorderLevel = txtReorderLevel.Text;
        string ReorderQty = txtReorderQty.Text;
        string UOM = txtUOM.Text;

        //string SupplierCode = GridView1.DataKeys[e.RowIndex].Value.ToString();
        string itemCode = row.Cells[0].Text;



        Item1.UpdateItem(itemCode, Description, Category, ReorderLevel, ReorderQty, UOM);
        GridView1.EditIndex = -1;
        GridView1.DataSource = Item1.GetItem();

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
        string ItemCode = row.Cells[0].Text;
        Item1.DeleteItem(ItemCode);

        GridView1.DataSource = Item1.GetItem();

        GridView1.DataBind();



        //GridView1.DataSource = GetSuppliers();
        //no input argument
        //return type is list of suppliers (select * from suppliers)


    }



    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("MaintainCatalogueList2.aspx");
    }
}