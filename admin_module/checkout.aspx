<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="admin_module.checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="breadcrumb-area gray-bg">
            <div class="container">
                <div class="breadcrumb-content">
                    <ul>
                        <li><a href="shop.aspx">Shop</a></li>
                        <li class="active"> Checkout </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- checkout-area start -->
        <div class="checkout-area pb-80 pt-100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-9">
                        <div class="checkout-wrapper">
                            <div id="faq" class="panel-group">
                                
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title"><span></span> <a data-toggle="collapse" data-parent="#faq" href="#payment-2">User information</a></h5>
                                    </div>
                                    <div id="payment-2" class="panel-collapse collapse show ">
                                        <div class="panel-body">
                                            <div class="billing-information-wrapper">
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-6">
                                                        <div class="billing-info">
                                                            <label>First Name</label>
                                                            <asp:TextBox ID="txt_fname" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6">
                                                        <div class="billing-info">
                                                            <label>Email Address</label>
                                                            <asp:TextBox ID="txt_email" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-3 col-md-6">
                                                        <div class="billing-info">
                                                            <label>Mobile</label>
                                                            <asp:TextBox ID="txt_mobile" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
													<div class="col-lg-3 col-md-6">
                                                        <div class="billing-info">
                                                            <label>Zip/Postal Code</label>
                                                            <asp:TextBox ID="txt_pincode" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="billing-info">
                                                            <label>Address</label>
                                                            <asp:TextBox ID="txt_address" runat="server"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                                <div class="ship-wrapper">
                                                    <div class="single-ship">
                                                        <asp:RadioButtonList ID="rbl_payment_mode" runat="server" CssClass="dish_radio">
                                                            <asp:ListItem Text="Cash On Delivery(COD)" Value="1" ></asp:ListItem>
                                                            <asp:ListItem Text="Razorpay" Value="2" ></asp:ListItem>
                                                            <%--<asp:ListItem Text="wallet" Value="2"></asp:ListItem>--%>
                                                        </asp:RadioButtonList>
                                                    </div>
                                                    
                                                </div>
                                                <div class="billing-back-btn">
                                                    <div class="billing-btn">
                                                        
                                                        <asp:LinkButton ID="palce_order" runat="server" CssClass="btn btn-danger" OnClick="palce_order_Click" Text="Place order"></asp:LinkButton>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
						   </div>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <div class="checkout-progress">
                            <div class="shopping-cart-content-box">
								<h4 class="checkout_title">Cart Details</h4>
								<ul>
                                    <asp:Repeater ID="rpt_final_cat" runat="server">
                                        <ItemTemplate>
                                            
									<li class="single-shopping-cart">
										<div class="shopping-cart-img">
											<asp:Image ID="img1" runat="server" Width="80px" Height="70px" ImageUrl='<%# Eval("dish_image","~/images/{0}") %>' />
										</div>
										<div class="shopping-cart-title">
											<h4><%# Eval("dish_name") %> </h4>
											<h6>Qty: <%# Eval("quantity") %></h6>
											<span>&#x20B9;<%# Eval("total_price") %></span>
										</div>
									</li>
                                            </ItemTemplate>
                                        </asp:Repeater>
								</ul>
								<div class="shopping-cart-total">
									<h4>Total : <span class="shop-total">&#x20B9;<asp:Label ID="lbl_totalshop" runat="server"></asp:Label></span></h4>
								</div>
								
							</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
</asp:Content>
