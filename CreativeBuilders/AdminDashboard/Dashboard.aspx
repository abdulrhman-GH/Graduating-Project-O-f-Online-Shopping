<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard/admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="CreativeBuilders.AdminDashboard.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" type="text/javascript"></script>
    <script>
        $(window).on('load', function () {
            if (getCookie('status') == "add") {
                toastr.success('Profile Updated Successfully', 'Success')
            }
        });
        function getCookie(cookieName) {
            var cookieValue = document.cookie;
            var cookieStart = cookieValue.indexOf(" " + cookieName + "=");
            if (cookieStart == -1) {
                cookieStart = cookieValue.indexOf("=");
            }
            if (cookieStart == -1) {
                cookieValue = null;
            }
            else {
                cookieStart = cookieValue.indexOf("=", cookieStart) + 1;
                var cookieEnd = cookieValue.indexOf(";", cookieStart);
                if (cookieEnd == -1) {
                    cookieEnd = cookieValue.length;
                }
                cookieValue = unescape(cookieValue.substring(cookieStart, cookieEnd));
            }
            return cookieValue;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">
    <div class="grid grid-cols-12 gap-6">
                <div class="col-span-12 xxl:col-span-9 grid grid-cols-12 gap-6">
            <!-- BEGIN: General Report -->
                     <div class="col-span-12 mt-8">
                        <div class="intro-y flex items-center h-10">
                            <h2 class="text-lg font-medium truncate mr-5">General Report
                            </h2>
                            <a href="Dashboard.aspx" class="ml-auto flex text-theme-1"><i data-feather="refresh-ccw" class="w-4 h-4 mr-3"></i>Reload Data </a>
                        </div>
                        <div class="grid grid-cols-12 gap-6 mt-5">
                            <div class="col-span-12 sm:col-span-6 xl:col-span-3 intro-y">
                                <div class="report-box zoom-in">
                                    <div class="box p-5">
                                        <div class="flex">
                                            <i data-feather="shopping-cart" class="report-box__icon text-theme-10"></i>
                                            <div class="ml-auto">
                                                <div class="report-box__indicator bg-theme-9 tooltip cursor-pointer" title="33% Higher than last month">33% <i data-feather="chevron-up" class="w-4 h-4"></i></div>
                                            </div>
                                        </div>
                                        <div class="text-3xl font-bold leading-8 mt-6">4.510</div>
                                        <div class="text-base text-gray-600 mt-1">Orders</div>
                                    </div>
                                </div>
                            </div>
                           
                            <div class="col-span-12 sm:col-span-6 xl:col-span-3 intro-y">
                                <a href="Categories.aspx">
                                <div class="report-box zoom-in">
                                    <div class="box p-5">
                                        <div class="flex">
                                            <i data-feather="credit-card" class="report-box__icon text-theme-11"></i>
                                            
                                        </div>
                                        <div runat="server" id="CategoriesCount" class="text-3xl font-bold leading-8 mt-6"></div>
                                        <div class="text-base text-gray-600 mt-1">Categories</div>
                                    </div>
                                </div>
                                    </a>
                            </div>
                            <div class="col-span-12 sm:col-span-6 xl:col-span-3 intro-y">
                                <a href="Products.aspx">
                                <div class="report-box zoom-in">
                                    <div class="box p-5">
                                        <div class="flex">
                                            <i data-feather="monitor" class="report-box__icon text-theme-12"></i>
                                           
                                        </div>
                                        <div runat="server" id="ProductsCount" class="text-3xl font-bold leading-8 mt-6"></div>
                                        <div class="text-base text-gray-600 mt-1">Total Products</div>
                                    </div>
                                </div>
                                    </a>
                            </div>
                            <div class="col-span-12 sm:col-span-6 xl:col-span-3 intro-y">
                                <div class="report-box zoom-in">
                                    <div class="box p-5">
                                        <div class="flex">
                                            <i data-feather="user" class="report-box__icon text-theme-9"></i>
                                           
                                        </div>
                                        <div runat="server" id="UsersCount" class="text-3xl font-bold leading-8 mt-6"></div>
                                        <div class="text-base text-gray-600 mt-1">Users</div>
                                    </div>
                                </div>
                            </div>
                             <div class="col-span-12 sm:col-span-6 xl:col-span-3 intro-y">
                                 <a href="Suppliers.aspx">
                                <div class="report-box zoom-in">
                                    <div class="box p-5">
                                        <div class="flex">
                                            <i data-feather="user" class="report-box__icon text-theme-9"></i>
                                        </div>
                                        <div runat="server" id="SuppliersCount" class="text-3xl font-bold leading-8 mt-6"></div>
                                        <div class="text-base text-gray-600 mt-1">Suppliers</div>
                                    </div>
                                </div>
                                     </a>
                            </div>
                        </div>
                    </div>
                    <!-- END: General Report -->
                   
                    
                    
                    
                    </div>
                    </div>

</asp:Content>