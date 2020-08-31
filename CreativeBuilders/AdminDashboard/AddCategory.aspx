<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard/admin.Master" AutoEventWireup="true" CodeBehind="AddCategory.aspx.cs" Inherits="CreativeBuilders.AdminDashboard.AddCategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function setAddMsg() {
            localStorage.setItem('status', 'add')
            setTimeout(function () {
                location.href = "index.asp";
            }, 100)
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">
    <div class="intro-y flex items-center mt-8">
        <h2 class="text-lg font-medium mr-auto" runat="server" id="lbltitle">Add New Category
        </h2>
    </div>
    <div class="grid grid-cols-12 gap-6 mt-5">
        <div class="intro-y col-span-12 lg:col-span-8 ">
            <!-- BEGIN: Form Layout -->
            <form runat="server" class="intro-y box p-5">
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

                <div>
                    <label>Category Name</label>
                    <asp:TextBox ID="txtCategoryName" runat="server" class="input w-full border mt-2" placeholder="Name" required></asp:TextBox>
                </div>
                <div class="mt-3">
                    <label>Description</label>
                    <div class="mt-2">
                        <textarea runat="server" id="txtCategoryDesc" placeholder="Enter Description here..." class="input w-full border mt-2" data-feature="basic" name="editor"></textarea>
                    </div>
                </div>
                <div class="text-right mt-5">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="button w-24 bg-theme-1 text-white" OnClick="btnSave_Click" />
                    <a href="Categories.aspx" class="button w-24 bg-gray-200 text-black ml-2">Back To List</a>
                </div>
            </form>
            <!-- END: Form Layout -->
        </div>
    </div>
</asp:Content>
