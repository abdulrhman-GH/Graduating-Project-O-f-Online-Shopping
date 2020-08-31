<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/FrontEnd.Master" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="CreativeBuilders.FrontEnd.Products" %>

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
            debugger;
            if ($.urlParam('cart') == "true") {
                toastr.success('Product Added to cart Successfully', 'Success')
            }
        });
        function GetSessionValues(id) {
            var status = '<%=Session["LoginStatus"] %>';
            if (status)
                window.location.href = "Products.aspx?id=" + id + "&cart=true";
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
    </script>
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
                                <li>Products</li>
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

    <!--======================
    Shop Fullwidth area Start
    ==========================-->
    <div class="shop-fullwidth-area mt-50">
        <div class="container">
            <div class="row">
                <asp:Repeater ID="rptProducts" runat="server">
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
                                            <a href='#' onclick='GetSessionValues(<%# Eval("id") %>)' title="Add to cart"><i class="zmdi zmdi-shopping-cart-plus zmdi-hc-fw"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- Single-Product-End -->
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <div style="overflow: hidden;">
                <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                    <HeaderTemplate>
                        <div class="d-flex justify-content-center">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="btnPage"
                            Style="padding: 8px; margin: 2px; background: #408ed4; border: solid 1px #666; font: 8pt tahoma; border-radius: 5px"
                            CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                            runat="server" ForeColor="White" Font-Bold="True"><%# Container.DataItem %>
                        </asp:LinkButton>
                    </ItemTemplate>
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
            </div>




        </div>
    </div>
    <!--======================
    Shop Fullwidth area End
    ==========================-->
</asp:Content>
