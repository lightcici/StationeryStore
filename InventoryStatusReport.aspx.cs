using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Data.Common;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.ReportSource;
using CrystalDecisions.Reporting;

public partial class InventoryStatusReport : System.Web.UI.Page
{

    SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["invtystatus"].ConnectionString);
    ReportDocument rdoc = new ReportDocument();


    protected void Page_Init(object sender, EventArgs e)
    {


        cn.Open();
        SqlCommand cmd = new SqlCommand("invtystatus", cn);
        cmd.CommandType = CommandType.StoredProcedure;
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable ds = new DataTable();
        da.Fill(ds);
        rdoc.Load(Server.MapPath("invtystatus.rpt"));
        rdoc.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = rdoc;
        CrystalReportViewer1.DataBind();
        cn.Close();


    }

    protected void Page_Load(object sender, EventArgs e)
    {

    }
}