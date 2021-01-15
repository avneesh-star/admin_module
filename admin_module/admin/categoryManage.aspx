<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminn.Master" AutoEventWireup="true" CodeBehind="categoryManage.aspx.cs" Inherits="admin_module.categoryManage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Mange Category</title>
    <script type="text/javascript">

        $(document).ready(function () {
        $('#<%= gv_category.ClientID %>').DataTable();
    });
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
    <div class="card-body">
              <h1 class="grid_title">Dish Master</h1>
        
			  <h4 class="grid_title"><a href="addCategory.aspx">Add Category</a></h4>
			  <div class="row grid_box">
				
                <div class="col-12">
                  <div class="table-responsive" style="overflow:hidden;">
    
     <asp:GridView ID="gv_category" runat="server"  AutoGenerateColumns="false"
                            CssClass="table  table-striped table-bordered table-sm" OnRowCommand="gv_category_RowCommand" OnRowDataBound="gv_category_RowDataBound" >
                        <Columns>
                            <asp:TemplateField HeaderText="Category ID" >
                                <ItemTemplate>
                                    <%#Eval("category_id") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText=" Category Name" >
                                <ItemTemplate>
                                    <%#Eval("categgory_name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Added Date" >
                                <ItemTemplate>
                                    <%#Eval("added_date") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btn_status" Text='<%#Eval("category_status").ToString()=="1" ? "Active" : "Inactive" %>' CommandName="STS" runat="server" CssClass='<%#Eval("category_status").ToString()=="1" ? "btn-sm btn-success" : "btn-sm btn-google" %>' CommandArgument='<%#Eval("category_id") %>'/>
                                    <asp:Button ID="btn_edit" Text="Edit" CommandName="A" runat="server" CssClass="btn-sm btn-primary" CommandArgument='<%#Eval("category_id") %>'/>
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
