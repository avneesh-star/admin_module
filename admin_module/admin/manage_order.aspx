<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminn.Master" AutoEventWireup="true" CodeBehind="manage_order.aspx.cs" Inherits="admin_module.admin.manage_order" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Mange Orders</title>
    <script type="text/javascript">

        $(document).ready(function () {
        $('#<%= gv_order.ClientID %>').DataTable();
    });
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
            <div class="card-body">
              <h1 class="grid_title">User Master</h1>
			  <div class="row grid_box">
				
                <div class="col-12">
                  <div class="table-responsive" style="overflow:hidden;" >
                     
                    <asp:GridView ID="gv_order"  runat="server" AutoGenerateColumns="False"
                           CssClass="table  table-striped table-bordered table-sm" OnRowDataBound="gv_order_RowDataBound" OnRowCommand="gv_order_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Order ID"  InsertVisible="true">
                                <ItemTemplate>
                                    <%# Eval("order_id") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" >
                                <ItemTemplate>
                                    <%# Eval("name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                   <%# Eval("email") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile">
                                <ItemTemplate>
                                    <%# Eval("mobile") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Address/Pincode">
                                <ItemTemplate>
                                    <%# Eval("address") %>-<%# Eval("pincode") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <%# Eval("total_price") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Payment Type">
                                <ItemTemplate>
                                    <%# Eval("payment_type") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Payment Status">
                                <ItemTemplate>
                                    <%# Eval("payment_status").ToString()=="0"?"Pending":"Recived" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Order Status">
                                <ItemTemplate>
                                    <%# Eval("order_status") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Ordered At">
                                <ItemTemplate>
                                    <%#  Eval("added_on")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btn_View" Text="View" CommandName="STS" runat="server" CssClass="btn-sm btn-google btn-sm" CommandArgument='<%#Eval("order_id") %>'/>
                                   
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                        </Columns>
                        
                    </asp:GridView>

                  </div>
				</div>
              </div>
            </div>
         </div>
</asp:Content>
