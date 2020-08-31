<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard/admin.Master" AutoEventWireup="true" CodeBehind="ResetPassword.aspx.cs" Inherits="CreativeBuilders.AdminDashboard.ResetPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">
    <form runat="server">
        <div class="intro-y flex items-center mt-8">
            <h2 class="text-lg font-medium mr-auto">Update Profile
                    </h2>
        </div>
        <div class="grid grid-cols-12 gap-6">

            <div class="col-span-12 lg:col-span-8 xxl:col-span-9">
                <!-- BEGIN: Display Information -->
                <div class="intro-y box lg:mt-5">
                    <div class="flex items-center p-5 border-b border-gray-200">
                        <h2 class="font-medium text-base mr-auto">Display Information
                                </h2>
                    </div>
                    <div class="p-5">
                        <div class="grid grid-cols-12 gap-5">

                            <div class="col-span-12 xl:col-span-8">
                                <div>
                                    <label>Old Password</label>
                                    <input type="password" runat="server" id="txtOldPassword" class="input w-full border mt-2" required>
                                    <asp:Label ID="lblErrorMsg" runat="server" ForeColor="Red"></asp:Label>

                                </div>
                                <div>
                                    <label>New Password</label>
                                    <asp:TextBox ID="txtNewPassword" CssClass="input w-full border mt-2" runat="server" TextMode="Password" required></asp:TextBox>
                                </div>
                                <div>
                                    <label>Confirm Password</label>
                                    <asp:TextBox ID="txtConfirmPassword" CssClass="input w-full border mt-2" runat="server" TextMode="Password" required></asp:TextBox>
                                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtNewPassword" ControlToCompare="txtConfirmPassword" ErrorMessage="Passwords are not matching" ForeColor="Red"></asp:CompareValidator>
                                </div>

                                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="button w-20 bg-theme-1 text-white mt-3" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</asp:Content>
