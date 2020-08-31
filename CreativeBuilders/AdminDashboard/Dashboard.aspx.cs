using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.AdminDashboard
{
    public partial class Dashboard : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CategoriesCount.InnerText = BL.getAllCategories().Rows.Count.ToString();
                SuppliersCount.InnerText = BL.getAllSuppliers().Rows.Count.ToString();
                ProductsCount.InnerText = BL.getAllProducts().Rows.Count.ToString();
                UsersCount.InnerText = BL.getAllUsers().Rows.Count.ToString();
            }
        }
    }
}