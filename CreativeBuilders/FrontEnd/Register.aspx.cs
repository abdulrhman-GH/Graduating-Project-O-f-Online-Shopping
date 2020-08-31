using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.FrontEnd
{
    public partial class Register : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnRegister_Click(object sender, EventArgs e)
        {
            BL.CustomerRegister(txtFName.Value, txtLName.Value, txtEmail.Value, txtPassword.Value,
                Convert.ToDateTime(txtDOB.Value), txtPhone.Value, txtCity.Value, txtStreet.Value, txtDistrict.Value);
            DataTable dt = BL.getLatestCustomerId();
            BL.CreateNewCart(Convert.ToInt32(dt.Rows[0]["Id"].ToString()));
            Session["LoginStatus"] = "LoggedIn";
            Session["UserId"] = dt.Rows[0]["Id"].ToString();
            Session["UserName"] = dt.Rows[0]["FirstName"].ToString()+" " + dt.Rows[0]["LastName"].ToString();
            Response.Redirect("Index.aspx");
        }
    }
}