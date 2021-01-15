<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="admin_module.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Food Ordering Admin</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    
    <!-- plugins:css -->
    <link rel="stylesheet" href="assets/css/materialdesignicons.min.css" />
    <link rel="stylesheet" href="assets/css/vendor.bundle.base.css" />
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="assets/css/bootstrap-datepicker.min.css" />
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="assets/css/style.css" />
</head>
<body>
    

    <div class="container-scroller" ">
        <div class="container-fluid page-body-wrapper full-page-wrapper">
            <div class="content-wrapper d-flex align-items-center auth">
                <div class="row w-100">
                    <div class="col-lg-4 mx-auto">
                        <div class="auth-form-light text-left p-5">
                            <div class="brand-logo text-center">
                                <asp:Image src="../assets/logo.png" runat="server" alt="logo" />
                            </div>
                            <h6 class="font-weight-light">Sign in to continue.</h6>
                            <form id="form1" runat="server" class="pt-3">
                                <div class="form-group">

                                    <asp:TextBox ID="txt_email" runat="server" CssClass="form-control form-control-lg"  placeholder="Username"></asp:TextBox>
                                </div>
                                <div class="form-group">

                                    <asp:TextBox ID="txt_password" runat="server" CssClass="form-control form-control-lg" TextMode="Password" placeholder="Password"></asp:TextBox>
                                </div>
                                <div class="mt-3">

                                    <asp:Button ID="btn_signin" runat="server" Text="Sign In" OnClick="btn_signin_Click" CssClass="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" />
                                </div>
                                
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- content-wrapper ends -->
        </div>
        <!-- page-body-wrapper ends -->
    </div>

</body>
</html>
