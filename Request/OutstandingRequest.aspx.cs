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

            List<DisbursementModel> bySummary = Work.viewRequestSummary();
            List<DisbursementModel> byDepartment = Work.viewRequestByDept();
            int res = Work.GetRetrieveLog(bySummary, byDepartment);
            if (res == 0)
            {
                // Auto-Allocate
                AutoAllocate automator = new AutoAllocate();
                Dictionary<string, int> res1 = automator.AllocateAllItem();
                Dictionary<string, Dictionary<string, int>> res2 = automator.AllocateAllDepartment(res1);
                bySummary = Work.viewRequestSummary();
                byDepartment = Work.viewRequestByDept();
                foreach (DisbursementModel model in bySummary)
                    model.RetrivedNumber = res1[model.ItemID];
                foreach (DisbursementModel model in byDepartment)
                    model.RetrivedNumber = res2[model.DepartmentID][model.ItemID];
            }
            this.ViewState["listBySummary"] = bySummary;
            this.ViewState["listByDept"] = byDepartment;

            GridViewSummary.DataSource = bySummary;
            GridViewSummary.DataBind();
        }

    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(RadioButtonList1.SelectedValue == "ViewSummary")
        {
            PanelSummary.Visible = true;
            PanelDept.Visible = false;
            List<DisbursementModel> list = (List<DisbursementModel>) ViewState["listBySummary"];
            GridViewSummary.DataSource = list;
            GridViewSummary.DataBind();
            
        }
    

        else if (RadioButtonList1.SelectedValue == "ViewByDepartment")
        {
            PanelSummary.Visible = false;
            PanelDept.Visible = true;
            List<DisbursementModel> list = (List<DisbursementModel>) ViewState["listByDept"];
            GridViewDept.DataSource = list;
            GridViewDept.DataBind();
            
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

    // submit in "By Summary" page
    protected void ButtonSummary_Click(object sender, EventArgs e)
    {
        // Update RetrievedNum by Find Control
        List<DisbursementModel> listBySummary = (List<DisbursementModel>)ViewState["listBySummary"];
        for (int i=0; i<listBySummary.Count(); i++)
        {
            TextBox retrieveText = GridViewSummary.Rows[i].FindControl("retrieved") as TextBox;
            if (retrieveText != null)
            {
                int retrieveQty = 0;
                if (retrieveText.Text != null)
                {
                    bool isInt = int.TryParse(retrieveText.Text, out retrieveQty);
                }
                listBySummary[i].RetrivedNumber = retrieveQty;
            }
        }

        // TODO Validation of changing number

        // Update By Department by Auto Allocate
        AutoAllocate automator = new AutoAllocate();
        Dictionary<string, int> dic1 = new Dictionary<string, int>();
        foreach (DisbursementModel dm in listBySummary)
            dic1.Add(dm.ItemID, dm.RetrivedNumber);
        Dictionary<string, Dictionary<string, int>> dic2 = automator.AllocateAllDepartment(dic1);
        List<DisbursementModel> listByDepartment = (List<DisbursementModel>)ViewState["listByDept"];
        foreach (DisbursementModel model in listByDepartment)
            model.RetrivedNumber = dic2[model.DepartmentID][model.ItemID];

        // Update data in ViewState
        ViewState["listBySummary"] = listBySummary;
        ViewState["listByDept"] = listByDepartment;

        // Submit to write RetrieveLogs
        submitRetrieve();
    }

    // submit in "By Department" page
    protected void ButtonDept0_Click(object sender, EventArgs e)
    {
        // Update RetrievedNum by Find Control
        List<DisbursementModel> listByDepartment = (List<DisbursementModel>)ViewState["listByDept"];
        Dictionary<string, int> dic = new Dictionary<string, int>();
        for (int i = 0; i < listByDepartment.Count(); i++)
        {
            TextBox retrieveText = GridViewDept.Rows[i].FindControl("retrieved") as TextBox;
            if (retrieveText != null)
            {
                int retrieveQty = 0;
                if (retrieveText.Text != null)
                {
                    bool isInt = int.TryParse(retrieveText.Text, out retrieveQty);
                }
                listByDepartment[i].RetrivedNumber = retrieveQty;
                if (dic.ContainsKey(listByDepartment[i].ItemID))
                    dic[listByDepartment[i].ItemID] += retrieveQty;
                else
                    dic.Add(listByDepartment[i].ItemID, retrieveQty);
            }
        }
        // TODO Validation of changing number

        // Update listBySummary
        List<DisbursementModel> listBySummary = (List<DisbursementModel>)ViewState["listBySummary"];
        foreach (DisbursementModel dm in listBySummary)
            dm.RetrivedNumber = dic[dm.ItemID];
        // Update data in ViewState
        ViewState["listBySummary"] = listBySummary;
        ViewState["listByDept"] = listByDepartment;

        // Submit to write RetrieveLogs
        submitRetrieve();
    }

    private int submitRetrieve()
    {
        Transaction clerk = new Transaction();
        List<DisbursementModel> listByDepartment = (List<DisbursementModel>)ViewState["listByDept"];
        foreach (DisbursementModel dm in listByDepartment)
        {
            int res = clerk.Retrieve(dm.ItemID, dm.DepartmentID, dm.RetrivedNumber);
            if (res < 0) return res;
        }
        return 0;
    }
}