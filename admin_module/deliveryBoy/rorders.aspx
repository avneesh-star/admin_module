<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rorders.aspx.cs" Inherits="admin_module.deliveryBoy.rorders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Order Master</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <link rel="stylesheet" href="../admin/assets/css/dataTables.bootstrap4.css" />
    <link rel="stylesheet" href="../admin/assets/css/style.css" />
</head>
<body class="sidebar-light">
    <form id="form1" runat="server">
        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <nav class="navbar navbar-light bg-light justify-content-between">
                <a class="navbar-brand">Express Food</a>
                <a class="btn btn-outline-success my-2 my-sm-0" href="dlogout.aspx">Logout</a>
            </nav>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <div class="main-panel" style="width: 100%;">
                    <div class="content-wrapper">
                        <div class="card">
                            <div class="card-body">
                                <h1 class="grid_title">Order Master</h1>
                                <div class="row grid_box">
                                    <div class="col-12">
                                        <div class="table-responsive">
                                            <asp:Repeater ID="rp_orders" runat="server" OnItemCommand="rp_orders_ItemCommand">
                                                <HeaderTemplate>

                                                
                                                <table id="order-listing" class="table">
                                                <thead>
                                                    <tr>
                                                        <th width="5%">Order Id</th>
                                                        <th width="10%">Name/Mobile</th>
                                                        <th width="20%">Address/Zipcode</th>
                                                        <th width="5%">Price</th>
                                                        <th width="10%">Payment Type</th>
                                                        <th width="10%">Payment Status</th>
                                                        <th width="10%">Ordered At</th>
                                                        <th width="10%">Order Status</th>
                                                        <th width="5%">View</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                    <tr>
                                                        <td>
                                                            <div class="div_order_id"><%# Eval("order_id") %></div>
                                                        </td>
                                                        <td>
                                                            <p><%# Eval("name") %></p>
                                                            <p><%# Eval("mobile") %></p>
                                                        </td>
                                                        <td>
                                                            <p><%# Eval("address") %></p>
                                                            <p><%# Eval("pincode") %></p>
                                                        </td>
                                                        <td style="font-size: 14px;">&#x20b9;<%# Eval("total_price") %></td>
                                                        <td><%# Eval("payment_type") %></td>
                                                        <td>
                                                            <div class='payment_status payment_status_<%# Eval("payment_status").ToString()=="0"?"pending":"success" %>'><%# Eval("payment_status").ToString()=="0"?"Pending":"Success" %></div>
                                                        </td>
                                                        <td><%# Eval("added_on") %></td>
                                                        <td><asp:LinkButton ID="btn_delivered" runat="server" CssClass='<%# Eval("order_status").ToString()=="4"?"btn btn-success btn-sm":"btn btn-danger btn-sm" %>' CommandName="DL" CommandArgument='<%# Eval("order_id") %>' Text='<%# Eval("order_status").ToString()=="4"?"Delivered":"Set Delivered" %>'></asp:LinkButton></td>
                                                        <td><asp:LinkButton ID="btn_view" runat="server" CommandName="VW" CommandArgument='<%# Eval("order_id") %>' CssClass="btn btn-dark btn-sm" Text="View"></asp:LinkButton></td>
                                                    </tr>
                                                         </ItemTemplate>
                                                 <FooterTemplate>
                                                    <tr>
                                                        <td colspan="6">No data found</td>
                                                    </tr>
                                                       
                                                </tbody>
                                            </table>
                                                </FooterTemplate>
                                                </asp:Repeater>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- content-wrapper ends -->
                    <!-- partial:partials/_footer.html -->
                    <footer class="footer">
                        <div class="d-sm-flex justify-content-center justify-content-sm-between">
                            <span class="text-muted text-center text-sm-left d-block d-sm-inline-block">Copyright © 2018 <a href="https://www.urbanui.com/" target="_blank">Urbanui</a>. All rights reserved.</span>
                        </div>
                    </footer>
                    <!-- partial -->
                </div>
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        <script src="../admin/assets/js/jquery.dataTables.js"></script>
        <script src="../admin/assets/js/dataTables.bootstrap4.js"></script>
        <!-- End custom js for this page-->
    </form>
</body>
</html>
