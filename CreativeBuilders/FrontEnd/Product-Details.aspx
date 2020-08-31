<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/FrontEnd.Master" AutoEventWireup="true" CodeBehind="Product-Details.aspx.cs" Inherits="CreativeBuilders.FrontEnd.Product_Details" %>

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
                                <li>
                                    <h1><a href="Products.aspx">Products</a></h1>
                                </li>
                                <li>Product Details</li>
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

    <!-- ========================
    Product Details Area Start 
    ===========================-->
    <div class="product-area product-details-section">
        <div class="container">
            <div class="row">
                <div class="col-lg-5 col-12 mt-50">
                    <!-- Product Zoom Image start -->
                    <div class="product-slider-container arrow-center text-center">

                        <div class="product-item">
                            <a href="assets/images/product/product-details/product-details-1.jpg">
                                <img src="#" runat="server" id="ProductImg" class="img-fluid" alt="" /></a>
                        </div>
                    </div>


                    <!-- Product Zoom Image End -->
                    <!-- Product Thumb Zoom Image Start -->

                </div>
                <div class="col-lg-7 col-12 mt-45">
                    <!-- Product Summery Start -->
                    <div class="product-summery position-relative">
                        <div class="product-head">
                            <h1 class="product-title" runat="server" id="ProductName"></h1>

                        </div>
                        <div class="rating">
                            <span class="yellow" runat="server" id="CategoryName"></span>

                        </div>
                        <div class="price-box">
                            <span class="regular-price" runat="server" id="Price"></span>
                        </div>
                        <div class="product-description">
                            <p runat="server" id="ProductDesc"></p>
                        </div>
                        <div class="product-packeges">
                            <table>
                                <tbody>

                                    <tr>
                                        <td class="label"><span>Quantity</span></td>
                                        <td class="value">
                                            <div class="product-quantity">
                                                <span class="qty-btn minus"><i class="fa fa-angle-down"></i></span>
                                                <input type="number" class="input-qty" value="1" runat="server" id="Quantity"/>
                                                <span class="qty-btn plus"><i class="fa fa-angle-up"></i></span>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="product-buttons grid_list">
                            <div class="action-link">
                                <asp:Button ID="btnAdd" runat="server" Text="Add To Cart" CssClass="btn-secondary" OnClick="btnAdd_Click"/>
                            </div>
                        </div>

                    </div>
                    <!-- Product Summery End -->
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="product-details-home2 mt-45 mb-15">
                        <div class="block-title">
                            <h6>Related Products</h6>
                        </div>
                        <div class="shop-fullwidth-area mt-50">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-2"></div>
                                    <div class="col-lg-9">

                                        <!-- Shop Wrapper Start -->
                                        <div class="row shop-wrapper grid_4">
                                            <asp:Repeater ID="RelatedProductsRepeater" runat="server" >
                                                <ItemTemplate>
                                                    <div class="col-md-3 col-sm-3 col-xm-6 mb-20">
                                                        <!-- Single-Product-Start -->
                                                        <div class="item-product pt-0">
                                                            <div class="product-thumb">
                                                                <a href="product-details.html">
                                                                    <img src="../AdminDashboard/dist/images/products/<%# Eval("Image") %>" alt="" class="img-fluid" />
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
                                                                        <a href="shopping-cart.html" title="Add to cart"><i class="zmdi zmdi-shopping-cart-plus zmdi-hc-fw"></i></a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- Single-Product-End -->
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>

                                        </div>
                                        <!-- Shop Wrapper End -->
                                         
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ========================
    Product Details Area End 
    ===========================-->
</asp:Content>
