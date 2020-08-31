<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard/admin.Master" AutoEventWireup="true" CodeBehind="Suppliers.aspx.cs" Inherits="CreativeBuilders.AdminDashboard.Suppliers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.9/js/jquery.dataTables.min.js" defer></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" type="text/javascript"></script>
    <script>
       
        $(window).on('load', function () {
            $('#tblSupps').DataTable();
            if (getCookie('status') == "add") {
                toastr.success('Supplier Added Successfully', 'Success')
            }
            else if (getCookie('status') == "delete") {
                toastr.error('Supplier Deleted Successfully', 'Deleted')
            }
            else if (getCookie('status') == "update") {
                toastr.warning('Supplier Updated Successfully', 'Update')
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
    <form runat="server">
        <div class="col-span-12 mt-6">
            <div class="intro-y block sm:flex items-center h-10 mb-2">
                <h2 class="text-lg font-medium truncate mr-5">Suppliers
                </h2>
                <div class="flex items-center sm:ml-auto mt-3 sm:mt-0">
                    <a href="AddSupplier.aspx" class="button box flex items-center text-gray-700"><i data-feather="plus" class="w-4 h-4 mr-1"></i>Add New Supplier</a>
                </div>
            </div>
            <div class="intro-y overflow-auto lg:overflow-visible mt-8 sm:mt-0">
                <table class="table table-report sm:mt-2" id="tblSupps">
                    <thead>
                        <tr>
                            <th class="whitespace-no-wrap">FOUNDATION NAME</th>
                            <th class="text-center whitespace-no-wrap">EMAIL</th>
                            <th class="text-center whitespace-no-wrap">COMMERCIAL ID</th>
                            <th class="text-center whitespace-no-wrap">LOCATION</th>
                            <th class="text-center whitespace-no-wrap">ACTIONS</th>
                        </tr>
                    </thead>
                    <tbody runat="server" id="SupplierTable">
                       
                    </tbody>
                </table>
            </div>
        </div>
    </form>
</asp:Content>
