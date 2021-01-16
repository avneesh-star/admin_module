<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="order_history.aspx.cs" Inherits="admin_module.order_history" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cart-main-area pt-95 pb-100">
            <div class="container">
                <h3 class="page-title">Order History</h3>
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                        
							<div class="table-content table-responsive">
								<asp:Repeater ID="rp_order_history" runat="server" OnItemCommand="rp_order_history_ItemCommand">
                                    <HeaderTemplate>
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Order No</th>
                                            <th>Price</th>
											<%--<th>Coupon</th>--%>
                                            <th>Address</th>
											<th>Zipcode</th>
                                            <th>Order Status</th>
                                            <th>Payment Status</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        </HeaderTemplate>
                                    <ItemTemplate>
										<tr>
                                            <td>
												<div class="div_order_id"><a href="#"><%# Eval("order_id") %></a></div>
											<br/>
											<a href="#"><img src='assets/img/icon-img/pdf.png' width="20" title="Download Invoice"/></a>
											</td>
                                            <td style="font-size:14px;">
                                                &#x20b9;<%# Eval("total_price") %>
											</td>
                                            <%--<td>
											</td>--%>
											<td><%# Eval("address") %></td>
											<td><%# Eval("pincode") %></td>
											<td><%# Eval("ods") %>
                                                <br/>
												<div style='margin-top:10px;'><asp:LinkButton ID="btn_can" CssClass="btn btn-danger" runat="server" Visible='<%# Eval("odsid").ToString()=="1"?true:false %>' CommandName="C" CommandArgument='<%# Eval("order_id") %>' Text="Cancel"></asp:LinkButton></div>
											</td>
											<td><div class='payment_status payment_status_<%# Eval("payment_status").ToString()=="0"?"pending":"success" %>'><%# Eval("payment_status").ToString()=="0"?"Pending":"Success" %></div></td>	
                                        </tr>	
                                        </ItemTemplate>
                                    <FooterTemplate>
                                    </tbody>
                                </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                            </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
