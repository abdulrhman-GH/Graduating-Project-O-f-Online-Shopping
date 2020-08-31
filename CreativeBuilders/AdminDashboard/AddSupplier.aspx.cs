using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.AdminDashboard
{
    public partial class AddSupplier : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();
        static string state = "add";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    DataTable dt = BL.getSingleSupplier(id);
                    txtFoundationName.Text = dt.Rows[0]["Foundation_Name"].ToString();
                    txtEmail.Text = dt.Rows[0]["Email"].ToString();
                    txtCommId.Text = dt.Rows[0]["Commercial_Id"].ToString();
                    txtLocation.Text = dt.Rows[0]["Location"].ToString();
                    state = "Update";
                    lbltitle.InnerText = "Edit Existing Supplier";
                    btnSave.Text = "Update";
                }

            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (state == "add")
            {
                HttpCookie AddMsgCookie = new HttpCookie("status");
                AddMsgCookie.Value = "add";
                AddMsgCookie.Expires = DateTime.Now.AddSeconds(6);
                Response.Cookies.Add(AddMsgCookie);
                BL.AddNewSupplier(txtFoundationName.Text,txtEmail.Text,txtCommId.Text,txtLocation.Text);
                Response.Redirect("Suppliers.aspx");
            }
            else
            {
                HttpCookie UpdateMsgCookie = new HttpCookie("status");
                UpdateMsgCookie.Value = "update";
                UpdateMsgCookie.Expires = DateTime.Now.AddSeconds(6);
                Response.Cookies.Add(UpdateMsgCookie);
                BL.UpdateSupplier(Convert.ToInt32(Request.QueryString["id"]), txtFoundationName.Text, txtEmail.Text, txtCommId.Text, txtLocation.Text);
                state = "add";
                Response.Redirect("Suppliers.aspx");
            }
        }
    }
}