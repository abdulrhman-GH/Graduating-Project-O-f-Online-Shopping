using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace CreativeBuilders.FrontEnd
{
    public partial class UpdateAcountData : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserId"] != null)
                {
                    int Id = Convert.ToInt32(Session["UserId"].ToString());
                    DataTable dt = BL.getcustomeraccountdata(Id);
                    txtFName.Value = dt.Rows[0]["FirstName"].ToString();
                    txtLName.Value = dt.Rows[0]["LastName"].ToString();
                    txtEmail.Value = dt.Rows[0]["Email"].ToString();
                    string DOB = dt.Rows[0]["DOB"].ToString();
                    //diplay date like that 05-20-2019 
                    txtDOB.Value = DateTime.Parse(DOB).ToString("MM/dd/yyyy");
                    txtPhone.Value = dt.Rows[0]["Phone"].ToString();
                    txtCity.Value = dt.Rows[0]["City"].ToString();
                    txtStreet.Value = dt.Rows[0]["StreetName"].ToString();
                    txtDistrict.Value = dt.Rows[0]["DistictName"].ToString();
                }
                else
                    Response.Redirect("Index.aspx");

            }

        }
        protected void btnUpdateAccount_Click(object sender, EventArgs e)
        {
            HttpCookie AddMsgCookie = new HttpCookie("status");
            AddMsgCookie.Value = "update";
            AddMsgCookie.Expires = DateTime.Now.AddSeconds(6);
            Response.Cookies.Add(AddMsgCookie);
            BL.UpdateCustomerAccountdata(Convert.ToInt32(Session["UserId"].ToString()), txtFName.Value, txtLName.Value, txtEmail.Value,
                Convert.ToDateTime(txtDOB.Value), txtPhone.Value, txtCity.Value, txtStreet.Value, txtDistrict.Value);
            Response.Redirect("Index.aspx");

        }
    }
}