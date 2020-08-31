using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CreativeBuilders.FrontEnd
{
    public partial class ResetCustomerPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] != null)
                {

                }
                else
                    Response.Redirect("Index.aspx");
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            BusinessLayer BL = new BusinessLayer();
            DataTable dt = BL.getcustomeraccountdata(Convert.ToInt32(Session["UserId"]));
            if (txtOldPassword.Value == dt.Rows[0]["Password"].ToString())
            {
                BL.UpdateCustomerPassword(Convert.ToInt32(Session["UserId"]), txtNewPassword.Value);
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