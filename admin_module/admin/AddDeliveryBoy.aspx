<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminn.Master" AutoEventWireup="true" CodeBehind="AddDeliveryBoy.aspx.cs" Inherits="admin_module.AddDeliveryBoy" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
			<h1 class="grid_title ml10 ml15">Add Delivery Boy</h1>
            <div class="col-12 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                    <div class="form-group">
                  <asp:Label ID="lbl_name" runat="server" Text="Name"></asp:Label>
                    <asp:TextBox ID="txt_name" CssClass="form-control" runat="server" placeholder="Name"></asp:TextBox>
                        </div>
                     <div class="form-group">
                      <asp:Label ID="lbl_mobile" runat="server" Text="Mobile No"></asp:Label>
                    <asp:TextBox ID="txt_mobile" CssClass="form-control" runat="server" placeholder="Mobile No"></asp:TextBox>
                    </div>
					<div class="form-group">
                      <asp:Label ID="lbl_password" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="txt_password" CssClass="form-control" runat="server" placeholder="Password"></asp:TextBox>
					  
                    </div>
                    <div class="form-group">
                      <asp:Label ID="lbl_confirmpassword" runat="server" Text="Confirm Password"></asp:Label>
                    <asp:TextBox ID="txt_confirmpassword" CssClass="form-control" runat="server" placeholder="Confirm Password"></asp:TextBox>
                    </div>
                    <asp:Button ID="btn_save" Text="Save" runat="server" CssClass="btn btn-primary"  OnClick="btn_save_Click" ></asp:Button>
                    
                  
                </div> 
                  </div>
                </div>
        </div>
    

</asp:Content>
