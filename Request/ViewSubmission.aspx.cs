using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RequestHistory : System.Web.UI.Page
{
    static String ALL = "All";
    string userId;
   
    protected void Page_Load(object sender, EventArgs e)
    {


        string userId = (string)Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }


        if (!IsPostBack)
        {
            List<RqHistory> hList = Work.getRqHistory(userId);
            Session["history"] = hList;
            GridView1.DataSource = hList;
            GridView1.DataBind();
        }
    }




    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string status = DropDownList1.SelectedValue;
        List <RqHistory> hList = (List<RqHistory>)Session["history"];
        List<RqHistory> list = new List<RqHistory>();
        if (status == ALL)
        {
            list = hList;
        }
        else
        {
            foreach (RqHistory rh in hList)
            {
                if (rh.status == status)
                { list.Add(rh); }
            }
        }
        GridView1.DataSource = list;
        GridView1.DataBind();

    }
}