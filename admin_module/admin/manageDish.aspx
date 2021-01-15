<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminn.Master" AutoEventWireup="true" CodeBehind="manageDish.aspx.cs" Inherits="admin_module.manageDish" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        $(document).ready(function () {
        $('#<%= gv_dish.ClientID %>').DataTable();
    });
        </script>
    <title>Manage Dish</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
    <div class="card-body">
              <h1 class="grid_title">Category Master</h1>
        
			  <h4 class="grid_title"><a href="addDish.aspx">Add Dish</a></h4>
			  <div class="row grid_box">
				
                <div class="col-12">
                  <div class="table-responsive" style="overflow:hidden;">
    
     <asp:GridView ID="gv_dish" runat="server"  AutoGenerateColumns="false"
                            CssClass="table  table-striped table-bordered table-sm" OnRowCommand="gv_dish_RowCommand" OnRowDataBound="gv_dish_RowDataBound" >
                        <Columns>
                            <asp:TemplateField HeaderText="Category" >
                                <ItemTemplate>
                                    <%#Eval("categgory_name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText=" Dish Name" >
                                <ItemTemplate>
                                    <%#Eval("dish_name") %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText=" Type" >
                                <ItemTemplate>
                                    <%#Eval("dish_type").ToString()=="1"?"Veg":"Non-Veg" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText=" Image" >
                                <ItemTemplate>
                                    <asp:Image ID="img1" runat="server" ImageUrl='<%# Eval("dish_image","~/images/{0}") %>' Height="35px" Width="80px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Added Date" >
                                <ItemTemplate>
                                    <%#Convert.ToDateTime(Eval("added_on").ToString()).ToShortDateString() %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:Button ID="btn_status" Text='<%#Eval("dish_status").ToString()=="1" ? "Active" : "Inactive" %>' CommandName="STS" runat="server" CssClass='<%#Eval("dish_status").ToString()=="1" ? "btn btn-success" : "btn btn-google" %>' CommandArgument='<%#Eval("dish_id") %>'/>
                                    <asp:Button ID="btn_edit" Text="Edit" CommandName="A" runat="server" CssClass="btn btn-primary" CommandArgument='<%#Eval("dish_id") %>'/>
                                    <asp:Button ID="btn_delete" Text="Delete" CommandName="D" runat="server" CssClass="btn btn-reddit " CommandArgument='<%#Eval("dish_id") %>' OnClientClick=" return confirm('Are you sure to delete dish??')"/>
                                    <asp:Button ID="btn_viewPrice" Text="View Price" CommandName="VP" runat="server" CssClass="btn btn-info" CommandArgument='<%#Eval("dish_id") %>' />
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
