<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard/admin.Master" AutoEventWireup="true" CodeBehind="AddSupplier.aspx.cs" Inherits="CreativeBuilders.AdminDashboard.AddSupplier" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">
    <div class="intro-y flex items-center mt-8">
        <h2 class="text-lg font-medium mr-auto" runat="server" id="lbltitle">Add New Supplier
        </h2>
    </div>
    <div class="grid grid-cols-12 gap-6 mt-5">
        <div class="intro-y col-span-12 lg:col-span-8 ">
            <!-- BEGIN: Form Layout -->
            <form runat="server" class="intro-y box p-5">

                <div>
                    <label>Foundation Name</label>
                    <asp:TextBox ID="txtFoundationName" runat="server" class="input w-full border mt-2" placeholder="Name" required></asp:TextBox>
                </div>
                <div>
                    <label>Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" class="input w-full border mt-2" placeholder="Email" TextMode="Email"></asp:TextBox>
                </div>
                 <div>
                    <label>Commercial Id</label>
                    <asp:TextBox ID="txtCommId" runat="server" class="input w-full border mt-2" placeholder="Id"></asp:TextBox>
                </div>
                 <div>
                    <label>Location</label>
                    <asp:TextBox ID="txtLocation" runat="server" class="input w-full border mt-2" placeholder="Location"></asp:TextBox>
                </div>
                
                <div class="text-right mt-5">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="button w-24 bg-theme-1 text-white" OnClick="btnSave_Click" />
                    <a href="Suppliers.aspx" class="button w-24 bg-gray-200 text-black ml-2">Back To List</a>
                </div>
            </form>
            <!-- END: Form Layout -->
        </div>
    </div>
</asp:Content>
