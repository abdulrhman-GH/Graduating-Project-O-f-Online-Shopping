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
    public partial class OrderDetails : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    BuildInvoice(Convert.ToInt32(Request.QueryString["id"].ToString()));
                }
                else
                    Response.Redirect("Orders.aspx");
            }
        }

        private void BuildInvoice(int id)
        {
            DataTable dt = BL.getSingleOrder(id);
            OrderId.InnerText = dt.Rows[0]["OrderId"].ToString();
            OrderDate.InnerText = dt.Rows[0]["OrderDate"].ToString();
            CustName.InnerText = dt.Rows[0]["FullName"].ToString();
            CustEmail.InnerText = dt.Rows[0]["Email"].ToString();
            TotalPrice.InnerText = dt.Rows[0]["Total"].ToString();
            StringBuilder str = new StringBuilder();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                str.Append("<tr><td class=\"border-b\">");
                str.Append($"<div class=\"font-medium whitespace-no-wrap\">{dt.Rows[i]["Name"].ToString()}</div></td>");
                str.Append($"<td class=\"text-right border-b w-32\">{dt.Rows[i]["Quantity"].ToString()}</td>");
                str.Append($"<td class=\"text-right border-b w-32\">{dt.Rows[i]["Price"].ToString()}</td>");
                str.Append($"<td class=\"text-right border-b w-32 font-medium\">{Convert.ToDouble(dt.Rows[i]["Quantity"].ToString())* Convert.ToDouble(dt.Rows[i]["Price"].ToString())}</td></tr>");
            }
            OrderItems.InnerHtml = str.ToString();
        }
    }
}