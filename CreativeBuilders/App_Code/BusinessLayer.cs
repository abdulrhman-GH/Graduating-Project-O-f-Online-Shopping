using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for BusinessLayer
/// </summary>
public class BusinessLayer
{
    #region Admin Dashboard

    #region Categories
    public void AddNewCategory(string Name, string Description)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Name", SqlDbType.NVarChar, 50);
        param[0].Value = Name;
        param[1] = new SqlParameter("@Description", SqlDbType.NVarChar);
        param[1].Value = Description;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("AddNewCategory", param);
    }
    public DataTable getAllCategories()
    {
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getAllCategories", null);
        return dt;
    }
    public void UpdateCategory(int Category_Id, string Category_Name, string Category_Desc)
    {

        SqlParameter[] param = new SqlParameter[3];

        param[0] = new SqlParameter("@Id", SqlDbType.Int);
        param[0].Value = Category_Id;
        param[1] = new SqlParameter("@Name", SqlDbType.NVarChar, 50);
        param[1].Value = Category_Name;
        param[2] = new SqlParameter("@Description", SqlDbType.NVarChar);
        param[2].Value = Category_Desc;


        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("UpdateCategory", param);
    }
    public DataTable DeleteCategory(int Category_Id)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Id", SqlDbType.Int);
        param[0].Value = Category_Id;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("DeleteCategory", param);
        return dt;
    }
    public DataTable getSingleCategory(int Category_Id)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Id", SqlDbType.Int);
        param[0].Value = Category_Id;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getSingleCategory", param);
        return dt;
    }
    #endregion

    #region Suppliers
    public DataTable getAllSuppliers()
    {
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getAllSuppliers", null);
        return dt;
    }
    public DataTable getSingleSupplier(int Supplier_Id)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Id", SqlDbType.Int);
        param[0].Value = Supplier_Id;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getSingleSupplier", param);
        return dt;
    }
    public void AddNewSupplier(string Foundation_Name, string Email, string Commercial_Id, string Location)
    {

        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@Foundation_Name", SqlDbType.NVarChar, 255);
        param[0].Value = Foundation_Name;
        param[1] = new SqlParameter("@Email", SqlDbType.NVarChar, 50);
        param[1].Value = Email;
        param[2] = new SqlParameter("@Commercial_Id", SqlDbType.NVarChar, 255);
        param[2].Value = Commercial_Id;
        param[3] = new SqlParameter("@Location", SqlDbType.NVarChar);
        param[3].Value = Location;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("AddNewSupplier", param);
    }
    public void UpdateSupplier(int Id, string Foundation_Name, string Email, string Commercial_Id, string Location)
    {

        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@Foundation_Name", SqlDbType.NVarChar, 255);
        param[0].Value = Foundation_Name;
        param[1] = new SqlParameter("@Email", SqlDbType.NVarChar, 50);
        param[1].Value = Email;
        param[2] = new SqlParameter("@Commercial_Id", SqlDbType.NVarChar, 255);
        param[2].Value = Commercial_Id;
        param[3] = new SqlParameter("@Location", SqlDbType.NVarChar);
        param[3].Value = Location;
        param[4] = new SqlParameter("@Id", SqlDbType.Int);
        param[4].Value = Id;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("UpdateSupplier", param);
    }
    public DataTable DeleteSupplier(int Supplier_Id)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Id", SqlDbType.Int);
        param[0].Value = Supplier_Id;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("DeleteSupplier", param);
        return dt;
    }
    #endregion

    #region Products
    public DataTable getAllProducts()
    {
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getAllProducts", null);
        return dt;
    }
    public void AddNewProduct(string Name, int Quantity, double Price, string Image, string Description, int CategoryId, int SupplierId)
    {

        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@Name", SqlDbType.NVarChar, 50);
        param[0].Value = Name;
        param[1] = new SqlParameter("@Quantity", SqlDbType.Int);
        param[1].Value = Quantity;
        param[2] = new SqlParameter("@Price", SqlDbType.Float);
        param[2].Value = Price;
        param[3] = new SqlParameter("@Image", SqlDbType.NVarChar);
        param[3].Value = Image;
        param[4] = new SqlParameter("@Description", SqlDbType.NVarChar);
        param[4].Value = Description;
        param[5] = new SqlParameter("@CategoryId", SqlDbType.Int);
        param[5].Value = CategoryId;
        param[6] = new SqlParameter("@SupplierId", SqlDbType.Int);
        param[6].Value = SupplierId;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("AddNewProduct", param);
    }
    public DataTable getSingleProduct(int Category_Id)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Id", SqlDbType.Int);
        param[0].Value = Category_Id;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getSingleProduct", param);
        return dt;
    }
    public DataTable DeleteProduct(int Category_Id)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Id", SqlDbType.Int);
        param[0].Value = Category_Id;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("DeleteProduct", param);
        return dt;
    }
    public void UpdateProduct(int Id, string Name, int Quantity, double Price, string Image, string Description, int CategoryId, int SupplierId)
    {

        SqlParameter[] param = new SqlParameter[8];
        param[0] = new SqlParameter("@Name", SqlDbType.NVarChar, 50);
        param[0].Value = Name;
        param[1] = new SqlParameter("@Quantity", SqlDbType.Int);
        param[1].Value = Quantity;
        param[2] = new SqlParameter("@Price", SqlDbType.Float);
        param[2].Value = Price;
        param[3] = new SqlParameter("@Image", SqlDbType.NVarChar);
        param[3].Value = Image;
        param[4] = new SqlParameter("@Description", SqlDbType.NVarChar);
        param[4].Value = Description;
        param[5] = new SqlParameter("@CategoryId", SqlDbType.Int);
        param[5].Value = CategoryId;
        param[6] = new SqlParameter("@SupplierId", SqlDbType.Int);
        param[6].Value = SupplierId;
        param[7] = new SqlParameter("@Id", SqlDbType.Int);
        param[7].Value = Id;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("UpdateProduct", param);
    }
    #endregion

    #region Users
    public DataTable AdminLogin(string Email, string Password)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Email", SqlDbType.NVarChar, 255);
        param[0].Value = Email;
        param[1] = new SqlParameter("@Password", SqlDbType.NVarChar, 255);
        param[1].Value = Password;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("AdminLogin", param);
        return dt;
    }
    public DataTable getAllUsers()
    {
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getAllUsers", null);
        return dt;
    }
    public DataTable getSingleUser(int Id)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Id", SqlDbType.Int);
        param[0].Value = Id;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getSingleUser", param);
        return dt;
    }
    public void UpdateUserProfile(int Id, string Name, string Email, string Phone, string Avatar, string Gender, string Address)
    {

        SqlParameter[] param = new SqlParameter[7];
        param[0] = new SqlParameter("@Id", SqlDbType.Int);
        param[0].Value = Id;
        param[1] = new SqlParameter("@Name", SqlDbType.NVarChar, 255);
        param[1].Value = Name;
        param[2] = new SqlParameter("@Email", SqlDbType.NVarChar, 255);
        param[2].Value = Email;
        param[3] = new SqlParameter("@Phone", SqlDbType.NVarChar, 50);
        param[3].Value = Phone;
        param[4] = new SqlParameter("@Avatar", SqlDbType.NVarChar);
        param[4].Value = Avatar;
        param[5] = new SqlParameter("@Gender", SqlDbType.Char, 10);
        param[5].Value = Gender;
        param[6] = new SqlParameter("@Address", SqlDbType.NVarChar);
        param[6].Value = Address;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("UpdateUserProfile", param);
    }
    public void UpdateUserPassword(int Id, string Password)
    {

        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Id", SqlDbType.Int);
        param[0].Value = Id;
        param[1] = new SqlParameter("@Password", SqlDbType.NVarChar, 255);
        param[1].Value = Password;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("UpdateUserPassword", param);
    }



    #endregion
    #endregion

    #region FrontEnd

    #region Products
    public DataTable getRelatedProduct(int Id , int ProductId)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@CategoryId", SqlDbType.Int);
        param[0].Value = Id;
        param[1] = new SqlParameter("@Id", SqlDbType.Int);
        param[1].Value = ProductId;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getRelatedProduct", param);
        return dt;
    }


    #endregion
    #region Customers
    public void CustomerRegister(string FirstName, string LastName,string Email, string Password, DateTime DOB, string Phone,
        string City, string StreetName, string DistictName)
    {

        SqlParameter[] param = new SqlParameter[9];
        param[0] = new SqlParameter("@FirstName", SqlDbType.NVarChar, 50);
        param[0].Value = FirstName;
        param[1] = new SqlParameter("@LastName", SqlDbType.NVarChar,50);
        param[1].Value = LastName;
        param[2] = new SqlParameter("@Email", SqlDbType.NVarChar, 50);
        param[2].Value = Email;
        param[3] = new SqlParameter("@Password", SqlDbType.NVarChar,50);
        param[3].Value = Password;
        param[4] = new SqlParameter("@DOB", SqlDbType.Date);
        param[4].Value = DOB.ToShortDateString();
        param[5] = new SqlParameter("@Phone", SqlDbType.NVarChar, 50);
        param[5].Value = Phone;
        param[6] = new SqlParameter("@City", SqlDbType.NVarChar, 50);
        param[6].Value = City;
        param[7] = new SqlParameter("@StreetName", SqlDbType.NVarChar, 50);
        param[7].Value = StreetName;
        param[8] = new SqlParameter("@DistictName", SqlDbType.NVarChar, 50);
        param[8].Value = DistictName;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("CustomerRegister", param);
    }
    public void CreateNewCart(int UserId)
    {

        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@UserId", SqlDbType.Int);
        param[0].Value = UserId;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("CreateNewCart", param);
    }
    public DataTable getLatestCustomerId()
    {
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getLatestCustomerId", null);
        return dt;
    }
    public DataTable CustomerLogin(string Email, string Password)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Email", SqlDbType.NVarChar, 255);
        param[0].Value = Email;
        param[1] = new SqlParameter("@Password", SqlDbType.NVarChar, 255);
        param[1].Value = Password;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("CustomerLogin", param);
        return dt;
    }
    public DataTable getCustomerCartId(int UserId)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@UserId", SqlDbType.Int);
        param[0].Value = UserId;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getCustomerCartId", param);
        return dt;
    }
    public void AddItemToCart(int CartId , int ProductId ,int Quantity, double Price)
    {

        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@CartId", SqlDbType.Int);
        param[0].Value = CartId;
        param[1] = new SqlParameter("@ProductId", SqlDbType.Int);
        param[1].Value = ProductId;
        param[2] = new SqlParameter("@Price", SqlDbType.Float);
        param[2].Value = Price;
        param[3] = new SqlParameter("@Quantity", SqlDbType.Int);
        param[3].Value = Quantity;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("AddItemToCart", param);
    }
    public DataTable getProductPrice(int Id)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Id", SqlDbType.Int);
        param[0].Value = Id;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getProductPrice", param);
        return dt;
    }
    public DataTable CheckIfItemExistsInCart(int CartId, int ProductId)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@CartId", SqlDbType.Int);
        param[0].Value = CartId;
        param[1] = new SqlParameter("@ProductId", SqlDbType.Int);
        param[1].Value = ProductId;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("CheckIfItemExistsInCart", param);
        return dt;
    }
    public DataTable getCartItemsCount(int CartId)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@CartId", SqlDbType.Int);
        param[0].Value = CartId;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getCartItemsCount", param);
        return dt;
    }
    public DataTable getCartItems(int CartId)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@CartId", SqlDbType.Int);
        param[0].Value = CartId;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getCartItems", param);
        return dt;
    }
    public void DeleteCartItem(int CartId, int ProductId)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@CartId", SqlDbType.Int);
        param[0].Value = CartId;
        param[1] = new SqlParameter("@ProductId", SqlDbType.Int);
        param[1].Value = ProductId;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("DeleteCartItem", param);
    }
    public void UpdateItemInCart(int CartId, int ProductId, int Quantity, double Price)
    {

        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@CartId", SqlDbType.Int);
        param[0].Value = CartId;
        param[1] = new SqlParameter("@ProductId", SqlDbType.Int);
        param[1].Value = ProductId;
        param[2] = new SqlParameter("@Price", SqlDbType.Float);
        param[2].Value = Price;
        param[3] = new SqlParameter("@Quantity", SqlDbType.Int);
        param[3].Value = Quantity;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("UpdateItemInCart", param);
    }
    public void ProceedToCheckout(int CartId, double SubTotal, double Taxes, double Total)
    {

        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@CartId", SqlDbType.Int);
        param[0].Value = CartId;
        param[1] = new SqlParameter("@SubTotal", SqlDbType.Float);
        param[1].Value = SubTotal;
        param[2] = new SqlParameter("@Taxes", SqlDbType.Float);
        param[2].Value = Taxes;
        param[3] = new SqlParameter("@Total", SqlDbType.Float);
        param[3].Value = Total;
       
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("ProceedToCheckout", param);
    }
    public DataTable getOrdereExtraInfo(int CartId, int UserId)
    {
        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@CartId", SqlDbType.Int);
        param[0].Value = CartId;
        param[1] = new SqlParameter("@UserId", SqlDbType.Int);
        param[1].Value = UserId;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getOrdereExtraInfo", param);
        return dt;
    }
    public DataTable getcustomeraccountdata(int Id)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@Id", SqlDbType.Int);
        param[0].Value = Id;
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getcustomeraccountdata", param);
        return dt;
    }
    public void UpdateCustomerAccountdata(int Id, string FirstName, string LastName, string Email, DateTime DOB, string Phone,
     string City, string StreetName, string DistictName)
    {

        SqlParameter[] param = new SqlParameter[9];
        param[0] = new SqlParameter("@FirstName", SqlDbType.NVarChar, 50);
        param[0].Value = FirstName;
        param[1] = new SqlParameter("@LastName", SqlDbType.NVarChar, 50);
        param[1].Value = LastName;
        param[2] = new SqlParameter("@Email", SqlDbType.NVarChar, 50);
        param[2].Value = Email;
        param[3] = new SqlParameter("@DOB", SqlDbType.Date);
        param[3].Value = DOB.ToShortDateString();
        param[4] = new SqlParameter("@Phone", SqlDbType.NVarChar, 50);
        param[4].Value = Phone;
        param[5] = new SqlParameter("@City", SqlDbType.NVarChar, 50);
        param[5].Value = City;
        param[6] = new SqlParameter("@StreetName", SqlDbType.NVarChar, 50);
        param[6].Value = StreetName;
        param[7] = new SqlParameter("@DistictName", SqlDbType.NVarChar, 50);
        param[7].Value = DistictName;
        param[8] = new SqlParameter("@Id", SqlDbType.Int);
        param[8].Value = Id;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("UpdateCustomerAccountdata", param);
    }
    public void UpdateCustomerPassword(int Id, string Password)
    {

        SqlParameter[] param = new SqlParameter[2];
        param[0] = new SqlParameter("@Id", SqlDbType.Int);
        param[0].Value = Id;
        param[1] = new SqlParameter("@Password", SqlDbType.NVarChar, 50);
        param[1].Value = Password;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("UpdateCustomerPassword", param);
    }
    public void CreateOrder(int CartId, double SubTotal, double Taxes, double Total, DateTime OrderDate)
    {

        SqlParameter[] param = new SqlParameter[5];
        param[0] = new SqlParameter("@CartId", SqlDbType.Int);
        param[0].Value = CartId;
        param[1] = new SqlParameter("@SubTotal", SqlDbType.Float);
        param[1].Value = SubTotal;
        param[2] = new SqlParameter("@Taxes", SqlDbType.Float);
        param[2].Value = Taxes;
        param[3] = new SqlParameter("@Total", SqlDbType.Float);
        param[3].Value = Total;
        param[4] = new SqlParameter("@OrderDate", SqlDbType.Date);
        param[4].Value = OrderDate.ToShortDateString();
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("CreateOrder", param);
    }
    public void AddOrderItems(int OrderId, int ProductId, int Quantity, double Price)
    {

        SqlParameter[] param = new SqlParameter[4];
        param[0] = new SqlParameter("@OrderId", SqlDbType.Int);
        param[0].Value = OrderId;
        param[1] = new SqlParameter("@ProductId", SqlDbType.Int);
        param[1].Value = ProductId;
        param[2] = new SqlParameter("@Price", SqlDbType.Float);
        param[2].Value = Price;
        param[3] = new SqlParameter("@Quantity", SqlDbType.Int);
        param[3].Value = Quantity;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("AddOrderItems", param);
    }
    public void UpdateCard(int CartId)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@CartId", SqlDbType.Int);
        param[0].Value = CartId;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("UpdateCard", param);
    }
    public DataTable getLatestOrderId()
    {
        DataAccessLayer dal = new DataAccessLayer();
        DataTable dt = dal.SelectData("getLatestOrderId", null);
        return dt;
    }
    public void DeleteCartItems(int CartId)
    {
        SqlParameter[] param = new SqlParameter[1];
        param[0] = new SqlParameter("@CartId", SqlDbType.Int);
        param[0].Value = CartId;
        DataAccessLayer dal = new DataAccessLayer();
        dal.ExcuteOperation("DeleteCartItems", param);
    }


    #endregion
    #endregion

}