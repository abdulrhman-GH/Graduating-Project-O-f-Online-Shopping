using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.AdminDashboard
{
    public partial class Products : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BuildProductsTable();
            }
        }
        void BuildProductsTable()
        {
            DataTable dt = BL.getAllProducts();
            StringBuilder str = new StringBuilder();
            if (dt.Rows.Count <= 0)
            {
                str.Append("<tr class=\"intro-x\">");
                str.Append("<td><div class=\"flex justify-center items-center\">");
                str.Append($"<p class=\"font-medium whitespace-no-wrap\">No Products Added Yet !</p>");
                str.Append("</div></td></tr>");
            }
            else
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    str.Append($"<tr class=\"intro-x\">");
                    str.Append($"<td class=\"font-medium whitespace-no-wrap w-40 \">{dt.Rows[i]["Name"].ToString()}</td> ");
                    str.Append($"<td class=\"font-medium whitespace-no-wrap w-40 text-center\">{dt.Rows[i]["Price"].ToString()}</td> ");
                    str.Append($"<td class=\"font-medium whitespace-no-wrap w-40 text-center\">{dt.Rows[i]["Quantity"].ToString()}</td> ");
                    str.Append("<td class=\"table-report__action w-56\">");
                    str.Append("<div class=\"flex justify-center items-center\">");
                    str.Append($"<a class=\"flex items-center mr-3\" href=\"AddProduct.aspx?id={Convert.ToInt32(dt.Rows[i]["Id"])}\"><i data-feather=\"check-square\" class=\"w-4 h-4 mr-1\"></i>Edit </a>");
                    str.Append($"<a class=\"flex items-center mr-3 text-green-900\" href=\"ProductDetails.aspx?id={Convert.ToInt32(dt.Rows[i]["Id"])}\"><i data-feather=\"eye\" class=\"w-4 h-4 mr-1\"></i>Details </a>");
                    str.Append($"<a href=\"Products.aspx?id={Convert.ToInt32(dt.Rows[i]["Id"])}\" class=\"flex items-center text-theme-6\" ><i data-feather=\"trash-2\" class=\"w-4 h-4 mr-1\"></i>Delete </a>");
                    str.Append("</div></td></tr>");
                }
            }
            ProductTable.InnerHtml = str.ToString();
        }

    }
}