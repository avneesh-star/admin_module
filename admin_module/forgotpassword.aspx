<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="admin_module.forgotpassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
    <script type="text/javascript">
        function validation() {
            var tt = $('#<%= txt_email.ClientID %>').val();
            var exp = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
            if (tt == "") {
                alert('Please enter e mail id!!\n');
                return false;
            }
            else if (exp.test(tt)) {
                return true;
            }
            else {
                alert('E-mail not vaild***\n\n');
                return false;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-gap"></div>
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
            <div class="panel panel-default">
              <div class="panel-body">
                <div class="text-center">
                  <h3><i class="fa fa-lock fa-4x"></i></h3>
                  <h2 class="text-center">Forgot Password?</h2>
                  <p>You can reset your password here.</p>
                  <div class="panel-body">
                      <div class="form-group">
                        <div class="input-group">
                          <span class="input-group-addon"><i class="glyphicon glyphicon-envelope color-blue"></i></span>
                            <asp:TextBox ID="txt_email"  placeholder="email address" CssClass="form-control" runat="server" TextMode="Email"></asp:TextBox>
                        </div>
                      </div>
                      <div>
                     <asp:Button ID="btn_reset" runat="server" Text="Reset Password" CssClass="btn  btn-primary btn-block" OnClientClick="return validation()" OnClick="btn_reset_Click" />
                          <asp:Label ID="lbl_msg" runat="server"></asp:Label>
                      </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
	</div>
</div>
</asp:Content>
