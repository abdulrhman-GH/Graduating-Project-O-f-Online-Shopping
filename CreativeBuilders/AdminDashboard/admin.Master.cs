using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.AdminDashboard
{
    public partial class admin : System.Web.UI.MasterPage
    {
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginStatus"] != null && Session["LoginStatus"].ToString() == "LoggedIn")
            {
                DataTable dt = BL.getSingleUser(Convert.ToInt32(Session["UserId"]));
                UserAvatar.Src = $"dist/images/users/{dt.Rows[0]["Avatar"].ToString()}";
                UserAvatar.Alt = dt.Rows[0]["Name"].ToString();
                UserName.InnerText = dt.Rows[0]["Name"].ToString();
            }
            else
                Response.Redirect("Login.aspx");
        }
    }
}