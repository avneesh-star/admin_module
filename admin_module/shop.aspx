<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="shop.aspx.cs" Inherits="admin_module.shop" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        
        function addCart(did) {
            var a = $("input[name='price']:checked").val().split(',');
            var price = a[0];
            var attr = a[1];
            var sessionID = '<%= Session["userID"]%>';
            if (sessionID > 0) {
                $.ajax({
                    url: 'forcart.asmx/addtocard',
                    type: 'post',
                    contentType: 'application/json;charset=utf-8',
                    dataType: 'json',
                    data:"{uid:'"+sessionID+"',pid:'"+attr+"',did:'"+did+"',qnt:'"+$("#dc_quant"+did+"").val()+"',price:'"+price+"'}",
                    success: function () {
                        swal("Good job!", "Your dish added to cart!", "success");
                        bindcart();
                        
                    },
                    error: function () {
                        alert("dish not added to card!!")
                    }
                   });
            }
            
            else {
                alert("please login first!!");
            }
           
            
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

                </div>
            </div>


        </div>
    </div>
    <div class="breadcrumb-area border-dark">
        <div class="container">
            <div class="breadcrumb-content">
                <div class="row">
                    <div class="col-sm-9">
                    </div>
                    <div class="col-sm-3">
                        <asp:RadioButtonList ID="rbl_vegFilter" runat="server" RepeatColumns="3" CssClass="dish_radio" OnSelectedIndexChanged="rbl_vegFilter_SelectedIndexChanged" AutoPostBack="true">
                            <asp:ListItem Value="1" Text="Veg"></asp:ListItem>
                            <asp:ListItem Value="2" Text="Non-Veg"></asp:ListItem>
                            <asp:ListItem Value="0" Text="Both"></asp:ListItem>
                        </asp:RadioButtonList>
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
                            <div class="row">
                                <asp:Repeater ID="rp_dishDetail" runat="server" OnItemDataBound="rp_dishDetail_ItemDataBound">
                                    <ItemTemplate>
                                        <div class="product-width col-xl-4 col-lg-4 col-md-4 col-sm-6 col-12 mb-30 border bg-light">
                                            <div class="product-wrapper">
                                                <div class="product-img">
                                                    <asp:HiddenField ID="hdf_dishid" runat="server" Value='<%#Eval("dish_id") %>' />
                                                    <asp:Image ID="img1" runat="server" Width="200px" Height="150px" ImageUrl='<%# Eval("dish_image","~/images/{0}") %>' />

                                                </div>
                                                <div class="product-content">
                                                    <h4>

                                                        <asp:Image ID="imgveg" runat="server" ImageUrl='<%#Eval("dish_type").ToString()=="1"?"~/assets/img/veg.png":"~/assets/img/no-veg.png" %>' ImageAlign="Baseline" />
                                                        <%#Eval("dish_name") %>
                                                    </h4>

                                                    <asp:Repeater ID="rp_price" runat="server">
                                                        <HeaderTemplate>

                                                            <div class="product-price-wrapper">
                                                                <div class="row">
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <div class="col-sm">
                                                                <input type="radio" style="width: 15px; height: 13px;" id="rbprice" name="price" value='<%#Eval("price") %>,<%#Eval("attr_id") %>'>
                                                                <label for="rbprice"><%#Eval("attribute") %>(&#x20b9;<%#Eval("price") %>)</label><br>
                                                            </div>
                                                            <input type="hidden" value='<%# ViewState["did"]= Eval("dish_id") %>' />
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </div>
                                                            <div class="row justify-content-between">
                                                                <div class="col-4">
                                                                    <select id='dc_quant<%# ViewState["did"] %>' style="background-color: thistle">
                                                                        <option value="0">Qnty.</option>
                                                                        <% for (int i = 1; i <= 10; i++)
                                                                        {%>
                                                                        <option value='<%= i %>'><%= i %></option>
                                                                        <% } %>
                                                                    </select>

                                                                </div>
                                                                <div class="col-6">

                                                                    <input type="button" class="btn btn-primary btn-sm" id="btn_cart" value="Add to Cart" onclick='<%# String.Format("addCart(\"{0}\");", ViewState["did"]) %>' />
                                                                </div>
                                                            </div>
                                                            </div>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                    <%-- <input type="button" class="btn btn-primary btn-sm" id="btn_cart" value="Add to Cart" onclick='<%# String.Format("addCart(\"{0}\");", Eval("dish_id")) %>' /> --%>
                                                </div>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-lg-3">
                    <div class="shop-sidebar-wrapper gray-bg-7 shop-sidebar-mrg">
                        <asp:Repeater ID="rp_categories" runat="server">
                            <HeaderTemplate>
                                <div class="shop-widget">
                                    <h4 class="shop-sidebar-title">Shop By Categories</h4>
                                    <div class="shop-catigory">
                                        <ul id="faq">
                                            <li><a href="shop.aspx">All</a></li>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <li><a href='shop.aspx?cat=<%#Eval("category_id") %>'><%#Eval("categgory_name") %></a> </li>
                            </ItemTemplate>
                            <FooterTemplate>
                                </ul>
                                </div>
                                    </div>
                            </FooterTemplate>
                        </asp:Repeater>

                    </div>
                </div>
            </div>

        </div>
    </div>


</asp:Content>
