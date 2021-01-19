<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RazorpayCallBack.aspx.cs" Inherits="admin_module.RazorpayCallBack" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div class="container">
    <div class="jumbotron">
        <h1 runat="server" id="h1Messege"></h1>
        <p runat="server" id="pTxnId"></p>
        <p runat="server" id="pOrderId"></p>
        <p>Click Here go Home</p>
        <p><a class="btn btn-primary btn-lg" role="button" href="payment.aspx">Home</a></p>
    </div>
    </div>
    </form>
</body>
</html>
