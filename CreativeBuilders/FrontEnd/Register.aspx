<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/FrontEnd.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="CreativeBuilders.FrontEnd.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--=====================
    Breadcrumb Aera Start
    =========================-->
    <div style="padding-top: 10px;">
        <div class="breadcrumbs_area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li>
                                    <h1><a href="Index.aspx">Home</a></h1>
                                </li>
                                <li>Register</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--=====================
    Breadcrumb Aera End
    =========================-->

    <!--======================
    Register area Start
    ==========================-->
    <div class="register-area login-area mt-25">
        <div class="container">
            <div class="row">
                <div class="offset-lg-3 col-lg-6">
                    <div class="checkout_info mb-20">
                        <form class="form-row" action="#">
                            <h5 class="last-title mb-10 text-center">Creat New Account</h5>
                            <div class="col-lg-12 text-left mb-20">
                                <p class="register-page">Already have an account? <a href="Login.aspx">Log in instead!</a></p>
                            </div>
                            <div class="form_group col-12">
                                <label class="form-label">First Name <span>*</span></label>
                                <input class="input-form" runat="server" id="txtFName" type="text" required/>
                            </div>
                            <div class="form_group col-12">
                                <label class="form-label">Last Name <span>*</span></label>
                                <input class="input-form" type="text" runat="server" id="txtLName" required/>
                            </div>
                            <div class="form_group col-12">
                                <label class="form-label">Email Address <span>*</span></label>
                                <input class="input-form" type="email" runat="server" id="txtEmail" required/>
                            </div>
                            <div class="form_group col-12">
                                <label class="form-label">Password <span>*</span></label>
                                <input class="input-form" type="password" runat="server" id="txtPassword" required/>
                                
                            </div>
                            <div class="form_group col-12">
                                <label class="form-label">Confirm Password <span>*</span></label>
                                <input class="input-form" type="password" runat="server" id="txtConfirmPassword" required/>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords are not Matching"
                                    ForeColor="Red" ControlToValidate="txtPassword" ControlToCompare="txtConfirmPassword"></asp:CompareValidator>
                                </div>
                         
                            <div class="form_group col-12 position-relative">
                                <label class="form-label">Birthdate (Optional)</label>
                                <input class="input-form" type="date" runat="server" id="txtDOB"/>
                            </div>
                            <div class="form_group col-12">
                                <label class="form-label">Phone Number  (Optional)</label>
                                <input class="input-form" runat="server" id="txtPhone" type="tel" />
                            </div>
                            <div class="form_group col-12">
                                <label class="form-label">City  (Optional)</label>
                                <input class="input-form" type="text" runat="server" id="txtCity" />
                            </div>
                            <div class="form_group col-12">
                                <label class="form-label">Street  (Optional)</label>
                                <input class="input-form" type="text" runat="server" id="txtStreet" />
                            </div>
                             <div class="form_group col-12">
                                <label class="form-label">District  (Optional)</label>
                                <input class="input-form" type="text" runat="server" id="txtDistrict" />
                            </div>
                        
                            <div class="form-row mt-20">
                                <asp:Button ID="btnRegister" runat="server" CssClass="btn-secondary mx-auto" Text="Register" OnClick="btnRegister_Click" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--======================
    Register area End
    ==========================-->
</asp:Content>
