<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard/admin.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="CreativeBuilders.AdminDashboard.OrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">
     <div class="intro-y flex flex-col sm:flex-row items-center mt-8">
                    <h2 class="text-lg font-medium mr-auto">
                        Order Details
                    </h2>
                    <div class="w-full sm:w-auto flex mt-4 sm:mt-0">
                        <a href="Orders.aspx" class="button text-white bg-theme-1 shadow-md mr-2">Back To List</a>
                        
                    </div>
                </div>
                <!-- BEGIN: Invoice -->
                <div class="intro-y box overflow-hidden mt-5">
                    <div class="border-b border-gray-200 text-center sm:text-left">
                        <div class="px-5 py-10 sm:px-20 sm:py-20">
                            <div class="text-theme-1 font-semibold text-3xl">Order</div>
                            <div class="mt-2"> No <span class="font-medium" runat="server" id="OrderId"></span> </div>
                            <div class="mt-1" runat="server" id="OrderDate"></div>
                        </div>
                        <div class="flex flex-col lg:flex-row px-5 sm:px-20 pt-10 pb-10 sm:pb-20">
                            <div class="">
                                <div class="text-base text-gray-600">Client Details</div>
                                <div class="text-lg font-medium text-theme-1 mt-2" runat="server" id="CustName"></div>
                                <div class="mt-1" runat="server" id="CustEmail"></div>
                            </div>
                            <div class="lg:text-right mt-10 lg:mt-0 lg:ml-auto">
                                <div class="text-base text-gray-600">Payment to</div>
                                <div class="text-lg font-medium text-theme-1 mt-2">Creative Builders</div>
                                <div class="mt-1">creativeBuilders159@gmail.com</div>
                            </div>
                        </div>
                    </div>
                    <div class="px-5 sm:px-16 py-10 sm:py-20">
                        <div class="overflow-x-auto">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th class="border-b-2 whitespace-no-wrap">Product Name</th>
                                        <th class="border-b-2 text-right whitespace-no-wrap">QTY</th>
                                        <th class="border-b-2 text-right whitespace-no-wrap">PRICE</th>
                                        <th class="border-b-2 text-right whitespace-no-wrap">SUBTOTAL</th>
                                    </tr>
                                </thead>
                                <tbody runat="server" id="OrderItems">
                                   <%-- <tr>
                                        <td class="border-b">
                                            <div class="font-medium whitespace-no-wrap">Midone HTML Admin Template</div>
                                            <div class="text-gray-600 text-xs whitespace-no-wrap">Regular License</div>
                                        </td>
                                        <td class="text-right border-b w-32">2</td>
                                        <td class="text-right border-b w-32">$25</td>
                                        <td class="text-right border-b w-32 font-medium">$50</td>
                                    </tr>--%>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="px-5 sm:px-20 pb-10 sm:pb-20 flex flex-col-reverse sm:flex-row">
                       
                        <div class="text-center sm:text-right sm:ml-auto">
                            <div class="text-base text-gray-600">Total Amount</div>
                            <div class="text-xl text-theme-1 font-medium mt-2" runat="server" id="TotalPrice"></div>
                            <div class="mt-1 tetx-xs">Taxes included</div>
                        </div>
                    </div>
                </div>
                <!-- END: Invoice -->
</asp:Content>
