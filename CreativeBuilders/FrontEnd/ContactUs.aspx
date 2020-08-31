<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/FrontEnd.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="CreativeBuilders.FrontEnd.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--=====================
Breadcrumb Aera Start
=========================-->
    <div style="padding-top: 10px;">
        <div class="breadcrumbs_area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li>
                                    <h1><a href="Index.aspx">Home</a></h1>
                                </li>
                                <li>Contact Us</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--=====================
    Breadcrumb Aera End
    =========================-->



    <!--=====================
Contact Aera Start
=========================-->
    <div class="contact-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 mt-40">
                    <div class="contact-address">
                        <div class="address-title">
                            <h3 class="last-title mb-20">Contact Us</h3>
                        </div>
                        <div class="contact-message">
                            <p>Claritas est etiam processus dynamicus, qui sequitur mutationem consuetudium lectorum. Mirum est notare quam littera gothica, quam nunc putamus parum claram anteposuerit litterarum formas human. qui sequitur mutationem consuetudium lectorum. Mirum est notare quam</p>
                            <ul>
                                <li><i class="fa fa-fax"></i>Address : No 40 Baria Sreet 133/2 NewYork City</li>
                                <li><i class="fa fa-phone"></i><a href="#">Info@example.com</a></li>
                                <li><i class="fa fa-envelope-o"></i><a href="#">(800) 123 456 789</a> </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 contact-margin mb-20">
                    <div class="contact-information">
                        <form class="form-row" action="https://demo.hasthemes.com/circleshop-preview/circleshop/assets/php/contact-mail.php" id="contact-form" method="post">
                            <div class="information-title">
                                <h3 class="last-title mb-20">Tell us your Project</h3>
                            </div>
                            <div class="form_group col-12">
                                <label class="form-label">Name <span>*</span></label>
                                <input class="input-form" type="text" placeholder="Your Name" name="name">
                            </div>
                            <div class="form_group col-12">
                                <label class="form-label">Email<span>*</span></label>
                                <input class="input-form" type="email" placeholder="Email" name="email">
                            </div>
                            <div class="form_group mb-0 col-12">
                                <label class="form-label" for="order-note">Your Message <span>*</span></label>
                                <textarea class="form-textarea" id="order-note" name="message"></textarea>
                            </div>
                            <div class="form_group mt-20 mb-0 col-12">
                                <button type="submit" class="btn-secondary">Submit</button>
                            </div>
                        </form>
                        <p class="form-message"></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--=====================
Contact Aera End
=========================-->
</asp:Content>
