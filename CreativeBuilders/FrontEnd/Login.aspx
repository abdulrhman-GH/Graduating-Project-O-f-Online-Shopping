<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/FrontEnd.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="Login.aspx.cs" Inherits="CreativeBuilders.FrontEnd.Login" %>
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
                                <li>Login</li>
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
    login area Start
    ==========================-->
    <div class="login-area mt-25">
        <div class="container">
            <div class="row">
                <div class="offset-lg-3 col-lg-6">
                    <div class="checkout_info mb-20">
                        <div class="form-row">
                       
                            <h1 class="last-title mb-30 text-center">Login to Your Account</h1>
                            <div class="form_group col-12">
                                <label class="form-label">Email <span>*</span></label>
                                <asp:TextBox ID="TxtEmail" TextMode="Email" class="input-form" runat="server" Required></asp:TextBox>
                            </div>
                            <div class="form_group col-12 position-relative">
                                <label class="form-label">Password <span>*</span></label>
                                <asp:TextBox ID="TxtPassword" TextMode="Password" class="input-form" runat="server" Required></asp:TextBox>

                            </div>
                            <asp:Label ID="lblErrorMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                                <asp:Button ID="BtnLogin" class="btn btn-secondary login-register mx-auto" runat="server" Text="Login" OnClick="BtnLogin_Click" />


                            <div class="col-lg-12 text-left">
                                <p class="register-page">No account? <a href="Register.aspx">Create one here</a>.</p>
                            </div>
                        
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--======================
    login area End
    ==========================-->
</asp:Content>
