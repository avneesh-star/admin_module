<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="resetPassword.aspx.cs" Inherits="admin_module.resetPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
    <script type="text/javascript">
        function validation() {
            var tt = $('#<%= txt_newPassword.ClientID %>').val();
            var pp= $('#<%= txt_confirmPassword.ClientID %>').val();
           
            if (tt == "") {
                $("#msg1").html("Please enter password");
                return false;
            }
            else if (pp == tt) {
                return true;
            }
            else {
                $("#pwmatch").html("password not matched");
               
                return false;
            }
            
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">

<div class="row">
<div class="col-md-4 col-md-offset-4">
    <h1>Change Password</h1>
<p class="text-center">Use the form below to change your password. Your password cannot be the same as your username.</p>
    <asp:TextBox ID="txt_newPassword" placeholder="New Password"  CssClass="input-lg form-control" AutoCompleteType="None" runat="server" TextMode="Password"></asp:TextBox>

<div class="row">
<div class="col-sm-4">
    <span id="msg1" style="color:#FF0004;"></span>
</div>
<div class="col-sm-4">

</div>
</div>
    <asp:TextBox ID="txt_confirmPassword" placeholder="Repeat Password"  CssClass="input-lg form-control" AutoCompleteType="None" runat="server" TextMode="Password"></asp:TextBox>

<div class="row">
<div class="col-sm-12">
<span id="pwmatch" style="color:#FF0004;"></span> 
</div>
</div>
    <asp:Button ID="btn_changePassword" runat="server" CssClass="col-xs-12 btn-primary btn-block" Text="Change password" OnClientClick="return validation()" OnClick="btn_changePassword_Click"  />

    <div class="row">
<div class="col-sm-12">
<span style="color:#FF0004;"><asp:Label ID="lbl_msg" runat="server"></asp:Label></span> 
</div>
</div>

</div><!--/col-sm-6-->
</div><!--/row-->
</div>


</asp:Content>
