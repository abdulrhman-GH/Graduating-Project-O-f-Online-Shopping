using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.AdminDashboard
{
    public partial class ProductDetails : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    DataTable dt = BL.getSingleProduct(id);
                    ProductImg.Src = $"dist/images/products/{dt.Rows[0]["Image"].ToString()}";
                    ProductName.InnerText = dt.Rows[0]["Name"].ToString();
                    CategoryName.InnerText = dt.Rows[0]["CatName"].ToString();
                    Quantity.InnerText = dt.Rows[0]["Quantity"].ToString();
                    Price.InnerText = dt.Rows[0]["Price"].ToString();
                    ProductDesc.InnerText = dt.Rows[0]["Description"].ToString();
                }
            }

        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            HttpCookie DeleteMsgCookie = new HttpCookie("status");
            DeleteMsgCookie.Value = "delete";
            DeleteMsgCookie.Expires = DateTime.Now.AddSeconds(6);
            Response.Cookies.Add(DeleteMsgCookie);
            BL.DeleteProduct(Convert.ToInt32(Request.QueryString["id"]));
            Response.Redirect("Products.aspx");
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect($"AddProduct.aspx?id={Convert.ToInt32(Request.QueryString["id"])}");
        }
    }
}