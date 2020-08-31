using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.FrontEnd
{
    public partial class Product_Details : System.Web.UI.Page
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
                    ProductImg.Src = $"../AdminDashboard/dist/images/products/{dt.Rows[0]["Image"].ToString()}";
                    ProductName.InnerText = dt.Rows[0]["Name"].ToString();
                    CategoryName.InnerText = dt.Rows[0]["CatName"].ToString();
                    Price.InnerText = dt.Rows[0]["Price"].ToString();
                    ProductDesc.InnerText = dt.Rows[0]["Description"].ToString();
                    RelatedProductsRepeater.DataSource = BL.getRelatedProduct(Convert.ToInt32(dt.Rows[0]["CategoryId"].ToString()),id);
                    RelatedProductsRepeater.DataBind();
                }
                else
                {
                    Response.Redirect("Index.aspx");
                }
            }

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["id"]);
            DataTable dtbool = BL.CheckIfItemExistsInCart(Convert.ToInt32(Session["CartId"].ToString()), id);
            if (dtbool.Rows.Count == 0)
            {
                BL.AddItemToCart(Convert.ToInt32(Session["CartId"].ToString()), id,
                   Convert.ToInt32(Quantity.Value), Convert.ToDouble(Price.InnerText)* Convert.ToInt32(Quantity.Value));
            }
            Response.Redirect("shopping-cart.aspx");
        }
    }
}