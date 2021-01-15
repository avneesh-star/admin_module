<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="cart_view.aspx.cs" Inherits="admin_module.cart_view" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="cart-main-area pt-95 pb-100">
            <div class="container">
                <h3 class="page-title">Your cart items</h3>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                       
                            <div class="table-content table-responsive">
                                <table id="tbl_viewcart">
                                    <thead>
                                        <tr>
                                            <th>Image</th>
                                            <th>Product Name</th>
                                            <th>Unit Price</th>
                                            <th>Qty</th>
                                            <th>Subtotal</th>
                                            <th>action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <asp:Repeater ID="rp_viewcart" runat="server" OnItemCommand="rp_viewcart_ItemCommand">
                                            <ItemTemplate>
                                                <tr>
                                            <td class="product-thumbnail">
                                                <a href="#">
                                                    <asp:Image ID="img1" runat="server" Width="80px" Height="70px" ImageUrl='<%# Eval("dish_image","~/images/{0}") %>' />

                                                </a>
                                            </td>
                                            <td class="product-name"><a href="#"><%# Eval("dish_name") %> </a></td>
                                            <td class="product-price-cart"><span class="amount">&#x20B9;<%# Eval("price") %></span></td>
                                            <td class="product-quantity">
                                                <div class="cart-plus-minus">
                                                    <asp:TextBox class="cart-plus-minus-box" runat="server" id="cartquantity" type="text" name="qtybutton" value='<%# Eval("quantity") %>'></asp:TextBox>
                                                </div>
                                            </td>
                                            <td class="product-subtotal">&#x20B9;<%# Eval("total_price") %></td>
                                            <td class="product-remove">
                                                
                                                <asp:LinkButton ID="btn_update_qty" runat="server" CommandName="edt" CommandArgument='<%# Eval("cart_id") %>' ><i class="fa fa-pencil"></i></asp:LinkButton>
                                               <asp:LinkButton ID="btn_rmv" runat="server" CommandName="rmv" CommandArgument='<%# Eval("cart_id") %>'><i class="fa fa-times"></i></asp:LinkButton>
                                           </td>
                                        </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </tbody>
                                </table>
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="cart-shiping-update-wrapper">
                                        <div class="cart-shiping-update">
                                            <a href="shop.aspx">Continue Shopping</a>
                                        </div>
                                        <div class="cart-clear">
                                          <asp:LinkButton ID="btn_clear_cart" runat="server" OnClick="btn_clear_cart_Click">Clear Shopping Cart</asp:LinkButton> 
                                            <a href="checkout.aspx">Check Out</a> 
                                        </div>
                                    </div>
                                </div>
                            </div>
                       
                    </div>
                </div>
            </div>
        </div>
   
</asp:Content>
