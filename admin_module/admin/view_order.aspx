<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminn.Master" AutoEventWireup="true" CodeBehind="view_order.aspx.cs" EnableEventValidation="false" Inherits="admin_module.admin.view_order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            bindOrderStatus();
            bindDeliveryBoy();
            currentOrderStatus();
            assignedBoy();
        });
        function bindOrderStatus() {
           
            $.ajax({
                url: 'webadmin.asmx/orderStatus',
                type: 'post',
                contentType: 'application/json;charset="utf-8"',
                dataType: 'json',
                data: "{a:'" + $("#hdd_order_id").val() + "'}",
                async: false,
                success: function (data) {
                    data = JSON.parse(data.d);
                    for (let i = 0; i < data.length; i++) {
                        $("#order_status").append($('<option></option>').val(data[i].id).html(data[i].order_status));
                    }
                },
                error: function () {

                }
            });
           
        }

        function bindDeliveryBoy() {
            $.ajax({
                url: 'webadmin.asmx/deliveryBoyBind',
                type: 'post',
                contentType: 'application/json;charset="utf-8"',
                dataType: 'json',
                data: "{}",
                async:false,
                success: function (data) {
                    data = JSON.parse(data.d);
                    for (let i = 0; i < data.length; i++) {
                        $("#delivery_boy").append($('<option></option>').val(data[i].boy_id).html(data[i].boy_name));
                    }
                },
                error: function () {

                }
            });
        }

        function updateOrderStatus(orderID) {
            $.ajax({
                url: 'webadmin.asmx/updateOrderStatus',
                type: 'post',
                contentType: 'application/json;charset="utf-8"',
                dataType: 'json',
                data: "{a:'" + orderID + "',b:'" + $("#order_status") .val()+ "'}",
                async: false,
                success: function () {
                    currentOrderStatus();
                },
                error: function () {
                    alert('status not Updated!!');
                }
            });
        }

        function updateDeliveryBoy(orderID) {
            $.ajax({
                url: 'webadmin.asmx/deliveryBoyAssign',
                type: 'post',
                contentType: 'application/json;charset="utf-8"',
                dataType: 'json',
                data: "{a:'" + orderID + "',b:'" + $("#delivery_boy").val() + "'}",
                async: false,
                success: function () {
                    assignedBoy();
                },
                error: function () {
                    alert('not assigned!!');
                }
            });
        }

        function currentOrderStatus() {
            $.ajax({
                url: 'webadmin.asmx/getOdrStatus',
                type: 'post',
                contentType: 'application/json;charset="utf-8"',
                dataType: 'json',
                data: "{a:'" + $("#hdd_order_id").val() + "'}",
                async: false,
                success: function (data) {
                    data = JSON.parse(data.d);
                    $("#lbl_od_status").html(data[0].order_status);
                   
                    
                },
                error: function () {

                }
            });
        }

        function assignedBoy() {
            $.ajax({
                url: 'webadmin.asmx/getAssignBOy',
                type: 'post',
                contentType: 'application/json;charset="utf-8"',
                dataType: 'json',
                data: "{a:'" + $("#hdd_order_id").val() + "'}",
                async: false,
                success: function (data) {
                    data = JSON.parse(data.d);
                    $("#lbl_boy").html(data[0].boy_name);
                },
                error: function () {

                }
            });
        }

        function print_in(pint_page) {
            var printContent = document.getElementById(pint_page);
            var windowUrl = 'about:blank';
            var windowName = 'PrintWindow';
            var printWindow = window.open(windowUrl, windowName,
                  'left=50000,top=50000,width=0,height=0');
            printWindow.document.write(printContent.innerHTML);
            printWindow.document.close();
            printWindow.focus();
            printWindow.print();
            printWindow.close();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="print_page" class="page-header">
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
                              <td><%# Eval("price") %></td>
                              <td><%# Convert.ToInt32(Eval("quantity").ToString())*Convert.ToInt32(Eval("price").ToString()) %></td>
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
                      <h4 class="text-right mb-5">Total : <%# Eval("total_price") %></h4>
					 
						  <%--<h4 class="text-right mb-5">Coupon Code :</h4>
						  <h4 class="text-right mb-5">Final Total :</h4>--%>
						
                      <hr />
                    </div>
					
					
                    <div class="container-fluid w-100">
                      <a href='../download_invoice.aspx?order_id=<%# Eval("order_id") %>' class="btn btn-primary float-right mt-4 ml-2"><i class="mdi mdi-printer mr-1"></i>PDF</a>
                    </div>
					
					<div>
						<h4>Order Status:<label id="lbl_od_status" ></label></h4>
                       
						<select class="form-control wSelect200" name="order_status" id="order_status" onchange='<%# String.Format("updateOrderStatus(\"{0}\");", Eval("order_id")) %>' >
							<option value="">Update Order Status</option>
						</select>
						<br/>
						<h4>Delivery Boy:<label id="lbl_boy" ></label></h4>
                        <input type="hidden" value='<%# Eval("order_id") %>' id="hdd_order_id" />
						<select class="form-control wSelect200" name="delivery_boy" id="delivery_boy" onchange='<%# String.Format("updateDeliveryBoy(\"{0}\");", Eval("order_id")) %>'>
							<option value="">Assign Delivery Boy</option>
						</select>
					</div>
					
                  </div>
                    </ItemTemplate>
				  </asp:Repeater>
                </div>
              </div> 
                </div>
</asp:Content>
