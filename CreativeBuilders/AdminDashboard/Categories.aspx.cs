using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CreativeBuilders.AdminDashboard
{
    public partial class Categories : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //Build Categories Table using String Builder
                BuildCategoriesTable();
                if (Request.QueryString["id"]!=null)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    DeleteCategory(id);
                    BuildCategoriesTable();

                }
            }            
        }
        void BuildCategoriesTable()
        {
            DataTable dt = BL.getAllCategories();
            StringBuilder str = new StringBuilder();
            if (dt.Rows.Count <= 0)
            {
                str.Append("<tr class=\"intro-x\">");
                str.Append("<td><div class=\"flex justify-center items-center\">");
                str.Append($"<a href=\"#\" class=\"font-medium whitespace-no-wrap\">No Categories Added Yet !</a>");
                str.Append("</div></td></tr>");
            }
            else
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    str.Append("<tr class=\"intro-x\"><td> ");
                    str.Append($"<a href=\"#\" class=\"font-medium whitespace-no-wrap\">{dt.Rows[i]["Name"].ToString()}</a>");
                    str.Append("</td><td class=\"table-report__action w-56\">");
                    str.Append("<div class=\"flex justify-center items-center\">");
                    str.Append($"<a class=\"flex items-center mr-3\" href=\"AddCategory.aspx?id={Convert.ToInt32(dt.Rows[i]["Id"])}\"><i data-feather=\"check-square\" class=\"w-4 h-4 mr-1\"></i>Edit </a>");
                    str.Append($"<a class=\"flex items-center mr-3 text-green-900\" href=\"CategoryDetails.aspx?id={Convert.ToInt32(dt.Rows[i]["Id"])}\"><i data-feather=\"eye\" class=\"w-4 h-4 mr-1\"></i>Details </a>");
                    str.Append($"<a href=\"Categories.aspx?id={Convert.ToInt32(dt.Rows[i]["Id"])}\" class=\"flex items-center text-theme-6\" ><i data-feather=\"trash-2\" class=\"w-4 h-4 mr-1\"></i>Delete </a>");
                    str.Append("</div></td></tr>");
                }
            }
            CategoryTable.InnerHtml = str.ToString();
        }
         void DeleteCategory(int id)
        {

                ClientScript.RegisterClientScriptBlock(this.GetType(), "DeleteMsg", "setDeleteMsg()", true);
                BL.DeleteCategory(id);
              
        }
    }
}