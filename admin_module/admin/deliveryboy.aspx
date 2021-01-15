<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminn.Master" AutoEventWireup="true" CodeBehind="deliveryboy.aspx.cs" Inherits="admin_module.deliveryboy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Mange Delivery Boy</title>
    <script type="text/javascript">

        $(document).ready(function () {
        $('#<%= gv_deliveryBoy.ClientID %>').DataTable();
    });
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
    <div class="card-body">
              <h1 class="grid_title">Delivery Boy Master</h1>
        
			  <h4 class="grid_title"><a href="AddDeliveryBoy.aspx">Add Delivery Boy</a></h4>
			  <div class="row grid_box">
				
                <div class="col-12">
                  <div class="table-responsive" style="overflow:hidden;">
    
     <asp:GridView ID="gv_deliveryBoy" runat="server"  AutoGenerateColumns="false"
                            CssClass="table  table-striped table-bordered table-sm" OnRowCommand="gv_deliveryBoy_RowCommand" OnRowDataBound="gv_deliveryBoy_RowDataBound" >
                        <Columns>
                            <asp:TemplateField HeaderText="Sr.No." SortExpression="boy_id" InsertVisible="true">
                                <ItemTemplate>
                                    <%#Eval("boy_id") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" SortExpression="boy_name">
                                <ItemTemplate>
                                    <%#Eval("boy_name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile No" SortExpression="boy_mobile">
                                <ItemTemplate>
                                    <%#Eval("boy_mobile") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                                <asp:TemplateField HeaderText="Added By" SortExpression="boy_added_on">
                                <ItemTemplate>
                                    <%#Eval("added_by") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Added On" SortExpression="boy_added_on">
                                <ItemTemplate>
                                    <%#Eval("boy_added_on") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btn_status" Text='<%#Eval("boy_status").ToString()=="1" ? "Active" : "Inactive" %>' CommandName="STS" runat="server" CssClass='<%#Eval("boy_status").ToString()=="1" ? "btn-sm btn-success" : "btn-sm btn-google" %>' CommandArgument='<%#Eval("boy_id") %>'/>
                                    <asp:Button ID="btn_edit" Text="Edit" CommandName="A" runat="server" CssClass="btn-sm btn-primary" CommandArgument='<%#Eval("boy_id") %>'/>
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
