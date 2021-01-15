<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="shopBak.aspx.cs" Inherits="admin_module.shopBak" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            bindcat();
            binddish();
        });

        function bindcat() {
            $.ajax({
                url: 'shopBak.aspx/bindCategories',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: "{}",
                async: false,
                success: function (data) {
                    data = JSON.parse(data.d);
                    for (var i = 0; i < data.length; i++) {
                        $("#faq").append('<li><a href="shopBak.aspx?cat=' + data[i].category_id + '">' + data[i].categgory_name + '</a> </li>');
                    }

                },
                error: function () {
                },
            });
        }

        function binddish() {
            $.ajax({
                url: 'shopBak.aspx/binddish',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: "{}",
                async:false,
                success: function (data) {
                    data = JSON.parse(data.d);
                    for (var i = 0; i < data.length; i++) {
                        $("#product").append('<div class="product-width col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12 mb-30"><div class="product-wrapper"><div class="product-img"><a href="#"><img src="images/' + data[i].dish_image + '" alt=""></a></div><div class="product-content"><h4><a href="#">' + data[i].dish_name + ' </a></h4><div class="product-price-wrapper"><span>100.00</span></div></div></div></div>');
                    }

                },
                error: function () {
                },
            });
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="breadcrumb-area gray-bg">
        <div class="container">
            <div class="breadcrumb-content">
                <div class="row">
                    <div class="col-sm-9">

                        <ul>
                            <li><a href="shop.aspx">Shop</a></li>

                        </ul>
                    </div>
                    <div class="col-sm-3">
                    </div>
                </div>

            </div>

        </div>
    </div>
    <div class="shop-page-area pt-100 pb-100">
        <div class="container">
            <div class="row flex-row-reverse">
                <div class="col-lg-9">


                    <div class="grid-list-product-wrapper">
                        <div class="product-grid product-view pb-20">
                            <div class="row" id="product">
                                <%--<div class="product-width col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12 mb-30">
                                        <div class="product-wrapper">
                                            <div class="product-img">
                                                <a href="product-details.html">
                                                    <img src="assets/img/product/product-9.jpg" alt="">
                                                </a>
                                            </div>
                                            <div class="product-content">
                                                <h4>
                                                    <a href="product-details.html">PRODUCTS NAME HERE </a>
                                                </h4>
                                                <div class="product-price-wrapper">
                                                    <span>$100.00</span>
                                                </div>
                                            </div>
										</div>
                                    </div>--%>

                                
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-lg-3">
                    <div class="shop-sidebar-wrapper gray-bg-7 shop-sidebar-mrg">

                        <div class="shop-widget">
                            <h4 class="shop-sidebar-title">Shop By Categories</h4>
                            <div class="shop-catigory">
                                <ul id="faq">
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>


</asp:Content>
