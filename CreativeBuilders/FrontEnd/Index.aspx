<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/FrontEnd.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CreativeBuilders.FrontEnd.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/8.11.8/sweetalert2.all.min.js" integrity="sha256-2RS1U6UNZdLS0Bc9z2vsvV4yLIbJNKxyA4mrx5uossk=" crossorigin="anonymous"></script>
    <script>
        $(window).on('load', function () {
            $.urlParam = function (name) {
                var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
                if (results == null) {
                    return null;
                }
                return decodeURI(results[1]) || 0;
            }
            if ($.urlParam('cart') == "true") {
                toastr.success('Product Added to cart Successfully', 'Success')
            }
            if (getCookie('status') == "update") {
                toastr.success('Profile Data Updated Successfully', 'Update')
            }
        });
            function GetSessionValues(id) {
            var status = '<%=Session["LoginStatus"] %>';
            if (status)
                window.location.href = "Index.aspx?id=" + id + "&cart=true";
            else {
            Swal.fire({
                title: 'Please Login To be able to Add to cart',
                showClass: {
                    popup: 'animate__animated animate__fadeInDown'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOutUp'
                }
            })
        }
        }
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--=====================
    slider area start test
    =========================-->
    <div class="slider_section mb-60">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                </div>
                <div class="col-lg-9">
                    <div class="slider_area slider-one mt-30">
                        <!-- Single Slider Start -->
                        <div class="single_slider">
                            <img src="assets/images/slider/slider1.png" alt="" class="img-fluid" />
                            <div class="slider_content color_one">
                                <h5>The Hottest
                                    <br />
                                    Trend</h5>
                                <h2>All
                                    <br>
                                    Construction</h2>
                                <div class="pt-des">
                                    <p><span></span>Materials<span> Are Available Here</span></p>
                                </div>
                                <a href="Products.aspx">Shop Now</a>
                            </div>
                        </div>
                        <!-- Single Slider End -->
                        <!-- Single Slider Start -->
                        <div class="single_slider">
                            <img src="assets/images/slider/slider2.png" alt="" class="img-fluid">
                            <div class="slider_content color_two">
                                <h5>The Hottest
                                    <br>
                                    Trend</h5>
                                <h2>Shop 
                                    <br>
                                    Creative 
                                    <br />
                                    Builders
                                </h2>
                                <div class="pt-des">
                                    <p><span></span><span>Products</span></p>
                                </div>
                                <a href="Products.aspx">Shop Now</a>
                            </div>
                        </div>
                        <!-- Single Slider End -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--======================
     slider area End
    ==========================-->


    <!--======================
    Shipping area Start
    ==========================-->
    <div class="shipping-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-9">
                    <div class="row all-shipping">
                        <div class="col-lg-4 col-md-4 col-12">
                            <div class="single-shipping">
                                <div class="block-wrapper">
                                    <div class="shipping-content">
                                        <h5 class="ship-title">Free Delivery</h5>
                                        <p>Free shipping on all order</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-12">
                            <div class="single-shipping">
                                <div class="block-wrapper2">
                                    <div class="shipping-content">
                                        <h5 class="ship-title">Online Support 24/7</h5>
                                        <p>Free shipping on all order</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4 col-12">
                            <div class="single-shipping single-shipping-last">
                                <div class="block-wrapper3">
                                    <div class="shipping-content">
                                        <h5 class="ship-title">Money Return</h5>
                                        <p>Free shipping on all order</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--======================
    Shipping area End
    ==========================-->
    <!-- Product slide home 2 start -->


    <div class="shop-fullwidth-area mt-50">
        <div class="container">
            <div class="row">
                <div class="col-lg-2"></div>
                <div class="col-lg-9">
                    <div class="block-title">
                        <h6>Latest Products</h6>
                    </div>
                    <!-- Shop Wrapper Start -->
                    <div class="row shop-wrapper grid_4">
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                            <ItemTemplate>
                                <div class="col-md-3 col-sm-3 col-xm-6 mb-20">
                                    <!-- Single-Product-Start -->
                                    <div class="item-product pt-0">
                                        <div class="product-thumb">
                                            <a href="product-details.html">
                                                <img src="../AdminDashboard/dist/images/products/<%# Eval("Image") %>" alt="" class="img-fluid" style="height: 80px;" />
                                            </a>

                                            <div class="action-link">
                                                <a class="quick-view same-link" href="Product-Details.aspx?id=<%# Eval("Id") %>" title="Quick view"><i class="zmdi zmdi-eye zmdi-hc-fw"></i></a>
                                            </div>
                                        </div>
                                        <div class="product-caption">
                                            <div class="product-name">
                                                <a href="product-details.html"><%# Eval("Name") %></a>
                                            </div>

                                            <div class="price-box">
                                                <span class="regular-price"><%# Eval("Price") %></span>
                                            </div>
                                            <div class="cart">
                                                <div class="add-to-cart">
                                                    <a href="#" onclick='GetSessionValues(<%# Eval("id") %>)' title="Add to cart"><i class="zmdi zmdi-shopping-cart-plus zmdi-hc-fw"></i></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Single-Product-End -->
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:constr %>"
                        SelectCommandType="StoredProcedure" SelectCommand="getTop12Products"></asp:SqlDataSource>
                    <!-- Shop Wrapper End -->
                </div>
            </div>
            <div class="row">
                <a href="Products.aspx" class="btn btn-primary mx-auto">Show More...</a>
            </div>
        </div>
    </div>

</asp:Content>
