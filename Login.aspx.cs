using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string userId = TextBox1.Text;
        string pwd = TextBox2.Text;
        bool isMatch = Work.Authenticate(userId, pwd);
        if (isMatch)
        {
            Session["user"] = userId;

            FormsAuthentication.SetAuthCookie(userId, false);
            string role = Work.getUser(userId).Role;
            if (role == "Employee")
            {
                Response.Redirect("Request/MakeRequest.aspx");
            }else if (role == "DeptRep")
            {
                Response.Redirect("Request/MakeRequest.aspx");
            }
            else if (role == "DeptHead")
            {
                Response.Redirect("Request/ViewSubmission.aspx");
            }else if (role == "Clerk")
            {
                Response.Redirect("LowInStock.aspx");
            }
            else if (role == "Manager" || role== "Supervisor")
            {
                Response.Redirect("Order/OrderList.aspx");
            }


        }
        else
        {
            Label3.Text = "Wrong UserName or Password. Please try again.";
        }
    }
}