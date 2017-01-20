using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MaintainPurchaseList1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DropDownList1.DataSource = Work.GetSupplier();
            DropDownList1.DataTextField = "SupplierName";
            DropDownList1.DataValueField = "SupplierID";
            DropDownList1.DataBind();
            string supplierID = Request.QueryString["field1"];
            if (supplierID !=null)
            {
                DropDownList1.SelectedValue = supplierID;
            }


            string chosenSupplier = DropDownList1.SelectedValue;
            Team5ADProjectEntities model = new Team5ADProjectEntities();
            var q = from x in model.SupplyDetails.Where(s => s.SupplierID == chosenSupplier)
                    select new
                    {
                        x.ItemID,
                        x.Item.Description,
                        x.Price,
                        x.Item.UOM,
                        x.Priority,
                    };
            q.ToList();

            GridView1.DataSource = q.ToList();
            GridView1.DataBind();

        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        string chosenSupplier = DropDownList1.SelectedValue;
        Team5ADProjectEntities model = new Team5ADProjectEntities();
        var q = from x in model.SupplyDetails.Where(s => s.SupplierID == chosenSupplier)
                select new
                {
                    x.ItemID,
                    x.Item.Description,
                    x.Price,
                    x.Item.UOM,
                    x.Priority,
                };
        q.ToList();

        GridView1.DataSource = q.ToList();
        GridView1.DataBind();

    }

    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        e.Cancel = true;
        GridView1.EditIndex = -1;

        string chosenSupplier = DropDownList1.SelectedValue;
        Team5ADProjectEntities model = new Team5ADProjectEntities();
        var q = from x in model.SupplyDetails.Where(s => s.SupplierID == chosenSupplier)
                select new
                {
                    x.ItemID,
                    x.Item.Description,
                    x.Price,
                    x.Item.UOM,
                    x.Priority,
                };
        q.ToList();

        GridView1.DataSource = q.ToList();
        GridView1.DataBind();



    }

    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];


        TextBox txtPrice = (TextBox)row.FindControl("txtPrice");
        TextBox txtPriority = (TextBox)row.FindControl("txtPriority");

        Decimal Price = Convert.ToDecimal(txtPrice.Text);
        int Priority = Convert.ToInt32(txtPriority.Text);
        string itemid = row.Cells[0].Text;
        //string SupplierCode = GridView1.DataKeys[e.RowIndex].Value.ToString();
        string SupplierID = DropDownList1.SelectedValue;


        //update supply details


        GridView1.EditIndex = -1;
        Work.UpdateSupplierDetail(SupplierID, itemid, Price, Priority);
        string chosenSupplier = DropDownList1.SelectedValue;
        Team5ADProjectEntities model = new Team5ADProjectEntities();
        var q = from x in model.SupplyDetails.Where(s => s.SupplierID == chosenSupplier)
                select new
                {
                    x.ItemID,
                    x.Item.Description,
                    x.Price,
                    x.Item.UOM,
                    x.Priority,
                };
        q.ToList();

        GridView1.DataSource = q.ToList();
        GridView1.DataBind();


    }

    protected void GridView1_OnRowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = Convert.ToInt32(e.RowIndex);
        GridViewRow row = GridView1.Rows[e.RowIndex];
        string description = row.Cells[1].Text;
        string ItemID = row.Cells[0].Text;
        string SupplierCode = DropDownList1.SelectedValue;
        Work.DeleteSupplierDetail(SupplierCode, ItemID);

        Team5ADProjectEntities model = new Team5ADProjectEntities();
        var q = from x in model.SupplyDetails.Where(s => s.SupplierID == SupplierCode)
                select new
                {
                    x.ItemID,
                    x.Item.Description,
                    x.Price,
                    x.Item.UOM,
                    x.Priority,
                };
        q.ToList();

        GridView1.DataSource = q.ToList();
        GridView1.DataBind();


    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        
        string chosenSupplierID = DropDownList1.SelectedValue;
        Response.Redirect("MaintainPurchaseList2.aspx?field1=" + chosenSupplierID);
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string chosenSupplier = DropDownList1.SelectedValue;
        Team5ADProjectEntities model = new Team5ADProjectEntities();
        var q = from x in model.SupplyDetails.Where(s => s.SupplierID == DropDownList1.SelectedValue)
                select new
                {
                    x.ItemID,
                    x.Item.Description,
                    x.Price,
                    x.Item.UOM,
                    x.Priority,
                };
        q.ToList();

        GridView1.DataSource = q.ToList();
        GridView1.DataBind();

    }
}