<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="login_register.aspx.cs" Inherits="admin_module.login_register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function validation() {
            var msg = "";
            msg = checkName();
            msg += checkpassword();
            msg += checkemail();
            msg += checkmobile();
            if (msg == "") {
                return true;
            }
            else {
                alert(msg);
                return false;
            }
        }
        function checkName() {
            var tt = $('#<%= txt_user_name.ClientID %>').val();
            var exp = /^[A-Za-z ]+$/;
            if (tt == "") {
                return 'Please enter your name***\n\n';
            }
            else if (exp.test(tt)) {
                return "";
            }
            else {
                return 'Only alphabates allowed***\n\n';
            }
        }

        function checkpassword() {
            var tt = $('#<%= txt_user_password.ClientID %>').val();
            if (tt == "") {
                return 'Please enter password!!\n';
            }
            else {
                return "";
            }
        }

        function checkemail() {
            var tt = $('#<%= txt_user_email.ClientID %>').val();
            var exp = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;
            if (tt == "") {
                return 'Please enter e mail id!!\n';
            }
            else if (exp.test(tt)) {
                return "";
            }
            else {
                return 'E-mail not vaild***\n\n';
            }
        }

        function checkmobile() {
            var tt = $('#<%= txt_mobile.ClientID %>').val();
            var exp = /^\d{10}$/;
            if (tt == "") {
                return 'Please enter Mobile no!!\n';
            }
            else if (exp.test(tt)) {
                return "";
            }
            else {
                return 'only 10 digtis contact no valid***\n\n';
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
        <div class="login-register-area pt-95 pb-100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7 col-md-12 ml-auto mr-auto">
                        <div class="login-register-wrapper">
                            <div class="login-register-tab-list nav">
                                <a class="active" data-toggle="tab" href="#lg1">
                                    <h4> login </h4>
                                </a>
                                <a data-toggle="tab" href="#lg2">
                                    <h4> register </h4>
                                </a>
                            </div>
                            <div class="tab-content">
                                <div id="lg1" class="tab-pane active">
                                    <div class="login-form-container">
                                        <div ><span style="color:red"><%= Session["msg"] %></span> </div>
                                       
                                        <div class="login-register-form">
                                            <asp:TextBox ID="txt_login_mail" runat="server" placeholder="Login E-Mail" ></asp:TextBox>
                                             <asp:TextBox ID="txt_login_password" runat="server" placeholder="Login Password"  TextMode="Password"></asp:TextBox>
                                                
                                                <div class="button-box">
                                                    <div class="login-toggle-btn">
                                                       <asp:CheckBox ID="cb_remember" runat="server" />
                                                        <label>Remember me</label>
                                                        <a href="forgotpassword.aspx">Forgot Password?</a>
                                                    </div>
                                                    <asp:Button ID="btn_login" runat="server" Text="LogIn" CssClass="btn btn-danger" OnClick="btn_login_Click" />
                                                </div>
                                           
                                        </div>
                                    </div>
                                </div>
                                <div id="lg2" class="tab-pane">
                                    <div class="login-form-container">
                                         <div ><span style="color:red"><%= Session["msg"] %></span> </div>
                                        <div class="login-register-form">
                                            <asp:TextBox ID="txt_user_name" runat="server" placeholder="Username"></asp:TextBox>
                                            <asp:TextBox ID="txt_user_password"   runat="server" placeholder="Password"></asp:TextBox>
                                            <asp:TextBox ID="txt_user_email"   runat="server" placeholder="Email"></asp:TextBox>
                                            <asp:TextBox ID="txt_mobile"   runat="server" placeholder="Mobile No"></asp:TextBox>
                                               <div class="button-box">
                                          
                                             <asp:Button ID="btn_register" CssClass="btn btn-danger" OnClick="btn_register_Click" OnClientClick="return validation()" Text="Register" runat="server" />       
                                          </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

</asp:Content>
