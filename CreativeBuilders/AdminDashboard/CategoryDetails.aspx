<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard/admin.Master" AutoEventWireup="true" CodeBehind="CategoryDetails.aspx.cs" Inherits="CreativeBuilders.AdminDashboard.CategoryDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">
    <div class="grid grid-cols-12 gap-6">

        <div class="col-span-12 xxl:col-span-3 xxl:border-l border-theme-5 -mb-10 pb-10">
            <div class="xxl:pl-6 grid grid-cols-12 gap-6">

                <!-- BEGIN: Important Notes -->
                <div class="col-span-12 md:col-span-6 xl:col-span-12 xxl:col-span-12 xl:col-start-1 xl:row-start-1 xxl:col-start-auto xxl:row-start-auto mt-3">
                    <div class="intro-x flex items-center h-10">
                        <h2 class="text-lg font-medium truncate mr-auto">Categpry Details
                        </h2>
                    </div>
                    <form runat="server">
                    <div class="mt-5 intro-x">
                        <div class="box" id="important-notes">
                            <div class="p-5">
                                <div class="text-base font-medium truncate" runat="server" id="CategoryName"></div>
                                <div class="text-gray-600 text-justify mt-1" runat="server" id="CategoryDesc"></div>
                                <div class="font-medium flex mt-5">
                                    <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_ServerClick" CssClass="button button--sm border border-gray-300 text-gray-600 mr-2" Text="Edit" />
                                    <asp:Button ID="btnDelete" runat="server" OnClick="btnDelete_Click" CssClass="button button--sm border border-gray-300 text-gray-600 " Text="Delete" />
                                    <a href="Categories.aspx" class="button button--sm border bg-gray-200 text-gray-600 ml-auto">Back To List</a>
                                </div>
                            </div>
                          
                       </div>     
                        </div>
                        </form>
                    </div>
                </div>
                <!-- END: Important Notes -->

            </div>
        </div>

</asp:Content>
