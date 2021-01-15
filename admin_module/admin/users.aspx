<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminn.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="admin_module.users" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Mange User</title>
    <script type="text/javascript">

        $(document).ready(function () {
        $('#<%= gv_user.ClientID %>').DataTable();
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
                     
                    <asp:GridView ID="gv_user"  runat="server" AutoGenerateColumns="False"
                           CssClass="table  table-striped table-bordered table-sm" OnRowCommand="gv_user_RowCommand" OnRowDataBound="gv_user_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Sr.No." SortExpression="user_id" InsertVisible="true">
                                <ItemTemplate>
                                    <%#Eval("user_id") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Name" SortExpression="user_name">
                                <ItemTemplate>
                                    <%#Eval("user_name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email" SortExpression="user_email">
                                <ItemTemplate>
                                    <%#Eval("user_email") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Mobile" SortExpression="user_mobile">
                                <ItemTemplate>
                                    <%#Eval("user_mobile") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Added On" SortExpression="user_added_on">
                                <ItemTemplate>
                                    <%#Eval("user_added_on") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btn_status" Text='<%#Eval("user_status").ToString()=="1" ? "Active" : "Inactive" %>' CommandName="STS" runat="server" CssClass='<%#Eval("user_status").ToString()=="1" ? "btn-sm btn-success btn-sm" : "btn-sm btn-google btn-sm" %>' CommandArgument='<%#Eval("user_id") %>'/>
                                    <%--<asp:Button ID="btn_add_money" Text="Add Money" CommandName="A" runat="server" CssClass="btn-sm btn-primary btn-sm" CommandArgument='<%#Eval("user_id") %>'/>--%>
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
