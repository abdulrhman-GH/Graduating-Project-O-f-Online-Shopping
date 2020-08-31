<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/FrontEnd.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="ResetCustomerPassword.aspx.cs" Inherits="CreativeBuilders.FrontEnd.ResetCustomerPassword" %>
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
                                <li>
                                    <h1><a href="UpdateAcountData.aspx">Update Account Data</a></h1>
                                </li>
                                <li>Reset Password</li>
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
                            <h5 class="last-title mb-10 text-center">Reset Password</h5>

                                <div class="form_group col-12">
                                <label class="form-label">Old Password <span>*</span></label>
                                <input class="input-form" type="password" runat="server" id="txtOldPassword" required/>
                                <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>

                                
                            </div>
                            <div class="form_group col-12">
                                <label class="form-label">New Password <span>*</span></label>
                                <input class="input-form" type="password" runat="server" id="txtNewPassword" required/>
                                
                            </div>
                            <div class="form_group col-12">
                                <label class="form-label">Confirm Password <span>*</span></label>
                                <input class="input-form" type="password" runat="server" id="txtConfirmPassword" required/>
                                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords are not Matching"
                                    ForeColor="Red" ControlToValidate="txtConfirmPassword" ControlToCompare="txtNewPassword"></asp:CompareValidator>
                                </div>
                            <div class="form-row mt-20">
                                <asp:Button ID="btnSave" runat="server" CssClass="btn-secondary mx-auto" Text="Save" OnClick="btnSave_Click" />
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

