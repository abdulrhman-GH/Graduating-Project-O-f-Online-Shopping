using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CreativeBuilders.AdminDashboard
{
    public partial class UpdateProfile : System.Web.UI.Page
    {
        BusinessLayer BL = new BusinessLayer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["LoginStatus"] != null && Session["LoginStatus"].ToString() == "LoggedIn")
                {
                    DataTable dt = BL.getSingleUser(Convert.ToInt32(Session["UserId"]));
                    UserAvatar.Src = $"dist/images/users/{dt.Rows[0]["Avatar"].ToString()}";
                    txtName.Value = dt.Rows[0]["Name"].ToString();
                    txtEmail.Value = dt.Rows[0]["Email"].ToString();
                    txtPhoneNumber.Value = dt.Rows[0]["Phone"].ToString();
                    drpGender.Value = dt.Rows[0]["Gender"].ToString();
                    txtAddress.Value = dt.Rows[0]["Address"].ToString();
                }
                else
                    Response.Redirect("Login.aspx");
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string Img_name = Session["UserAvatar"].ToString();
            if (FileUploadImage.PostedFile.FileName != "")
            {
                Img_name = FileUploadImage.PostedFile.FileName;
                string folder_path = Server.MapPath(@"dist/images/users/");
                string UploadFilePath = folder_path + Img_name;
                FileUploadImage.PostedFile.SaveAs(UploadFilePath);
            }
            HttpCookie AddMsgCookie = new HttpCookie("status");
            AddMsgCookie.Value = "add";
            AddMsgCookie.Expires = DateTime.Now.AddSeconds(6);
            Response.Cookies.Add(AddMsgCookie);
            BL.UpdateUserProfile(Convert.ToInt32(Session["UserId"]), txtName.Value, txtEmail.Value, txtPhoneNumber.Value
                , Img_name, drpGender.Value, txtAddress.Value);
            Response.Redirect("Dashboard.aspx");
        }
    }
}