<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard/admin.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="CreativeBuilders.AdminDashboard.Products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js" defer></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" type="text/javascript"></script>
    <script>
       
        $(window).on('load', function () {
            $('#tblPrds').DataTable();
            if (getCookie('status') == "add") {
                toastr.success('Product Added Successfully', 'Success')
            }
            else if (getCookie('status') == "delete") {
                toastr.error('Product Deleted Successfully', 'Deleted')
            }
            else if (getCookie('status') == "update") {
                toastr.warning('Product Updated Successfully', 'Update')
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
    <style>
        table.dataTable thead th {
            border-bottom: none !important;
        }

        table.dataTable.no-footer {
            border-bottom: none !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">
    <div class="col-span-12 mt-6">
        <div class="intro-y block sm:flex items-center h-10 mb-2">
            <h2 class="text-lg font-medium truncate mr-5">Products
            </h2>
            <div class="flex items-center sm:ml-auto mt-3 sm:mt-0">
                <a href="AddProduct.aspx" class="button box flex items-center text-gray-700"><i data-feather="plus" class="w-4 h-4 mr-1"></i>Add New Product</a>
            </div>
        </div>
        <div class="intro-y overflow-auto lg:overflow-visible mt-8 sm:mt-0">
            <table class="table table-report sm:mt-2" id="tblPrds">
                <thead>
                    <tr>
                        <th class="whitespace-no-wrap">PRODUCT NAME</th>
                        <th class="text-center whitespace-no-wrap">UNIT PRICE</th>
                        <th class="text-center whitespace-no-wrap">STOCK</th>
                        <th class="text-center whitespace-no-wrap">ACTIONS</th>
                    </tr>
                </thead>
                <tbody runat="server" id="ProductTable">
                    <%--                    <tr class="intro-x">
                        <td class="w-40">
                            <div class="flex">
                                <div class="w-10 h-10 image-fit zoom-in">
                                    <img alt="" class="tooltip rounded-full" src="dist/images/preview-9.jpg" title="Product Image">
                                </div>

                            </div>
                        </td>
                        <td>
                            <a href="#" class="font-medium whitespace-no-wrap">Nike Tanjun</a>
                        </td>
                        <td class="font-medium whitespace-no-wrap w-40 text-center">187</td>
                        <td class="font-medium whitespace-no-wrap w-40 text-center">187</td>

                        <td class="table-report__action w-56">
                            <div class="flex justify-center items-center">
                                <a class="flex items-center mr-3" href="#"><i data-feather="check-square" class="w-4 h-4 mr-1"></i>Edit </a>
                                <a class="flex items-center text-theme-6" href="#"><i data-feather="trash-2" class="w-4 h-4 mr-1"></i>Delete </a>
                            </div>
                        </td>
                    </tr>--%>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
