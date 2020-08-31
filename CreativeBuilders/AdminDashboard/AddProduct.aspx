<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard/admin.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="CreativeBuilders.AdminDashboard.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        var loadFile = function (event) {
            var image = document.getElementById('imgTag');
            image.src = URL.createObjectURL(event.target.files[0]);
            
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">
    <form runat="server">
        <div class="intro-y flex items-center mt-8">
            <h2 class="text-lg font-medium mr-auto" runat="server" id="lbltitle">Add New Product
            </h2>
        </div>
        <div class="grid grid-cols-12 gap-6 mt-5">
            <div class="intro-y col-span-12 lg:col-span-8">
                <!-- BEGIN: Form Layout -->
                <div class="intro-y box p-5">
                    <div>
                        <label>Product Name</label>
                        <input runat="server" id="txtProductName" type="text" class="input w-full border mt-2" placeholder="Input Name" required>
                    </div>
                    <div class="mt-3">
                        <label>Category</label>
                        <div class="mt-2">
                            <asp:DropDownList ID="drpCategories" runat="server" CssClass="select2 w-full"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="mt-3">
                        <label>ٍSupplier</label>
                        <div class="mt-2">
                            <asp:DropDownList ID="drpSuppliers" runat="server" CssClass="select2 w-full"></asp:DropDownList>
                        </div>
                    </div>
                    <div class="mt-3">
                        <label>Quantity</label>
                        <div class="relative mt-2">
                            <input type="number" runat="server" id="txtQty" class="input pr-12 w-full border col-span-4" placeholder="Qty" required>
                            <div class="absolute top-0 right-0 rounded-r w-10 h-full flex items-center justify-center bg-gray-100 border text-gray-600">pcs</div>
                        </div>
                    </div>

                    <div class="mt-3">
                        <label>Price</label>
                        <div class="sm:grid grid-cols-3 gap-2">
                            <div class="relative mt-2">
                                <div class="absolute top-0 left-0 rounded-l w-12 h-full flex items-center justify-center bg-gray-100 border text-gray-600">Unit</div>
                                <div class="pl-3">
                                    <input type="number" min="1" step="any" runat="server" id="txtPrice" class="input pl-12 w-full border col-span-4" placeholder="Price" required>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="mt-3">
                        <label>Description</label>
                        <div class="mt-2">
                            <textarea runat="server" id="txtProductDesc" placeholder="Enter Description here..." class="input w-full border mt-2" data-feature="basic" name="editor"></textarea>
                        </div>
                    </div>
                    <div class="mt-3">
                        <label>Product Image</label>
                        <div class="mt-2">
                            <input name="file" accept='image/*' runat="server" id="txtFileUpload" type="file" onchange="loadFile(event)" class="input w-full border mt-2" required />
                        </div>
                    </div>
                    <div class="mt-3">
                        <div class="h-40 xxl:h-56">
                            <img id="imgTag" runat="server" alt="Image Show here..." class="rounded-md" src="#" style="max-width: 100%; max-height: 100%;" />
                        </div>
                    </div>

                    <div class="text-right mt-5">
                        <asp:Button ID="btnSave" CssClass="button w-24 bg-theme-1 text-white" OnClick="btnSave_Click" runat="server" Text="Save" />
                        <a href="Products.aspx" class="button w-24 border text-gray-700 mr-1">Back To List</a>
                    </div>
                </div>
                <!-- END: Form Layout -->
            </div>
        </div>
    </form>
</asp:Content>
