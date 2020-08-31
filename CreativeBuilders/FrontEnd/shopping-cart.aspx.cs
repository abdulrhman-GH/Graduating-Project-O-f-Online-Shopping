using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace CreativeBuilders.FrontEnd
{
    public partial class shopping_cart : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (Session["CartId"] != null)
                {
                    if (Request.QueryString["id"] != null)
                    {
                        BL.DeleteCartItem(Convert.ToInt32(Session["CartId"].ToString()), Convert.ToInt32(Request.QueryString["id"].ToString()));
                    }
                    GetItems();
                }
                else
                    Response.Redirect("Index.aspx");
            }
        }
        protected void GetItems()
        {
            DataTable dt = BL.getCartItems(Convert.ToInt32(Session["CartId"].ToString()));
            rptCardItems.DataSource = dt;
            rptCardItems.DataBind();
            double subtotal = 0.0;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                subtotal += Convert.ToDouble(dt.Rows[i]["TotalPrice"].ToString());
            }
            subTotal.InnerText = subtotal.ToString();
            cartTotalPrice.InnerText = subtotal.ToString();
        }
        protected void btnUpdateCart_Click(object sender, EventArgs e)
        {
            foreach (RepeaterItem i in rptCardItems.Items)
            {
                HtmlInputControl txtId = (HtmlInputControl)i.FindControl("txtId");
                TextBox txtQuantity = (TextBox)i.FindControl($"txtqtyhide");
                DataTable dt = BL.getProductPrice(Convert.ToInt32(txtId.Value));
                BL.UpdateItemInCart(Convert.ToInt32(Session["CartId"].ToString()), Convert.ToInt32(txtId.Value),
                    Convert.ToInt32(txtQuantity.Text), Convert.ToDouble(dt.Rows[0]["Price"].ToString()) * Convert.ToInt32(txtQuantity.Text));
            }
            GetItems();
        }
        protected void btnProceed_Click(object sender, EventArgs e)
        {
            BL.ProceedToCheckout(Convert.ToInt32(Session["CartId"].ToString()), Convert.ToDouble(subTotal.InnerText),
                Convert.ToDouble(txtTaxes.Value), Convert.ToDouble(cartTotalPrice.InnerText));
            Response.Redirect("Checkout.aspx");
        }
    }
}