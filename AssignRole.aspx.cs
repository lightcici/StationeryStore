using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class AssignRole : System.Web.UI.Page
{
    GetInfo getInfo = new GetInfo();
    Team5ADProjectEntities ctx = new Team5ADProjectEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            TextBox1.Text = getInfo.someInfo("stf").Name;
            TextBox2.Text = getInfo.getDlgtInfo().StartDate.ToString();
            TextBox3.Text = getInfo.getDlgtInfo().EndDate.ToString();
            DropDownList1.Text = TextBox1.Text;
            DropDownList1.DataSource = getInfo.getDptSfInfo().Select(x => x.Name).ToList();
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, new ListItem(""));
            if (TextBox1.Text == "")
            {
                Button2.Visible = false;
            }

        }




    }



    protected void Button1_Click(object sender, EventArgs e)
    {



        Staff sch = getInfo.getDptSfInfo().Where(x => x.Name == DropDownList1.Text.ToString()).First();//选择的临时head的一行信息     
        DateTime start = Convert.ToDateTime(TextBox2.Text);
        DateTime end = Convert.ToDateTime(TextBox3.Text);
        string c = getInfo.getDlgtInfo().DelegationID.ToString(); // get already have delegationID
        Delegation d = ctx.Delegation.Where(x => x.DelegationID == c).First();

        //delegationID加一
        string a = ctx.Delegation.Max(x => x.DelegationID).ToString();
        string b = 'D' + (String.Format("{0:D5}", Convert.ToInt32(a.Substring(1, 5)) + 1));
        if (DateTime.Compare(start, DateTime.Now) > 0)
        {
            if (DateTime.Compare(start, end) < 0)
            {

                Delegation dlgt = new Delegation();
                dlgt.DelegationID = b;
                dlgt.CoveringHeadID = sch.UserID;
                dlgt.StartDate = start;
                dlgt.EndDate = end;
                dlgt.DepartmentHeadID = getInfo.getLoginUserInfo().UserID;
                ctx.Delegation.Add(dlgt);
                ctx.SaveChanges();
                TextBox1.Text = sch.Name;
                Label1.Text = "Select Successful!";
                //}
            }
            else
            {
                Label1.Text = "End Date Before Start Date!";
            }

        }
        else
        {
            Label1.Text = "Select Failed!";
        }




        Button2.Visible = true;

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        string a = getInfo.getDlgtInfo().DelegationID.ToString();
        Delegation d = ctx.Delegation.Where(x => x.DelegationID == a).First();
        DateTime start = Convert.ToDateTime(TextBox2.Text);
        DateTime end = Convert.ToDateTime(TextBox3.Text);
        if(DateTime.Compare(start,end)<0)
        {
            if(DateTime.Compare(start,DateTime.Now)<0)
            {
                if (DateTime.Compare(d.EndDate, DateTime.Now) > 0)
                {
                    d.EndDate = DateTime.Now;
                    ctx.SaveChanges();
                    Label1.Text = "Revoke Successful!";
                }
                else
                {
                    Label1.Text = "Overtime!Can not Revoke!";
                }
            }
            else
            {
                ctx.Delegation.Remove(d);
                ctx.SaveChanges();
                Label1.Text = "Cancel Successful.";
            }
        }
        else
        {
            Label1.Text = "Wrong End.";
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