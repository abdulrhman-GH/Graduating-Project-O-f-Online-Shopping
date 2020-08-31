using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.AdminDashboard
{
    public partial class ResetPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            BusinessLayer BL = new BusinessLayer();
            DataTable dt = BL.getSingleUser(Convert.ToInt32(Session["UserId"]));
            if (txtOldPassword.Value == dt.Rows[0]["Password"].ToString())
            {
                BL.UpdateUserPassword(Convert.ToInt32(Session["UserId"]), txtNewPassword.Text);
                HttpCookie AddMsgCookie = new HttpCookie("status");
                AddMsgCookie.Value = "update";
                AddMsgCookie.Expires = DateTime.Now.AddSeconds(6);
                Response.Cookies.Add(AddMsgCookie);
                Response.Redirect("Login.aspx?logout=true");
            }
            else
                lblErrorMsg.Text = "Wrong Password";
        }
    }
}