using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Request_OutstandingRequest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PanelSummary.Visible = true;
            PanelDept.Visible = false;
            List<DisbursementModel> list = Work.viewRequestSummary();
            GridViewSummary.DataSource = list;
            GridViewSummary.DataBind();

        }

    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(RadioButtonList1.SelectedValue == "ViewSummary")
        {
            PanelSummary.Visible = true;
            PanelDept.Visible = false;
            List<DisbursementModel> list = Work.viewRequestSummary();
            GridViewSummary.DataSource = list;
            GridViewSummary.DataBind();
            
        }
    

        else if (RadioButtonList1.SelectedValue == "ViewByDepartment")
        {
            PanelSummary.Visible = false;
            PanelDept.Visible = true;
            List<DisbursementModel> list = Work.viewRequestByDept();
            GridViewDept.DataSource = list;
            GridViewDept.DataBind();
            this.ViewState["listByDept"] = list;
        }
    }



    protected void GridViewDept_Sorting(object sender, GridViewSortEventArgs e)
    {
        List<DisbursementModel> list = (List <DisbursementModel>)this.ViewState["listByDept"];

        if (this.ViewState["ItemSort"] == null)
        {
            this.ViewState["ItemSort"] = SortDirection.Ascending;
        }
        if (this.ViewState["DepartmentSort"] == null)
        {
            this.ViewState["DepartmentSort"] = SortDirection.Ascending;
        }

        switch (e.SortExpression)
        {
            case "Department":
                if ((SortDirection)this.ViewState["DepartmentSort"] == SortDirection.Ascending)
                {
                    list = list.OrderBy(x => x.DepartmentName).ToList();
                    GridViewDept.DataSource = list;
                    GridViewDept.DataBind();
                    this.ViewState["listByDept"] = list;
                    this.ViewState["DepartmentSort"] = SortDirection.Descending;
                }
                else
                {
                    list = list.OrderByDescending(x => x.DepartmentName).ToList();
                    GridViewDept.DataSource = list;
                    GridViewDept.DataBind();
                    this.ViewState["listByDept"] = list;
                    this.ViewState["DepartmentSort"] = SortDirection.Ascending;
                }
                break;
            case "Item":

                if ((SortDirection)this.ViewState["ItemSort"] == SortDirection.Ascending)
                {
                    list = list.OrderBy(x => x.ItemID).ToList();
                    GridViewDept.DataSource = list;
                    GridViewDept.DataBind();
                    this.ViewState["listByDept"] = list;
                    this.ViewState["ItemSort"] = SortDirection.Descending;

                }
                else
                {
                    list = list.OrderByDescending(x => x.ItemID).ToList();
                    GridViewDept.DataSource = list;
                    GridViewDept.DataBind();
                    this.ViewState["listByDept"] = list;
                    this.ViewState["ItemSort"] = SortDirection.Ascending;
                }
                break;
        }
    }

    protected void GridViewDept_SelectedIndexChanged(object sender, EventArgs e)
    {
        string deptId = GridViewDept.SelectedRow.Cells[0].Text;
        string itemId = GridViewDept.SelectedRow.Cells[2].Text;


        //DetailsView.DataSource = 
        //DetailsView.DataBind();
    }
}