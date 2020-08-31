using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.FrontEnd
{
    public partial class FrontEnd : System.Web.UI.MasterPage
    {
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LoginStatus"] != null && Session["LoginStatus"].ToString() == "LoggedIn")
            {
                Login_Profile.InnerText = "Profile";
                Login_Profile.HRef = "UpdateAcountData.aspx";
                Register_Logout.InnerText = "Logout";
                Register_Logout.HRef = "Login.aspx?logout=true";
                cartLink.HRef = "shopping-cart.aspx";
                DataTable dt = BL.getCustomerCartId(Convert.ToInt32(Session["UserId"].ToString()));
                Session["CartId"] = dt.Rows[0]["CartId"].ToString();
                CardItemCount.InnerText = BL.getCartItemsCount(Convert.ToInt32(Session["CartId"].ToString())).Rows.Count.ToString();
            }
            else
            {
                Login_Profile.InnerText = "Login";
                Login_Profile.HRef = "Login.aspx";
                Register_Logout.InnerText = "Register";
                Register_Logout.HRef = "Register.aspx";
                cartLink.HRef = "#";
            }
        }
    }
}