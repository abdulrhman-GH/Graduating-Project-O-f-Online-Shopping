using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.AdminDashboard
{
    public partial class AddProduct : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();
        static string state = "add";
        static string img;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable dtCats = BL.getAllCategories();
                drpCategories.DataValueField = "Id";
                drpCategories.DataTextField = "Name";
                drpCategories.DataSource = dtCats;
                drpCategories.DataBind();
                DataTable dtSupps = BL.getAllSuppliers();
                drpSuppliers.DataValueField = "Id";
                drpSuppliers.DataTextField = "Foundation_Name";
                drpSuppliers.DataSource = dtSupps;
                drpSuppliers.DataBind();
                if (Request.QueryString["id"] != null)
                {
                    int id = Convert.ToInt32(Request.QueryString["id"]);
                    DataTable dt = BL.getSingleProduct(id);
                    txtProductName.Value = dt.Rows[0]["Name"].ToString();
                    drpCategories.SelectedValue = dt.Rows[0]["CategoryId"].ToString();
                    drpSuppliers.SelectedValue = dt.Rows[0]["SupplierId"].ToString();
                    txtQty.Value = dt.Rows[0]["Quantity"].ToString();
                    txtPrice.Value = dt.Rows[0]["Price"].ToString();
                    txtProductDesc.Value = dt.Rows[0]["Description"].ToString();
                    imgTag.Src = $"dist/images/products/{dt.Rows[0]["Image"].ToString()}";
                    img = dt.Rows[0]["Image"].ToString();
                    txtFileUpload.Attributes.Remove("required");
                    state = "Update";
                    lbltitle.InnerText = "Edit Existing Product";
                    btnSave.Text = "Update";
                }

            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string Img_name;
            if (state == "add")
            {
                 Img_name = txtFileUpload.PostedFile.FileName;
                string folder_path = Server.MapPath(@"dist/images/products/"); 
                string UploadFilePath = folder_path + Img_name;
                txtFileUpload.PostedFile.SaveAs(UploadFilePath);
                HttpCookie AddMsgCookie = new HttpCookie("status");
                AddMsgCookie.Value = "add";
                AddMsgCookie.Expires = DateTime.Now.AddSeconds(6);
                Response.Cookies.Add(AddMsgCookie);
                BL.AddNewProduct(txtProductName.Value, Convert.ToInt32(txtQty.Value), Convert.ToDouble(txtPrice.Value), Img_name,
                        txtProductDesc.Value, Convert.ToInt32(drpCategories.SelectedValue), Convert.ToInt32(drpSuppliers.SelectedValue));
            }
            else
            {
                if (txtFileUpload.PostedFile.FileName != "")
                {
                    Img_name = txtFileUpload.PostedFile.FileName;
                    string folder_path = Server.MapPath(@"dist/images/products/");
                    string UploadFilePath = folder_path + Img_name;
                    txtFileUpload.PostedFile.SaveAs(UploadFilePath);
                }
                else
                    Img_name = img;

                HttpCookie UpdateMsgCookie = new HttpCookie("status");
                UpdateMsgCookie.Value = "update";
                UpdateMsgCookie.Expires = DateTime.Now.AddSeconds(6);
                Response.Cookies.Add(UpdateMsgCookie);
                BL.UpdateProduct(Convert.ToInt32(Request.QueryString["id"]),txtProductName.Value, Convert.ToInt32(txtQty.Value), Convert.ToDouble(txtPrice.Value), Img_name,
                        txtProductDesc.Value, Convert.ToInt32(drpCategories.SelectedValue), Convert.ToInt32(drpSuppliers.SelectedValue));
                state = "add";
            }
            Response.Redirect("Products.aspx");
        }
    }
}