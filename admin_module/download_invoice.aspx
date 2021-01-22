<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="download_invoice.aspx.cs" Inherits="admin_module.download_invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="x-apple-disable-message-reformatting" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title></title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/css/animate.css" rel="stylesheet" />

    <script language="javascript">  
        function printPartOfPage(elementId) {  
            var printContent = document.getElementById(elementId);  
            var windowUrl = 'about:blank';  
            var uniqueName = new Date();  
            var windowName = 'Print' + uniqueName.getTime();  
            var printWindow = window.open(windowUrl, windowName, 'left=50000,top=50000,width=0,height=0');  
  
            printWindow.document.write(printContent.innerHTML);  
            printWindow.document.close();  
            printWindow.focus();  
            printWindow.print();  
            printWindow.close();  
        }  
    </script> 
</head>
<body>
    <form id="form1" runat="server">
     <div class="row" id="div_pr">
              <div class="col-lg-6">
                <div class="card px-1">
                    <asp:Repeater ID="rp_order_master" runat="server" OnItemDataBound="rp_order_master_ItemDataBound">
                        <ItemTemplate>
                  <div class="card-body">
                    <div class="container-fluid">
                      <h3 class="text-right my-5">Order ID&nbsp;&nbsp;<%# Eval("order_id")  %></h3>
                      <hr />
                    </div>
                    <div class="container-fluid d-flex justify-content-between">
                      <div class="col-lg-3 pl-0">
                        <p class="mt-5 mb-2"><b>Express Food</b></p>
                        <p>Shop Address
                            abc<br />
                            124567892<br />
                            abc@mail.com<br />
                        </p>
                      </div>
                      <div class="col-lg-3 pr-0">
                        <p class="mt-5 mb-2 text-right"><b>Invoice to</b></p>
                        <p class="text-right">
							<%# Eval("name")  %><br/>
                            <%# Eval("email")  %>/<%# Eval("mobile")  %><br/>
							<%# Eval("address")  %><br/>
							<%# Eval("pincode")  %><br/>
						</p>
                      </div>
                    </div>
                    <div class="container-fluid d-flex justify-content-between">
                      <div class="col-lg-3 pl-0">
                        <p class="mb-0 mt-5">Order Date : <%# Eval("added_on")  %></p>
                      </div>
                    </div>
                    <div class="container-fluid mt-5 d-flex justify-content-center w-100">
                      <div class="table-responsive w-100">
                          <asp:Repeater ID="rp_order_detail" runat="server">
                              <HeaderTemplate>
                        <table class="table">
                          <thead>
                            <tr class="bg-light">
                              <th>#</th>
                              <th>Description</th>
                              <th class="text-right">Quantity</th>
                              <th class="text-right">Unit cost</th>
                              <th class="text-right">Total</th>
                            </tr>
                          </thead>
                             <tbody>
                            </HeaderTemplate>
                              <ItemTemplate>
                            <tr class="text-right">
                              <td class="text-left"><%# Container.ItemIndex+1 %></td>
                              <td class="text-left"><%# Eval("dish_name") %>(<%# Eval("attribute") %>)</td>
                              <td><%# Eval("quantity") %></td>
                              <td><%# Eval("price") %></td>
                              <td><%# Convert.ToInt32(Eval("quantity").ToString())*Convert.ToInt32(Eval("price").ToString()) %></td>
                            </tr>
                                </ItemTemplate>
                              <FooterTemplate>
                                  </tbody>
                                   </table>
                              </FooterTemplate>
                              </asp:Repeater>
                      </div>
                    </div>
                    <div class="container-fluid mt-5 w-100">
                      <h4 class="text-right mb-5">Total : <%# Eval("total_price") %></h4>
					 
						  <%--<h4 class="text-right mb-5">Coupon Code :</h4>
						  <h4 class="text-right mb-5">Final Total :</h4>--%>
						
                      <hr />
                    </div>
                  </div>
                    </ItemTemplate>
				  </asp:Repeater>
                </div>
              </div> 
                </div>

<button onclick="printPartOfPage('div_pr')">Print</button>
    </form>
</body>
</html>
