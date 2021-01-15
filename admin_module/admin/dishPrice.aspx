<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminn.Master" AutoEventWireup="true" CodeBehind="dishPrice.aspx.cs" Inherits="admin_module.dishPrice" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Mange Category</title>
    <script type="text/javascript">

        $(document).ready(function () {
        $('#<%= gv_dishPrice.ClientID %>').DataTable();
    });
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="card">
    <div class="card-body">
              <h1 class="grid_title">Dish Price Master</h1>
        
			  
			  <div class="row grid_box">
				
                <div class="col-12">
                  <div class="table-responsive" style="overflow:hidden;">
    
     <asp:GridView ID="gv_dishPrice" runat="server"  AutoGenerateColumns="false" ShowFooter="true" DataKeyNames="attr_id" OnRowCancelingEdit="gv_dishPrice_RowCancelingEdit" OnRowEditing="gv_dishPrice_RowEditing" OnRowUpdating="gv_dishPrice_RowUpdating" OnRowDeleting="gv_dishPrice_RowDeleting"
                            CssClass="table  table-striped table-bordered table-sm" OnRowCommand="gv_dishPrice_RowCommand"  >
                        <Columns>
                            <asp:TemplateField HeaderText="Dish" >
                                <ItemTemplate>
                                    <%#Eval("dish_name") %>
                                </ItemTemplate>
                                
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Attribute" >
                                <ItemTemplate>
                                    <%#Eval("attribute") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtAttr1" CssClass="form-control" Text='<%#Eval("attribute") %>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtAttr2" CssClass="form-control" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price" >
                                <ItemTemplate>
                                    <%#Eval("price") %>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPrice1" CssClass="form-control" Text='<%#Eval("price") %>' runat="server"></asp:TextBox>
                                </EditItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtPrice2" CssClass="form-control" runat="server"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:LinkButton ID="btndelete" runat="server" Text="Delete" CommandName="Delete"></asp:LinkButton>
                            <asp:LinkButton ID="btnedit" runat="server" Text="Edit" CommandName="Edit"></asp:LinkButton>
                        </ItemTemplate>
                          <EditItemTemplate>
                              <asp:LinkButton ID="btnupdate" runat="server" Text="Update" CommandName="Update"></asp:LinkButton>
                              <asp:LinkButton ID="btncancel" runat="server" Text="Cancel" CommandName="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <FooterTemplate>
                            <asp:Button ID="btnsave2" runat="server" Text="Save" CommandName="SV" CssClass="btn btn-large btn-info pull-right" />
                        </FooterTemplate>
                    </asp:TemplateField>
                            
                        </Columns>
                    </asp:GridView>
                      </div>
                    </div>
                  </div>
        </div>
</div>
</asp:Content>
