<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard/admin.Master" AutoEventWireup="true" CodeBehind="ProductDetails.aspx.cs" Inherits="CreativeBuilders.AdminDashboard.ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">
    <form runat="server">
    <div class="intro-y flex flex-col sm:flex-row items-center mt-8">
        <h2 class="text-lg font-medium mr-auto">Product Details
                    </h2>
        <div class="w-full sm:w-auto flex mt-4 sm:mt-0">
            <a href="Products.aspx" class="button text-white bg-theme-1 shadow-md mr-2">Back To List</a>
            
        </div>
    </div>
    <div class="intro-y grid grid-cols-12 gap-6 mt-5">
        <div class="intro-y blog col-span-12 md:col-span-6 box">
            <div class="blog__preview image-fit" >
                <img alt="Product Image" class="rounded-t-md" runat="server" id="ProductImg" src="#" style="object-fit:contain"/>
                <div class="absolute bottom-0 text-white px-5 pb-6 z-10"><span runat="server" id="CategoryName" class="blog__category px-2 py-1 rounded"></span> <a href="#" class="block font-medium text-xl mt-3" runat="server" id="ProductName"></a> </div>
            </div>
            <div class="p-5 text-gray-700" runat="server" id="ProductDesc"></div>
           
            <div class="px-5 pt-3 pb-5 border-t border-gray-200">
                <div class="w-full flex text-gray-600 text-xs sm:text-sm">
                    <div class="mr-2">Stock: <span class="font-medium" runat="server" id="Quantity"></span> </div>
                    <div class="mr-2">Unit Price: <span class="font-medium" runat="server" id="Price"></span> </div>
                    <div class="ml-auto">
                    <asp:Button ID="btnEdit" CssClass="button w-24 bg-theme-1 text-white"  runat="server" Text="Edit" OnClick="btnEdit_Click"/>
                    <asp:Button ID="btnDelete" CssClass="button w-24 bg-red-600 text-white"  runat="server" Text="Delete" OnClick="btnDelete_Click" />
                        </div>
                </div>
                <div class="w-full flex items-center mt-3">
                   
                    <div class="flex-1 relative text-gray-700">
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
        </form>
</asp:Content>
