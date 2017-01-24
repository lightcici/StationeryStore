using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AssignRole : System.Web.UI.Page
{

    string userId;
    Delegation de = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        userId = (string) Session["user"];
        if (userId == null)
        {
            Response.Redirect("~/login.aspx");
        }
        de = Work.getDlgtInfo(userId);
        if (!IsPostBack)
        {
            DropDownList1.DataSource = Work.getDptSfInfo(userId).Select(x => x.Name).ToList();
            
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem("Please Select"));

            if (de != null){
                TextBox4.Text = Work.getUser(de.CoveringHeadID).Name;
                TextBox5.Text = de.StartDate.ToString();
                TextBox6.Text = de.EndDate.ToString();
                DropDownList1.Text = TextBox4.Text;
            }
            else
            {
                Label2.Visible = false;
                TextBox4.Visible = false;
                Button2.Visible = false;
            }
                     

        }

    }



    protected void Button1_Click(object sender, EventArgs e)
    {



        Staff sch = Work.getDptSfInfo(userId).Where(x => x.Name == DropDownList1.Text.ToString()).First();//选择的临时head的一行信息     

        string[] format = { "dd/MM/yyyy" };
        DateTime start;
        if (DateTime.TryParseExact(TextBox5.Text,
                           format,
                           System.Globalization.CultureInfo.InvariantCulture,
                           System.Globalization.DateTimeStyles.None,
                           out start)) ;
        DateTime end;
        if (DateTime.TryParseExact(TextBox6.Text,
                     format,
                     System.Globalization.CultureInfo.InvariantCulture,
                     System.Globalization.DateTimeStyles.None,
                     out end)) ;
        if (DateTime.Compare(start, DateTime.Today) >= 0)
        {
            if (DateTime.Compare(start, end) <= 0)
            {

                Delegation dlgt = new Delegation();
                dlgt.CoveringHeadID = sch.UserID;
                dlgt.StartDate = start;
                dlgt.EndDate = end;
                dlgt.DepartmentHeadID = userId;
                Work.addDelegation(dlgt);
                TextBox4.Text = sch.Name;
                Label1.Text = "Delegation is updated Successful!";
                Button2.Visible = true;
                Response.Redirect("AssignRole.aspx");

            }
            else
            {
                Label1.Text = "End Date can bot be earlier than Start Date!";
            }

        }
        else
        {
            Label1.Text = "Start day can not be earlier than today.";
        } 

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string[] format = { "dd/MM/yyyy" };
        DateTime start;
        if (DateTime.TryParseExact(TextBox5.Text,
                           format,
                           System.Globalization.CultureInfo.InvariantCulture,
                           System.Globalization.DateTimeStyles.None,
                           out start));
        DateTime end;
        if (DateTime.TryParseExact(TextBox6.Text,
                     format,
                     System.Globalization.CultureInfo.InvariantCulture,
                     System.Globalization.DateTimeStyles.None,
                     out end));


        if (DateTime.Compare(start,DateTime.Now)>=0)
        {
            Work.revokeDelegation(de);
            Label1.Text = "Revoke Successful!";
            Response.Redirect("AssignRole.aspx");

        }
        else
        {
            Work.deleteDelegation(de);
            Label1.Text = "Revoke Successful.";
            Response.Redirect("AssignRole.aspx");
        }
        
       

    }


    //    protected void Button3_Click(object sender, EventArgs e)
    //    {
    //        Staff sch = getInfo.getDptSfInfo().Where(x => x.Name == DropDownList1.Text.ToString()).First();//选择的临时head的一行信息     
    //        DateTime start = Convert.ToDateTime(TextBox3.Text);
    //        DateTime end = Convert.ToDateTime(TextBox4.Text);
    //        string c = getInfo.getDlgtInfo().DelegationID.ToString(); // get already have delegationID
    //        Delegation d = ctx.Delegation.Where(x => x.DelegationID == c).First();

    //        if (DateTime.Compare(d.EndDate, DateTime.Now) > 0)
    //        {



    //            if (DropDownList1.Text == getInfo.someInfo("stf").Name)
    //            {
    //                d.EndDate = end;
    //                ctx.SaveChanges();
    //                Label1.Text = "Update Successful!";
    //            }
    //            else
    //            {
    //            }

    
}