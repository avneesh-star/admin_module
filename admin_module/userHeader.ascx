<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="userHeader.ascx.cs" Inherits="admin_module.userHeader" %>
<script src="assets/js/jquery-3.5.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
         $(document).ready(function() {
             bindcart();
         });

         function bindcart() {
             var sessionID = '<%= Session["userID"]%>';
             var count = 0;
            if (sessionID > 0) {
             $.ajax({
                 url: 'forcart.asmx/bindcart',
                 type: 'post',
                 contentType: 'application/json;charset=utf-8',
                 dataType: 'json',
                 data: "{uid:'" + sessionID + "'}",
                 success: function (data) {
                     data = JSON.parse(data.d);
                     $("#cart_list").find("li").remove();
                     for (var i = 0; i < data.length; i++) {
                         
                         $("#cart_list").append('<li class="single-shopping-cart"><div class="shopping-cart-img"><img alt="" src="images/' + data[i].dish_image + '" width="50" height="50"></div><div class="shopping-cart-title"><h4>' + data[i].dish_name + '</h4><h6>Qty:' + data[i].quantity + ' </h6><span>&#x20B9;' + data[i].total_price + '</span></div><div class="shopping-cart-delete"><a href="#" onclick=deleteitem('+data[i].cart_id+')><i class="ion ion-close"></i></a></div></li>');
                         count += data[i].total_price;
                     }
                     $("#item_count").html(data.length);
                     $("#cartvalue").html(count);
                     $("#front_cartvalue").html(count);
                 },
                 error: function () {
                
            }
        });
            }
            else {
                $("#item_count").html("0");
                $("#front_cartvalue").html("0");
            }
         }

        function deleteitem(crid) {
            if (confirm('Are you sure to remove dish?')) {
                $.ajax({
                    url: 'forcart.asmx/datelecart',
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    data: "{cartid:'" + crid + "'}",
                    success: function () {
                        bindcart();
                    },
                    error: function () {
                        alert("dish not added to card!!")
                    }
                });
            }
            
        }
    </script>

<header class="header-area">
    <div class="header-top black-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-12 col-sm-4">
                    <%--<div class="welcome-area">
                                <p>Default welcome msg! </p>
                            </div>--%>
                </div>
                <div class="col-lg-8 col-md-8 col-12 col-sm-8">
                    <div class="account-curr-lang-wrap f-right">
                        <%
                            if (Session["userID"] != null && Session["userID"].ToString() != "")
                            {%>
                        <ul>


                            <li class="top-hover"><a href="#">Welcome <%= Session["userName"]%>  <i class="ion-chevron-down"></i></a>
                                <ul>
                                    <li><a href="my_account.aspx">Profile  </a></li>
                                    <li><a href="order_history.aspx">Order History</a></li>
                                    <li> <a href="cart_view.aspx">view cart</a>
                                        </li>
                                    <li><a href="checkout.aspx">checkout</a></li>
                                    <li><a href="user_logout.aspx">Logout</a></li>

                                </ul>
                            </li>
                        </ul>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-middle">
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-4 col-12 col-sm-4">
                    <div class="logo">
                        <a href="index.aspx">
                            <img alt="" src="assets/img/logo/logo.png">
                        </a>
                    </div>
                </div>
                <div class="col-lg-9 col-md-8 col-12 col-sm-8">
                    <div class="header-middle-right f-right">
                        <%
                            if (Session["userID"] != null && Session["userID"].ToString() != "")
                            {%>

                        <div class="header-login">
                            <a href="user_logout.aspx">
                                <div class="header-icon-style">
                                    <i class="icon-user icons"></i>
                                </div>
                                <div class="login-text-content">
                                    <p><span>Logout</span></p>
                                </div>
                            </a>
                        </div>
                        <% }
                            else
                            {
                        %>
                        <div class="header-login">
                            <a href="login_register.aspx">
                                <div class="header-icon-style">
                                    <i class="icon-user icons"></i>
                                </div>
                                <div class="login-text-content">
                                    <p>Register
                                        <br>
                                        or <span>Sign in</span></p>
                                </div>
                            </a>
                        </div>
                        <% } %>

                        <div class="header-wishlist">
                            &nbsp;
                        </div>
                        <div class="header-cart">
                            
                                    <a href="#">
                                        <div class="header-icon-style">
                                            <i class="icon-handbag icons"></i>
                                            <span class="count-style"><label id="item_count"></label></span>
                                        </div>
                                        <div class="cart-text">
                                            <span class="digit">My Cart</span>
                                            <span class="cart-digit-bold">&#x20B9;<label id="front_cartvalue"></label></span>
                                        </div>
                                    </a>
                                    <div class="shopping-cart-content">
                                        <ul id="cart_list">   
                                    </ul>
                                        <div class="shopping-cart-total">
                                           
                                            <h4>Total : <span class="shop-total">&#x20B9;<label id="cartvalue"></label></span></h4>
                                        </div>
                                    <div class="shopping-cart-btn">
                                        <a href="cart_view.aspx">view cart</a>
                                        <a href="checkout.aspx">checkout</a>
                                    </div>
                                    </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-bottom transparent-bar black-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-12">
                    <div class="main-menu">
                        <nav>
                            <ul>
                                <li><a href="shop.aspx">Shop</a></li>
                                <li><a href="about_us.aspx">About us</a></li>
                                <li><a href="contact_us.aspx">Contact us</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- mobile-menu-area-start -->
    <div class="mobile-menu-area">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="mobile-menu">
                        <nav id="mobile-menu-active">
                            <ul class="menu-overflow" id="nav">
                                <li><a href="shop.aspx">Shop</a></li>
                                <li><a href="about_us.aspx">About us</a></li>
                                <li><a href="contact_us.aspx">Contact us</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- mobile-menu-area-end -->
</header>
