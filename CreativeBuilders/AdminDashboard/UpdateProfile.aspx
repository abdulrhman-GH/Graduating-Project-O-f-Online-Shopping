<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard/admin.Master" AutoEventWireup="true" CodeBehind="UpdateProfile.aspx.cs" Inherits="CreativeBuilders.AdminDashboard.UpdateProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <script>
         function readURL(input) {
             debugger;
             if (input.files && input.files[0]) {
                 var reader = new FileReader();

                 reader.onload = function (e) {
                     $('#UserAvatar').attr('src', e.target.result);
                 }

                 reader.readAsDataURL(input.files[0]);
             }
         }
     
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderMainContent" runat="server">
    <form runat="server">
    <div class="intro-y flex items-center mt-8">
        <h2 class="text-lg font-medium mr-auto">Update Profile
                    </h2>
    </div>
    <div class="grid grid-cols-12 gap-6">

        <div class="col-span-12 lg:col-span-8 xxl:col-span-9">
            <!-- BEGIN: Display Information -->
            <div class="intro-y box lg:mt-5">
                <div class="flex items-center p-5 border-b border-gray-200">
                    <h2 class="font-medium text-base mr-auto">Display Information
                                </h2>
                </div>
                <div class="p-5">
                    <div class="grid grid-cols-12 gap-5">
                        <div class="col-span-12 xl:col-span-4">
                            <div class="border border-gray-200 rounded-md p-5">
                                <div class="w-40 h-40 relative image-fit cursor-pointer zoom-in mx-auto">
                                    <img class="rounded-md" runat="server" id="UserAvatar" src="#" />
                                    <div title="Remove this profile photo?" class="tooltip w-5 h-5 flex items-center justify-center absolute rounded-full text-white bg-theme-6 right-0 top-0 -mr-2 -mt-2"><i data-feather="x" class="w-4 h-4"></i></div>
                                </div>
                                <div class="w-40 mx-auto cursor-pointer relative mt-5">
                                    <button type="button" class="button w-full bg-theme-1 text-white">Change Photo</button>
                                    <input type="file" accept='image/*' onchange="readURL(this.value)" runat="server" id="FileUploadImage" class="w-full h-full top-0 left-0 absolute opacity-0">
                                </div>
                            </div>
                        </div>
                        <div class="col-span-12 xl:col-span-8">
                            <div>
                                <label>Display Name</label>
                                <input type="text" runat="server" id="txtName" class="input w-full border mt-2" required>
                            </div>
                            <div>
                                <label>Email</label>
                                <input type="text" runat="server" id="txtEmail" class="input w-full border mt-2" required>
                            </div>
                            <div>
                                <label>Phone Number</label>
                                <input type="text" runat="server" id="txtPhoneNumber" class="input w-full border mt-2">
                            </div>
                            <div class="mt-3">
                                <label>Gender</label>
                                <div class="mt-2">
                                    <select class="select2 w-full" runat="server" id="drpGender">
                                        <option value="M">Male</option>
                                        <option value="F">Female</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mt-3">
                                <label>Full Address</label>
                                <input type="text" runat="server" id="txtAddress" class="input w-full border mt-2" >
                            </div>
                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="button w-20 bg-theme-1 text-white mt-3" />
                        </div>
                    </div>
                </div>
            </div>
            <!-- END: Display Information -->
            <!-- BEGIN: Personal Information -->
              <%--            <div class="intro-y box lg:mt-5">
                <div class="flex items-center p-5 border-b border-gray-200">
                    <h2 class="font-medium text-base mr-auto">Personal Information
                                </h2>
                </div>
                <div class="p-5">
                    <div class="grid grid-cols-12 gap-5">
                        <div class="col-span-12 xl:col-span-6">
                            <div>
                                <label>Email</label>
                                <input type="text" class="input w-full border bg-gray-100 cursor-not-allowed mt-2" placeholder="Input text" value="brucewillis@left4code.com" disabled>
                            </div>
                            <div class="mt-3">
                                <label>Name</label>
                                <input type="text" class="input w-full border mt-2" placeholder="Input text" value="Bruce Willis" disabled>
                            </div>
                            <div class="mt-3">
                                <label>ID Type</label>
                                <select class="input w-full border mt-2">
                                    <option>IC</option>
                                    <option>FIN</option>
                                    <option>Passport</option>
                                </select>
                            </div>
                            <div class="mt-3">
                                <label>ID Number</label>
                                <input type="text" class="input w-full border mt-2" placeholder="Input text" value="357821204950001">
                            </div>
                        </div>
                        <div class="col-span-12 xl:col-span-6">
                            <div>
                                <label>Phone Number</label>
                                <input type="text" class="input w-full border mt-2" placeholder="Input text" value="65570828">
                            </div>
                            <div class="mt-3">
                                <label>Address</label>
                                <input type="text" class="input w-full border mt-2" placeholder="Input text" value="10 Anson Road, International Plaza, #10-11, 079903 Singapore, Singapore">
                            </div>
                            <div class="mt-3">
                                <label>Bank Name</label>
                                <div class="mt-2">
                                    <select class="select2 w-full">
                                        <option value="1">SBI - STATE BANK OF INDIA</option>
                                        <option value="1">CITI BANK - CITI BANK</option>
                                    </select>
                                </div>
                            </div>
                            <div class="mt-3">
                                <label>Bank Account</label>
                                <input type="text" class="input w-full border mt-2" placeholder="Input text" value="DBS Current 011-903573-0">
                            </div>
                        </div>
                    </div>
                    <div class="flex justify-end mt-4">
                        <a href="#" class="text-theme-6 flex items-center"><i data-feather="trash-2" class="w-4 h-4 mr-1"></i>Delete Account </a>
                        <button type="button" class="button w-20 bg-theme-1 text-white ml-auto">Save</button>
                    </div>
                </div>
            </div>--%>
            <!-- END: Personal Information -->
        </div>
    </div>
        </form>
</asp:Content>
