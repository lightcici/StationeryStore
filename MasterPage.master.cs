﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MenuItem m1 = new MenuItem("Request Stationery");
        m1.NavigateUrl = "Request/MakeRequest.aspx";
        MenuItem m2 = new MenuItem("Request History");
        m2.NavigateUrl = "Request/RequestHistory.aspx";
        MenuItem m3 = new MenuItem("Allocate Stationery");
        m3.NavigateUrl = "Request/AllocateStationery.aspx";
        MenuItem m4 = new MenuItem("View Submission");
        m4.NavigateUrl = "Request/ViewSubmission.aspx";
        MenuItem m5 = new MenuItem("Collect Stationery");
        m5.NavigateUrl = "";
        MenuItem m6 = new MenuItem("Update Collection Point");
        m6.NavigateUrl = "UpdateCP.aspx";
        MenuItem m7 = new MenuItem("Assign Department Representative");
        m7.NavigateUrl = "ChangeRep.asox";
        MenuItem m8 = new MenuItem("Delegation");
        m8.NavigateUrl = "AssignRole.aspx";
        MenuItem m9 = new MenuItem("Outstanding Request");
        m9.NavigateUrl = "Request/OutstandingRequest.aspx";
        MenuItem m10 = new MenuItem("View Request History");
        m10.NavigateUrl = "";
        MenuItem m11 = new MenuItem("Order");
        m11.NavigateUrl = "Order/OrderList.aspx";
        MenuItem m12 = new MenuItem("Report Discrepancy");
        m12.NavigateUrl = "Discrepancy/ViewDiscrepancy.aspx";
        MenuItem m13 = new MenuItem("Maintain Supplier List");
        m13.NavigateUrl = "Maintain/MaintainSupplierList1.aspx";
        MenuItem m14 = new MenuItem("Maintain Purchase List");
        m14.NavigateUrl = "Maintain/MaintainPurchaseList1.aspx";
        MenuItem m15 = new MenuItem("Maintain Catalogue List");
        m15.NavigateUrl = "Maintain/MaintainCatalogueList1.aspx";
        MenuItem m16 = new MenuItem("Maintain Department List");
        m16.NavigateUrl = "Maintain/MaintainDepartmentList1.aspx";
        MenuItem m17 = new MenuItem("Approve Discrepancy");
        m17.NavigateUrl = "Discrepancy/ApproveDiscrepancy.aspx";
        MenuItem m18 = new MenuItem("Approve Order");
        m18.NavigateUrl = "Order/ApproveOrder.aspx";
        MenuItem m19 = new MenuItem("Generate Report");
        m19.NavigateUrl = "";
        MenuItem m20 = new MenuItem("Notification");
        m20.NavigateUrl = "Notification.aspx";
        MenuItem m21 = new MenuItem("Low In Stock");
        m21.NavigateUrl = "LowInStock.aspx";


        string userId = (string)Session["user"];
        string role = Work.getUser(userId).Role;

        if (role == "Employee")
        {
            if (Work.delegated(userId))
            {
                Menu menu = new Menu();
                menu.Items.Add(m4);
                menu.Items.Add(m6);
                menu.Items.Add(m20);
                Panel1.Controls.Add(menu);
                Panel1.DataBind();
            }
            else
            {
                Menu menu = new Menu();
                menu.Items.Add(m1);
                menu.Items.Add(m2);
                menu.Items.Add(m20);
                Panel1.Controls.Add(menu);
                Panel1.DataBind();
            }

        }
        else if (role == "DeptRep")
        {
            if (Work.delegated(userId))
            {
                Menu menu = new Menu();
                menu.Items.Add(m3);
                menu.Items.Add(m4);
                menu.Items.Add(m5);
                menu.Items.Add(m6);
                menu.Items.Add(m20);
                Panel1.Controls.Add(menu);
                Panel1.DataBind();
            }
            else
            {
                Menu menu = new Menu();
                menu.Items.Add(m1);
                menu.Items.Add(m2);
                menu.Items.Add(m3);
                menu.Items.Add(m5);
                menu.Items.Add(m6);
                menu.Items.Add(m20);
                Panel1.Controls.Add(menu);
                Panel1.DataBind();
            }
        }
        else if (role == "DeptHead")
        {
            if (Work.delegateTo(userId))
            {
                Menu menu = new Menu();
                menu.Items.Add(m7);
                menu.Items.Add(m6);
                menu.Items.Add(m8);
                menu.Items.Add(m20);
                Panel1.Controls.Add(menu);
                Panel1.DataBind();
            }
            else
            {
                Menu menu = new Menu();
                menu.Items.Add(m4);
                menu.Items.Add(m7);
                menu.Items.Add(m6);
                menu.Items.Add(m8);
                menu.Items.Add(m20);
                Panel1.Controls.Add(menu);
                Panel1.DataBind();
            }
        }
        else if (role == "Clerk")
        {
            if (Work.delegated(userId))
            {
                Menu menu = new Menu();
                menu.Items.Add(m9);
                menu.Items.Add(m10);
                menu.Items.Add(m12);
                menu.Items.Add(m21);
                menu.Items.Add(m17);
                menu.Items.Add(m18);
                menu.Items.Add(m13);
                menu.Items.Add(m14);
                menu.Items.Add(m15);
                menu.Items.Add(m16);
                menu.Items.Add(m19);
                menu.Items.Add(m20);
                Panel1.Controls.Add(menu);
                Panel1.DataBind();
            }
            else
            {
                Menu menu = new Menu();
                menu.Items.Add(m9);
                menu.Items.Add(m10);
                menu.Items.Add(m11);
                menu.Items.Add(m12);
                menu.Items.Add(m21);
                menu.Items.Add(m13);
                menu.Items.Add(m14);
                menu.Items.Add(m15);
                menu.Items.Add(m16);
                menu.Items.Add(m20);
                Panel1.Controls.Add(menu);
                Panel1.DataBind();
            }
        }
        else if (role == "Supervisor" || role == "Manager")
        {

            Menu menu = new Menu();
            menu.Items.Add(m17);
            menu.Items.Add(m18);
            menu.Items.Add(m19);
            menu.Items.Add(m20);
            Panel1.Controls.Add(menu);
            Panel1.DataBind();

        }
    }
}
