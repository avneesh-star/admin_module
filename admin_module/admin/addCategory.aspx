<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminn.Master" AutoEventWireup="true" CodeBehind="addCategory.aspx.cs" Inherits="admin_module.addCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Add Category</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
			<h1 class="grid_title ml10 ml15">Add Category</h1>
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                    <div class="form-group">
                  <asp:Label ID="lbl_name" runat="server" Text="Category Name"></asp:Label>
                    <asp:TextBox ID="txt_category_name" CssClass="form-control" runat="server" placeholder="Name"></asp:TextBox>
                        </div>
                     
                    <asp:Button ID="btn_save" Text="Save" runat="server" CssClass="btn btn-primary"  OnClick="btn_save_Click" ></asp:Button>
                    
                  
                </div> 
                  </div>
                </div>
        </div>
    

</asp:Content>
