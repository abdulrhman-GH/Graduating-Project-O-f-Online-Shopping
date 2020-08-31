using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.AdminDashboard
{
    public partial class AddCategory : System.Web.UI.Page
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
                    DataTable dt = BL.getSingleCategory(id);
                    txtCategoryName.Text = dt.Rows[0]["Name"].ToString();
                    txtCategoryDesc.InnerText = dt.Rows[0]["Description"].ToString();
                    state = "Update";
                    lbltitle.InnerText = "Edit Existing Category";
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
                BL.AddNewCategory(txtCategoryName.Text, txtCategoryDesc.InnerText);
                Response.Redirect("Categories.aspx");
            }
            else
            {
                HttpCookie UpdateMsgCookie = new HttpCookie("status");
                UpdateMsgCookie.Value = "update";
                UpdateMsgCookie.Expires = DateTime.Now.AddSeconds(6);
                Response.Cookies.Add(UpdateMsgCookie);
                BL.UpdateCategory(Convert.ToInt32(Request.QueryString["id"]), txtCategoryName.Text, txtCategoryDesc.InnerText);
                state = "add";
                Response.Redirect("Categories.aspx");
            }
        }
    }
}