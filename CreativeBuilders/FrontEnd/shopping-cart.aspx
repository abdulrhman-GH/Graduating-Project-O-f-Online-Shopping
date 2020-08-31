<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEnd/FrontEnd.Master" AutoEventWireup="true" CodeBehind="shopping-cart.aspx.cs" Inherits="CreativeBuilders.FrontEnd.shopping_cart" %>

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
                                <li>Cart</li>
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
    Shopping Cart area Start
    ==========================-->
    <div class="cart-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <form action="#" class="cart-form">
                        <!-- Cart Title Start -->
                        <div class="cart-title">
                            <h5 class="last-title mt-50 mb-20">Shopping Cart</h5>
                        </div>
                        <!-- Cart Title End -->
                        <!-- Cart Table Area Start -->
                        <div class="table-desc">
                            <div class="cart-page table-responsive">
                                <asp:Repeater ID="rptCardItems" runat="server">
                                    <HeaderTemplate>
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th class="product-image">Image</th>
                                                    <th class="product-name">Product</th>
                                                    <th class="product-price">Price</th>
                                                    <th class="product-quantity">Quantity</th>
                                                    <th class="product-total">Total</th>
                                                    <th class="product-remove">Delete</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <td class="product-image"><a href="Product-Details.aspx?id=<%# Eval("Id") %>">
                                                <img src="../AdminDashboard/dist/images/products/<%# Eval("Image") %>" alt="" class="img-thumbnail" style="height: 80px"></a></td>
                                            <td class="product-name"><a href="Product-Details.aspx?id=<%# Eval("Id") %>"><%# Eval("Name") %></a></td>
                                            <td class="product-price" id="#product-price"><%# Eval("Price") %></td>
                                            <td class="product-quantity">
                                                <label>Quantity</label>
                                                <input class="qty" runat="server" id="txtqty" min="1" max='<%# Eval("stock") %>' value='<%# Eval("Quantity") %>' type="number" /></td>
                                            <input id="txtId" runat="server" value='<%# Eval("Id") %>' type="number" hidden />
                                            <asp:TextBox ID="txtqtyhide" CssClass="txtqtyHidden" Text='<%# Eval("Quantity") %>' runat="server" Style="display: none;" ClientIDMode="Static"></asp:TextBox>
                                            <%--<input class="txtqtyHidden" runat="server"  type="number" ClientIDMode="Static"  hidden/>--%>
                                        </td>
                                        <td class="product-total"><%# Eval("TotalPrice") %></td>
                                            <td class="product-remove"><a href='shopping-cart.aspx?id=<%# Eval("Id") %>'><i class="fa fa-trash-o text-danger"></i></a></td>
                                        </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </tbody>
                                         </table>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="cart-submit">
                                <asp:Button ID="btnUpdateCart" runat="server" Text="Update Cart" OnClick="btnUpdateCart_Click" CssClass="btn btn-primary" />
                            </div>
                        </div>
                        <!-- Cart Table Area End -->
                        <!-- Coupon Area Start -->
                        <div class="coupon-area">
                            <div class="row">
                                <div class="col-lg-3 col-md-3">
                                </div>
                                <div class="col-lg-6 col-md-6">
                                    <div class="coupon-code right">
                                        <h3>Cart Totals</h3>
                                        <div class="coupon-inner">
                                            <div class="cart-subtotal">
                                                <p>Subtotal</p>
                                                <p class="cart-amount" runat="server" id="subTotal" clientidmode="Static"></p>
                                            </div>
                                            <div class="cart-subtotal ">
                                                <p>Extra Fees</p>
                                                <p class="cart-amount">
                                                    <span>Taxes:</span>
                                                    <input type="number" min="0" value="0" id="txtTaxes" runat="server" clientidmode="Static" class="mr-auto" />
                                                </p>
                                            </div>

                                            <div class="cart-subtotal">
                                                <p>Total</p>
                                                <p class="cart-amount" runat="server" id="cartTotalPrice" clientidmode="Static"></p>
                                            </div>
                                            <div class="checkout-btn">
                                                <asp:Button ID="btnProceed" runat="server" CssClass="btn btn-primary" Text="Proceed to Checkout" OnClick="btnProceed_Click" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Coupon Area End -->
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!--======================
    Shopping Cart area End
    ==========================-->
    <script>
        const qty = document.querySelectorAll('.qty');
        const txtqtyHidden = document.querySelectorAll('.txtqtyHidden');
        document.onmousedown = click
        for (let i = 0; i < qty.length; i++) {
            //txtqtyHidden[i].value = parseInt(qty[i].value);
            qty[i].addEventListener('change', (event) => {
                qty[i].parentElement.nextElementSibling.innerText = parseInt(qty[i].value) * parseFloat(qty[i].parentElement.previousElementSibling.innerText)
                txtqtyHidden[i].value = parseInt(qty[i].value);
            });
            qty[i].addEventListener('keyup', (event) => {
                if (parseInt(qty[i].value)) {
                    qty[i].parentElement.nextElementSibling.innerText = parseInt(qty[i].value) * parseFloat(qty[i].parentElement.previousElementSibling.innerText)
                    txtqtyHidden[i].value = parseInt(qty[i].value);
                }
                else
                    qty[i].parentElement.nextElementSibling.innerText = parseInt(0)
            });
           
        }
        const subTotal = document.querySelector("#subTotal");
        const txtTaxes = document.querySelector("#txtTaxes");
        const cartTotalPrice = document.querySelector("#cartTotalPrice");
        txtTaxes.addEventListener('change', (event) => {
            cartTotalPrice.innerText = parseFloat(subTotal.innerText) + parseFloat(txtTaxes.value);
        })
        txtTaxes.addEventListener('keyup', (event) => {
            if (parseFloat(txtTaxes.value))
                cartTotalPrice.innerText = parseFloat(subTotal.innerText) + parseFloat(txtTaxes.value);
            else
                cartTotalPrice.innerText = parseFloat(subTotal.innerText)
        })
        // click function called 
        function click(event) {

            // Condition to disable left click 
            if (event.button == 0) {
                if (!parseFloat(txtTaxes.value))
                    txtTaxes.value = 0
            }
        }
    </script>
</asp:Content>

