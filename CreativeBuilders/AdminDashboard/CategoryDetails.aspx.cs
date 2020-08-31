using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.AdminDashboard
{
    public partial class CategoryDetails : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    DataTable dt = BL.getSingleCategory(id);
                    CategoryName.InnerText = dt.Rows[0]["Name"].ToString();
                    CategoryDesc.InnerText = dt.Rows[0]["Description"].ToString();
                }
            }

        }

        protected void btnEdit_ServerClick(object sender, EventArgs e)
        {
            Response.Redirect($"AddCategory.aspx?id={Convert.ToInt32(Request.QueryString["id"])}");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            HttpCookie DeleteMsgCookie = new HttpCookie("status");
            DeleteMsgCookie.Value = "delete";
            DeleteMsgCookie.Expires = DateTime.Now.AddSeconds(6);
            Response.Cookies.Add(DeleteMsgCookie);
            BL.DeleteCategory(Convert.ToInt32(Request.QueryString["id"]));
            Response.Redirect("Categories.aspx");
        }
    }
}