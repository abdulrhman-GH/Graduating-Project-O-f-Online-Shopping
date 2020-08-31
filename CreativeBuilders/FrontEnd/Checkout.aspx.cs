using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.FrontEnd
{
    public partial class Checkout : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (Session["CartId"] != null)
                {
                    DataTable dtCardItems = BL.getCartItems(Convert.ToInt32(Session["CartId"].ToString()));
                    rptCardItems.DataSource = dtCardItems;
                    rptCardItems.DataBind();
                    DataTable dtExtra = BL.getOrdereExtraInfo(Convert.ToInt32(Session["CartId"].ToString()), Convert.ToInt32(Session["UserId"].ToString()));
                    subTotal.InnerText = dtExtra.Rows[0]["SubTotal"].ToString();
                    Taxes.InnerText = dtExtra.Rows[0]["Taxes"].ToString();
                    Total.InnerText = dtExtra.Rows[0]["Total"].ToString();
                    int Id = Convert.ToInt32(Session["UserId"].ToString());
                    DataTable dt = BL.getcustomeraccountdata(Id);
                    txtFName.Value = dt.Rows[0]["FirstName"].ToString();
                    txtLName.Value = dt.Rows[0]["LastName"].ToString();
                    txtEmail.Value = dt.Rows[0]["Email"].ToString();
                    txtPhone.Value = dt.Rows[0]["Phone"].ToString();
                    txtCity.Value = dt.Rows[0]["City"].ToString();
                    txtStreet.Value = dt.Rows[0]["StreetName"].ToString();
                    txtDistrict.Value = dt.Rows[0]["DistictName"].ToString();
                }
                else
                    Response.Redirect("Index.aspx");
            }

        }

        protected void btnCash_Click(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx?Checkout=true");
        }
    }
}