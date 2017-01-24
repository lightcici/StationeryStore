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
        de = Work.getDlgtInfo(userId);
        if (!IsPostBack)
        {
            DropDownList1.DataSource = Work.getDptSfInfo(userId).Select(x => x.Name).ToList(); ;
            DropDownList1.DataBind();
            if (de != null){
                TextBox1.Text = Work.getUser(de.CoveringHeadID).Name;
                TextBox2.Text = de.StartDate.ToString();
                TextBox3.Text = de.EndDate.ToString();
                DropDownList1.Text = TextBox1.Text;
            }
            else
            {
                Button2.Visible = false;
            }
                     

        }

    }



    protected void Button1_Click(object sender, EventArgs e)
    {



        Staff sch = Work.getDptSfInfo(userId).Where(x => x.Name == DropDownList1.Text.ToString()).First();//选择的临时head的一行信息     
        DateTime start = Convert.ToDateTime(TextBox2.Text);
        DateTime end = Convert.ToDateTime(TextBox3.Text);
        //string c = Work.getDlgtInfo(userId).DelegationID.ToString(); // get already have delegationID
        //Delegation d = ctx.Delegation.Where(x => x.DelegationID == c).First();

        ////delegationID加一
        //string a = ctx.Delegation.Max(x => x.DelegationID).ToString();
        //string b = 'D' + (String.Format("{0:D5}", Convert.ToInt32(a.Substring(1, 5)) + 1));
        if (DateTime.Compare(start, DateTime.Now) >= 0)
        {
            if (DateTime.Compare(start, end) < 0)
            {

                Delegation dlgt = new Delegation();
                dlgt.CoveringHeadID = sch.UserID;
                dlgt.StartDate = start;
                dlgt.EndDate = end;
                dlgt.DepartmentHeadID = userId;
                Work.addDelegation(dlgt);
                TextBox1.Text = sch.Name;
                Label1.Text = "Delegation is updated Successful!";
                Button2.Visible = true;

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

        DateTime start = Convert.ToDateTime(TextBox2.Text);
        DateTime end = Convert.ToDateTime(TextBox3.Text);
        
        
        if(DateTime.Compare(start,DateTime.Now)>=0)
        {
            Work.deleteDelegation(de);
            Label1.Text = "Revoke Successful!";

        }
        else
        {
            Work.revokeDelegation(de);
            Label1.Text = "Revoke Successful.";
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