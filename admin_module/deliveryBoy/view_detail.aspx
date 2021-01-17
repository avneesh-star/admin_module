<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="view_detail.aspx.cs" Inherits="admin_module.deliveryBoy.view_detail" %>

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
                <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#"><span class="sr-only">(current)</span></a>
      </li></ul>
                <a href="rorders.aspx"  class="btn btn-outline-dark">Orders</a>&nbsp;&nbsp;&nbsp;
                <a class="btn btn-outline-success my-2 my-sm-0" href="dlogout.aspx">Logout</a>
            </nav>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <div class="main-panel" style="width: 100%;">
                    <div class="content-wrapper">
                        <div class="page-header">
              <h3 class="page-title"> Order Detail </h3>
              
            </div>
            <div class="row">
              <div class="col-lg-12">
                <div class="card px-2">
                    <asp:Repeater ID="rp_order_master" runat="server" OnItemDataBound="rp_order_master_ItemDataBound">
                        <ItemTemplate>
                  <div class="card-body">
                    <div class="container-fluid">
                      <h3 class="text-right my-5">Order ID&nbsp;&nbsp;<%# Eval("order_id")  %></h3>
                      <hr />
                    </div>
                    <div class="container-fluid d-flex justify-content-between">
                      <div class="col-lg-3 pl-0">
                        <p class="mt-5 mb-2"><b>Express Food</b></p>
                        <p>Shop Address</p>
                      </div>
                      <div class="col-lg-3 pr-0">
                        <p class="mt-5 mb-2 text-right"><b>Invoice to</b></p>
                        <p class="text-right">
							<%# Eval("name")  %><br/>
                            <%# Eval("email")  %>/<%# Eval("mobile")  %><br/>
							<%# Eval("address")  %><br/>
							<%# Eval("pincode")  %><br/>
						</p>
                      </div>
                    </div>
                    <div class="container-fluid d-flex justify-content-between">
                      <div class="col-lg-3 pl-0">
                        <p class="mb-0 mt-5">Order Date : <%# Eval("added_on")  %></p>
                      </div>
                    </div>
                    <div class="container-fluid mt-5 d-flex justify-content-center w-100">
                      <div class="table-responsive w-100">
                          <asp:Repeater ID="rp_order_detail" runat="server">
                              <HeaderTemplate>
                        <table class="table">
                          <thead>
                            <tr class="bg-dark">
                              <th>#</th>
                              <th>Description</th>
                              <th class="text-right">Quantity</th>
                              <th class="text-right">Unit cost</th>
                              <th class="text-right">Total</th>
                            </tr>
                          </thead>
                             <tbody>
                            </HeaderTemplate>
                              <ItemTemplate>
                            <tr class="text-right">
                              <td class="text-left"><%# Container.ItemIndex+1 %></td>
                              <td class="text-left"><%# Eval("dish_name") %>(<%# Eval("attribute") %>)</td>
                              <td><%# Eval("quantity") %></td>
                              <td><%# Eval("price") %>&#x20b9;</td>
                              <td><%# Convert.ToInt32(Eval("quantity").ToString())*Convert.ToInt32(Eval("price").ToString()) %>&#x20b9;</td>
                            </tr>
                                </ItemTemplate>
                              <FooterTemplate>
                                  </tbody>
                                   </table>
                              </FooterTemplate>
                              </asp:Repeater>
                      </div>
                    </div>
                    <div class="container-fluid mt-5 w-100">
                      <h4 class="text-right mb-5">Total : <%# Eval("total_price") %>&#x20b9;</h4>
					 
						  <%--<h4 class="text-right mb-5">Coupon Code :</h4>
						  <h4 class="text-right mb-5">Final Total :</h4>--%>
						
                      <hr />
                    </div>
                       </ItemTemplate>
				  </asp:Repeater>
					<div>
						<h4>Order Status:<asp:Label id="lbl_od_status" runat="server"></asp:Label></h4>
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
