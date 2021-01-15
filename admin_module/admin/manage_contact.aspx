<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminn.Master" AutoEventWireup="true" CodeBehind="manage_contact.aspx.cs" Inherits="admin_module.admin.manage_contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
        $('#<%= gv_contact.ClientID %>').DataTable();
    });
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="card">
            <div class="card-body">
              <h1 class="grid_title">Contact Master</h1>
			  <div class="row grid_box">
				
                <div class="col-12">
                  <div class="table-responsive" style="overflow:hidden;" >
                     
                    <asp:GridView ID="gv_contact"  runat="server" AutoGenerateColumns="False"
                           CssClass="table  table-striped table-bordered table-sm" OnRowDataBound="gv_contact_RowDataBound" OnRowCommand="gv_contact_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Contact ID"  InsertVisible="true">
                                <ItemTemplate>
                                    <%# Eval("cid") %>
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
                            <asp:TemplateField HeaderText="Subject">
                                <ItemTemplate>
                                    <%# Eval("subject") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Messege">
                                <ItemTemplate>
                                    <%# Eval("messege") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Send At">
                                <ItemTemplate>
                                    <%#  Eval("send_on")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btn_Delete" Text="Delete" CommandName="STS" runat="server" CssClass="btn-sm btn-google btn-sm" CommandArgument='<%#Eval("cid") %>'/>
                                   
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
