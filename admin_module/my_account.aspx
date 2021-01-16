<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="my_account.aspx.cs" Inherits="admin_module.my_account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <script type="text/javascript">
        function validation() {
            var msg = "";
            msg = checkName();
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
            var tt = $('#<%= txtName.ClientID %>').val();
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
            var tt = $('#<%= txtNewPassword.ClientID %>').val();
            var pp=$('#<%= txtConfirmPassword.ClientID %>').val();
            if (tt == "") {
                alert('Please enter password!!\n');
                return false;
            }
            else if (pp == tt) {
                return true;
            }
            else {
                alert('password mismatch!!\n');
                return false;
            }
        }

        function checkmobile() {
            var tt = $('#<%= txtMobile.ClientID %>').val();
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
    <div class="breadcrumb-area gray-bg">
            <div class="container">
                <div class="breadcrumb-content">
                    <ul>
                        <li><a href="shop.aspx">Shop</a></li>
                        <li class="active">My Account </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- my account start -->
        <div class="myaccount-area pb-80 pt-100">
            <div class="container">
                <div class="row">
                    <div class="ml-auto mr-auto col-lg-9">
                        <div class="checkout-wrapper">
                            <div id="faq" class="panel-group">
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title"><span>1</span> <a data-toggle="collapse" data-parent="#faq" href="#my-account-1">Edit your account information </a></h5>
                                    </div>
                                    <div id="my-account-1" class="panel-collapse collapse show">
                                        <div class="panel-body">
                                            <div class="billing-information-wrapper">
                                                <div class="account-info-wrapper">
                                                    <h4>My Account Information</h4>
                                                    <h5>Your Personal Details</h5>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-6 col-md-6">
                                                        <div class="billing-info">
                                                            <label>Name</label>
                                                            <asp:TextBox ID="txtName" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="col-lg-6 col-md-6">
                                                        <div class="billing-info">
                                                            <label>Email Address</label>
                                                           <asp:TextBox ID="txtEmail" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-6 col-md-6">
                                                        <div class="billing-info">
                                                            <label>Mobile</label>
                                                            <asp:TextBox ID="txtMobile" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12">
                                                        <asp:Label ID="lbl_msg" runat="server" Font-Bold="true"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="billing-back-btn">
                                                    <div class="billing-back">
                                                        <a href="#"><i class="ion-arrow-up-c"></i> back</a>
                                                    </div>
                                                    <div class="billing-btn">
                                                        <asp:Button ID="btn_update" runat="server" CssClass="btn btn-danger" OnClientClick="return validation()" OnClick="btn_update_Click" Text="Edit" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="panel panel-default">
                                    <div class="panel-heading">
                                        <h5 class="panel-title"><span>2</span> <a data-toggle="collapse" data-parent="#faq" href="#my-account-2">Change your password </a></h5>
                                    </div>
                                    <div id="my-account-2" class="panel-collapse collapse">
                                        <div class="panel-body">
                                            <div class="billing-information-wrapper">
                                                <div class="account-info-wrapper">
                                                    <h4>Change Password</h4>
                                                    <h5>Your Password</h5>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="billing-info">
                                                            <label>Password</label>
                                                            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12">
                                                        <div class="billing-info">
                                                            <label>Password Confirm</label>
                                                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                                        </div>
                                                    </div>
                                                    <div class="col-lg-12 col-md-12">
                                                        <asp:Label ID="lbl" runat="server"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="billing-back-btn">
                                                    <div class="billing-back">
                                                        <a href="#"><i class="ion-arrow-up-c"></i> back</a>
                                                    </div>
                                                    <div class="billing-btn">
                                                    <asp:Button ID="btn_change" runat="server" Text="Change Password" CssClass="btn btn-danger" OnClientClick="return checkpassword()" OnClick="btn_change_Click" />
                                                        
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
            </div>
        </div>
</asp:Content>
