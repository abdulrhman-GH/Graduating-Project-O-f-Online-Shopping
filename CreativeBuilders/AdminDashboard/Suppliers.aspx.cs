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
    public partial class Suppliers : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BuildSuppliersTable();
                if (Request.QueryString["id"] != null)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    DeleteCategory(id);
                    BuildSuppliersTable();
                }
            }
        }
        void BuildSuppliersTable()
        {
            DataTable dt = BL.getAllSuppliers();
            StringBuilder str = new StringBuilder();
            if (dt.Rows.Count <= 0)
            {
                str.Append("<tr class=\"intro-x\">");
                str.Append("<td><div class=\"flex justify-center items-center\">");
                str.Append($"<a href=\"#\" class=\"font-medium whitespace-no-wrap\">No Suppliers Added Yet !</a>");
                str.Append("</div></td></tr>");
            }
            else
            {
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    str.Append($"<tr class=\"intro-x\"><td class=\"font-medium whitespace-no-wrap w-40 text-center\">{dt.Rows[i]["Foundation_Name"].ToString()}</td> ");
                    str.Append($"<td class=\"font-medium whitespace-no-wrap w-40 text-center\">{dt.Rows[i]["Email"].ToString()}</td> ");
                    str.Append($"<td class=\"font-medium whitespace-no-wrap w-40 text-center\">{dt.Rows[i]["Commercial_Id"].ToString()}</td> ");
                    str.Append($"<td class=\"font-medium whitespace-no-wrap w-40 text-center\">{dt.Rows[i]["Location"].ToString()}</td> ");
                    str.Append("<td class=\"table-report__action w-56\">");
                    str.Append("<div class=\"flex justify-center items-center\">");
                    str.Append($"<a class=\"flex items-center mr-3\" href=\"AddSupplier.aspx?id={Convert.ToInt32(dt.Rows[i]["Id"])}\"><i data-feather=\"check-square\" class=\"w-4 h-4 mr-1\"></i>Edit </a>");
                    str.Append($"<a href=\"Suppliers.aspx?id={Convert.ToInt32(dt.Rows[i]["Id"])}\" class=\"flex items-center text-theme-6\" ><i data-feather=\"trash-2\" class=\"w-4 h-4 mr-1\"></i>Delete </a>");
                    str.Append("</div></td></tr>");
                }
            }
            SupplierTable.InnerHtml = str.ToString();
        }
        void DeleteCategory(int id)
        {
            HttpCookie AddMsgCookie = new HttpCookie("status");
            AddMsgCookie.Value = "delete";
            AddMsgCookie.Expires = DateTime.Now.AddSeconds(6);
            Response.Cookies.Add(AddMsgCookie);
            BL.DeleteSupplier(id);
            Response.Redirect("Suppliers.aspx");
        }

    }
}