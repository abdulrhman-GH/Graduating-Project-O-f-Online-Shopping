using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.FrontEnd
{

    public partial class Products : System.Web.UI.Page
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
                BindRepeater();
            }
        }
        protected void BindRepeater()
        {
            DataTable dt = BL.getAllProducts();
            PagedDataSource pgitems = new PagedDataSource();
            DataView dv = new DataView(dt);
            pgitems.DataSource = dv;
            pgitems.AllowPaging = true;
            pgitems.PageSize = 12;
            pgitems.CurrentPageIndex = PageNumber;
            if (pgitems.PageCount > 1)
            {
                rptPaging.Visible = true;
                ArrayList pages = new ArrayList();
                for (int i = 0; i < pgitems.PageCount; i++)
                    pages.Add((i + 1).ToString());
                rptPaging.DataSource = pages;
                rptPaging.DataBind();
            }
            else
            {
                rptPaging.Visible = false;
            }
            rptProducts.DataSource = pgitems;
            rptProducts.DataBind();
        }
        public int PageNumber
        {
            get
            {
                if (ViewState["PageNumber"] != null)
                    return Convert.ToInt32(ViewState["PageNumber"]);
                else
                    return 0;
            }
            set
            {
                ViewState["PageNumber"] = value;
            }
        }
        protected void rptPaging_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            PageNumber = Convert.ToInt32(e.CommandArgument) - 1;
            BindRepeater();
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