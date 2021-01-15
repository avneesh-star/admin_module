<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminn.Master" AutoEventWireup="true" CodeBehind="addDish.aspx.cs" Inherits="admin_module.addDish" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Add Dish</title>
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <h1 class="grid_title ml10 ml15">Add Dish</h1>
        <div class="col-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="form-row">
                        <div class="form-group col-6"> 
                            <asp:Label ID="lbl_name" runat="server" Text="Category"></asp:Label>
                        <asp:DropDownList ID="ddl_category" CssClass="form-control form-control-sm" runat="server"></asp:DropDownList>
                        </div>
                        <div class="form-group col-6"> 
                            <asp:Label ID="Label1" runat="server" Text="Dish"></asp:Label>
                        <asp:TextBox ID="txt_dish" CssClass="form-control form-control-sm" runat="server" placeholder="Dish"></asp:TextBox>
                        </div>
                        
                    </div>
                    <div class="form-row">
                        <div class="form-group col-6">
                            <asp:Label ID="Label2" runat="server" Text="Dish type"></asp:Label>
                        <asp:RadioButtonList ID="rbl_type" CssClass="form-control form-control-sm" runat="server" RepeatColumns="2">
                            <asp:ListItem Text="Veg" Value="1"></asp:ListItem>

                            <asp:ListItem Text="Non-Veg" Value="2"></asp:ListItem>
                        </asp:RadioButtonList>
                        </div>
                        <div class="form-group col-6">
                            <asp:Label ID="Label4" runat="server" Text="Dish Image"></asp:Label>
                        <asp:FileUpload ID="fu_image" runat="server" CssClass="form-control form-control-sm" />
                            
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col">
                         <asp:Label ID="Label3" runat="server" Text="Dish Detail"></asp:Label>
                        <asp:TextBox ID="txt_detail" CssClass="form-control form-control-sm" runat="server" placeholder="Dish Detail"></asp:TextBox>
                    </div>
                        </div>                 
                    <div class="row">

                        <div class="col-4">
                            <asp:Button ID="btn_save" Text="Save" runat="server" OnClick="btn_save_Click" CssClass="btn btn-primary"  />
                            <asp:Label ID="lbl_msg" runat="server" Font-Bold="true"></asp:Label>
                        </div>
                    </div>
                </div>
               
            </div>
            
            </div>
        </div>
    
   <%-- <input type="hidden" id="add_more" value="1"/>--%>
   
</asp:Content>
