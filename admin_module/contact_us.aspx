<%@ Page Title="" Language="C#" MasterPageFile="~/user.Master" AutoEventWireup="true" CodeBehind="contact_us.aspx.cs" Inherits="admin_module.contact_us" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function sendmsg() {
            $.ajax({
                url: 'forcart.asmx/sendmsg',
                type: 'post',
                contentType: 'application/json;charset=utf-8',
                dataType: 'json',
                data: "{a:'" + $("#name").val() + "',b:'" + $("#mobile").val() + "',c:'" + $("#email").val() + "',d:'" + $("#subject").val() + "',e:'" + $("#message").val() + "'}",
                success: function () {
                    swal("", "Your messege sent be are contact to you soon!", "success");
                },
                error: function () {
                    swal("", "Somthing worng! Messege not send!!", "error");
                },
            });
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    	<div class="breadcrumb-area gray-bg">
            <div class="container">
                <div class="breadcrumb-content">
                    <ul>
                        <li><a href="shop.aspx">Shop</a></li>
                        <li class="active"> Contact Us </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="contact-area pt-100 pb-100">
            <div class="container">
                <div class="row">
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="contact-info-wrapper text-center mb-30">
                            <div class="contact-info-icon">
                                <i class="ion-ios-location-outline"></i>
                            </div>
                            <div class="contact-info-content">
                                <h4>Our Location</h4>
                                <p>012 345 678 / 123 456 789</p>
                                <p><a href="#">info@example.com</a></p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="contact-info-wrapper text-center mb-30">
                            <div class="contact-info-icon">
                                <i class="ion-ios-telephone-outline"></i>
                            </div>
                            <div class="contact-info-content">
                                <h4>Contact us Anytime</h4>
                                <p>Mobile: 012 345 678</p>
                                <p>Fax: 123 456 789</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-12">
                        <div class="contact-info-wrapper text-center mb-30">
                            <div class="contact-info-icon">
                                <i class="ion-ios-email-outline"></i>
                            </div>
                            <div class="contact-info-content">
                                <h4>Write Some Words</h4>
                                <p><a href="#">Support24/7@example.com </a></p>
                                <p><a href="#">info@example.com</a></p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="contact-message-wrapper">
                            <h4 class="contact-title">GET IN TOUCH</h4>
                            <div class="contact-message">
                                
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="contact-form-style mb-20">
                                                
                                                <input id="name" placeholder="Full Name"  type="text" required="required" />
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="contact-form-style mb-20">
                                                <input id="mobile" placeholder="mobile" type="number" required="required" />
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="contact-form-style mb-20">
                                                <input id="email" placeholder="Email Address" type="email" required="required" />
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="contact-form-style mb-20">
                                                <input id="subject" placeholder="Subject" type="text" required="required" />
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="contact-form-style">
                                                <textarea id="message" placeholder="Message" required="required"></textarea>
                                                <button class="submit btn-style" type="submit" id="btn_send" onclick="sendmsg()">SEND MESSAGE</button>
                                            </div>
                                        </div>
                                    </div>
                               
                                <p class="form-messege"></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
</asp:Content>
