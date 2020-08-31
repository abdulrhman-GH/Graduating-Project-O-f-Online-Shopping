<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/FrontEnd.Master" AutoEventWireup="true" EnableEventValidation="false" CodeBehind="UpdateAcountData.aspx.cs" Inherits="CreativeBuilders.FrontEnd.UpdateAcountData" %>
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
                                <li>Update Account Data</li>
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
                            <h5 class="last-title mb-10 text-center">Update My Data</h5>

                            <div class="form_group col-12">
                                <label class="form-label">First Name <span>*</span></label>
                                <input class="input-form" runat="server" id="txtFName" type="text" required />
                            </div>
                            <div class="form_group col-12">
                                <label class="form-label">Last Name <span>*</span></label>
                                <input class="input-form" type="text" runat="server" id="txtLName" required />
                            </div>
                            <div class="form_group col-12">
                                <label class="form-label">Email Address <span>*</span></label>
                                <input class="input-form" type="email" runat="server" id="txtEmail" required />
                            </div>
                         

                            <div class="form_group col-12 position-relative">
                                <label class="form-label">Birthdate<span>*</span></label>
                                <input class="input-form" type="text" pattern="(0[1-9]|1[012])[- /.](0[1-9]|[12][0-9]|3[01])[- /.](19|20)\d\d" placeholder="03/25/2000" runat="server" id="txtDOB" required/>
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
                                <asp:Button ID="btnUpdateAccount" runat="server" CssClass="btn-secondary mx-auto" Text="Save" OnClick="btnUpdateAccount_Click" />
                            </div>
                               <div class="col-lg-12 text-left">
                                <p class="register-page"><a href="ResetCustomerPassword.aspx">Reset Password here</a>.</p>
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
