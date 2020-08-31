using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.AdminDashboard
{
    public partial class Login : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginStatus"] != null && Session["LoginStatus"].ToString() == "LoggedIn")
            {
                if (Request.QueryString["logout"] != null && Request.QueryString["logout"].ToString() == "true")
                {
                    Session.RemoveAll();
                }
                else
                    Response.Redirect("Dashboard.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataTable dt = BL.AdminLogin(txtEmail.Value.ToString(), txtPassword.Value);
            if (dt.Rows.Count > 0)
            {
                Session["LoginStatus"] = "LoggedIn";
                Session["UserId"] = dt.Rows[0]["Id"].ToString();
                Session["UserAvatar"] = dt.Rows[0]["Avatar"].ToString();
                Session["UserName"] = dt.Rows[0]["Name"].ToString();
                Response.Redirect("Dashboard.aspx");
            }
            else
                lblErrorMsg.Text = "Login Failed , Email or Password is incorrect !";

        }
    }
}