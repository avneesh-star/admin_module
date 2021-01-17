<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="dlogin.aspx.cs" Inherits="admin_module.deliveryBoy.dlogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <title>Deliver Boy Login</title>
 <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap_css" />
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link href="Style.css" rel="stylesheet" />
    <script type="text/javascript">
        function validation() {
            var msg = "";
            msg = checkno();
            msg += checkpass();
            if (msg == "") {
                return true
            }
            else {
               
                $("#lbl_msg").html(msg);
                return false;
            }
        }
        function checkno() {
            var tt=$("#txtlogin").val();
           if (tt==""){
               return 'Please enter mobile no</br>';
           }
           else {
               return "";
           }
        }
        function checkpass() {
            var tt = $("#password").val();
            if (tt == "") {
                return 'Please enter password</br>';
            }
            else {
                return "";
            }
        }
    </script>
</head>
<body>
   
    
    <div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->

    <!-- Icon -->
    <div class="fadeIn first">
      <img src="logo1.png" id="icon" alt="User Icon" />
    </div>

    <!-- Login Form -->
  <form id="form1" runat="server">
    
      <asp:TextBox ID="txtlogin" runat="server" CssClass="fadeIn second" placeholder="Mobile Number"></asp:TextBox>
   
        <asp:TextBox ID="password" runat="server" TextMode="Password" CssClass="fadeIn third" placeholder="password"></asp:TextBox>
      <asp:Button ID="btn_login" CssClass="fadeIn fourth" runat="server" OnClientClick="return validation()" Text="Log In" OnClick="btn_login_Click" />
  
  </form>
    <!-- Remind Passowrd -->
      <div>
          <asp:Label ID="lbl_msg" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
      </div>
    <div id="formFooter">
      <a class="underlineHover" href="#">Forgot Password?</a>
    </div>

  </div>
</div>
    
    
</body>
</html>
