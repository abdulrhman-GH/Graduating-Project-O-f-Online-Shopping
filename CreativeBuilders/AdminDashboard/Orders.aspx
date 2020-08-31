<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard/admin.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="CreativeBuilders.AdminDashboard.Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">
    <h2 class="intro-y text-lg font-medium mt-10">Orders List 
                </h2>
    <div class="grid grid-cols-12 gap-6 mt-5">
        <div class="intro-y col-span-12 flex flex-wrap sm:flex-no-wrap items-center mt-2">
            <div class="hidden md:block mx-auto text-gray-600">Showing 1 to 10 of 150 entries</div>
            <div class="w-full sm:w-auto mt-3 sm:mt-0 sm:ml-auto md:ml-0">
                <div class="w-56 relative text-gray-700">
                    <input type="text" class="input w-56 box pr-10 placeholder-theme-13" placeholder="Search...">
                    <i class="w-4 h-4 absolute my-auto inset-y-0 mr-3 right-0" data-feather="search"></i>
                </div>
            </div>
        </div>
        <!-- BEGIN: Data List -->
        <div class="intro-y col-span-12 overflow-auto lg:overflow-visible">
            <table class="table table-report -mt-2">
                <thead>
                    <tr>
                        <th class="whitespace-no-wrap">Order Number</th>
                        <th class=" whitespace-no-wrap">Customer Name</th>
                        <th class=" whitespace-no-wrap">Total Price</th>
                        <th class="text-center whitespace-no-wrap">ACTIONS</th>
                    </tr>
                </thead>
                <tbody>
                    <tr class="intro-x">


                        <td >107</td>
                        <td>
                            <a href="#" class="font-medium whitespace-no-wrap">Dell XPS 13</a>
                        </td>
                        <td class="w-40">
                            <div class="text-gray-600 text-xs whitespace-no-wrap">PC &amp; Laptop</div>
                        </td>
                        <td class="table-report__action w-56">
                            <div class="flex justify-center items-center">
                                <a class="flex items-center mr-3" href="javascript:;"><i data-feather="eye" class="w-4 h-4 mr-1"></i>Details </a>
                                <a class="flex items-center text-theme-6" href="javascript:;" data-toggle="modal" data-target="#delete-confirmation-modal"><i data-feather="trash-2" class="w-4 h-4 mr-1"></i>Delete </a>
                            </div>
                        </td>
                    </tr>
                    <tr class="intro-x">


                        <td >107</td>
                        <td>
                            <a href="#" class="font-medium whitespace-no-wrap">Dell XPS 13</a>
                        </td>
                        <td class="w-40">
                            <div class="text-gray-600 text-xs whitespace-no-wrap">PC &amp; Laptop</div>
                        </td>
                        <td class="table-report__action w-56">
                            <div class="flex justify-center items-center">
                                <a class="flex items-center mr-3" href="javascript:;"><i data-feather="eye" class="w-4 h-4 mr-1"></i>Details </a>
                                <a class="flex items-center text-theme-6" href="javascript:;" data-toggle="modal" data-target="#delete-confirmation-modal"><i data-feather="trash-2" class="w-4 h-4 mr-1"></i>Delete </a>
                            </div>
                        </td>
                    </tr>

                    <tr class="intro-x">


                        <td >107</td>
                        <td>
                            <a href="#" class="font-medium whitespace-no-wrap">Dell XPS 13</a>
                        </td>
                        <td class="w-40">
                            <div class="text-gray-600 text-xs whitespace-no-wrap">PC &amp; Laptop</div>
                        </td>
                        <td class="table-report__action w-56">
                            <div class="flex justify-center items-center">
                                <a class="flex items-center mr-3" href="javascript:;"><i data-feather="eye" class="w-4 h-4 mr-1"></i>Details </a>
                                <a class="flex items-center text-theme-6" href="javascript:;" data-toggle="modal" data-target="#delete-confirmation-modal"><i data-feather="trash-2" class="w-4 h-4 mr-1"></i>Delete </a>
                            </div>
                        </td>
                    </tr>
                    <tr class="intro-x">


                        <td >107</td>
                        <td>
                            <a href="#" class="font-medium whitespace-no-wrap">Dell XPS 13</a>
                        </td>
                        <td class="w-40">
                            <div class="text-gray-600 text-xs whitespace-no-wrap">PC &amp; Laptop</div>
                        </td>
                        <td class="table-report__action w-56">
                            <div class="flex justify-center items-center">
                                <a class="flex items-center mr-3" href="javascript:;"><i data-feather="eye" class="w-4 h-4 mr-1"></i>Details </a>
                                <a class="flex items-center text-theme-6" href="javascript:;" data-toggle="modal" data-target="#delete-confirmation-modal"><i data-feather="trash-2" class="w-4 h-4 mr-1"></i>Delete </a>
                            </div>
                        </td>
                    </tr>

                </tbody>
            </table>
        </div>
        <!-- END: Data List -->
        <!-- BEGIN: Pagination -->
        <div class="intro-y col-span-12 flex flex-wrap sm:flex-row sm:flex-no-wrap items-center">
            <ul class="pagination">
                <li>
                    <a class="pagination__link" href="#"><i class="w-4 h-4" data-feather="chevrons-left"></i></a>
                </li>
                <li>
                    <a class="pagination__link" href="#"><i class="w-4 h-4" data-feather="chevron-left"></i></a>
                </li>
                <li><a class="pagination__link" href="#">...</a> </li>
                <li><a class="pagination__link" href="#">1</a> </li>
                <li><a class="pagination__link pagination__link--active" href="#">2</a> </li>
                <li><a class="pagination__link" href="#">3</a> </li>
                <li><a class="pagination__link" href="#">...</a> </li>
                <li>
                    <a class="pagination__link" href="#"><i class="w-4 h-4" data-feather="chevron-right"></i></a>
                </li>
                <li>
                    <a class="pagination__link" href="#"><i class="w-4 h-4" data-feather="chevrons-right"></i></a>
                </li>
            </ul>
            <select class="w-20 input box mt-3 sm:mt-0">
                <option>10</option>
                <option>25</option>
                <option>35</option>
                <option>50</option>
            </select>
        </div>
        <!-- END: Pagination -->
    </div>
</asp:Content>
