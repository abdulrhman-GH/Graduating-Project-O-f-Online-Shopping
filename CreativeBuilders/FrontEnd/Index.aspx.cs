using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.FrontEnd
{
    public partial class Index : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    AddtoCart(Convert.ToInt32(Request.QueryString["id"].ToString()));
                }
                if (Request.QueryString["Checkout"] != null)
                {
                    if (Request.QueryString["Checkout"].ToString() == "true")
                        AddOrdersToDB();
                    
                }


            }
        }

        private void AddOrdersToDB()
        {
            DataTable dtExtra =  BL.getOrdereExtraInfo(Convert.ToInt32(Session["CartId"].ToString()), Convert.ToInt32(Session["UserId"].ToString()));
            BL.CreateOrder(Convert.ToInt32(Session["CartId"].ToString()),Convert.ToDouble(dtExtra.Rows[0]["SubTotal"].ToString()),
                Convert.ToDouble(dtExtra.Rows[0]["Taxes"].ToString()), Convert.ToDouble(dtExtra.Rows[0]["Total"].ToString()),DateTime.Now);
            DataTable orderId = BL.getLatestOrderId();
            BL.UpdateCard(Convert.ToInt32(Session["CartId"].ToString()));
            DataTable dtCartItems = BL.getCartItems(Convert.ToInt32(Session["CartId"].ToString()));
            for (int i = 0; i < dtCartItems.Rows.Count; i++)
            {
                BL.AddOrderItems(Convert.ToInt32(orderId.Rows[0]["OrderId"].ToString()), Convert.ToInt32(dtCartItems.Rows[i]["ProductId"].ToString()),
                    Convert.ToInt32(dtCartItems.Rows[i]["Quantity"].ToString()), Convert.ToDouble(dtCartItems.Rows[i]["Price"].ToString()));
            }
            BL.DeleteCartItems(Convert.ToInt32(Session["CartId"].ToString()));
        }

        protected void AddtoCart(int ProductId)
        {
            DataTable dt = BL.getProductPrice(ProductId);
            DataTable dtbool = BL.CheckIfItemExistsInCart(Convert.ToInt32(Session["CartId"].ToString()), ProductId);
            if (dtbool.Rows.Count == 0)
            {
                BL.AddItemToCart(Convert.ToInt32(Session["CartId"].ToString()), ProductId,
                    1, Convert.ToDouble(dt.Rows[0]["Price"].ToString()));
            }

        }

    }
}