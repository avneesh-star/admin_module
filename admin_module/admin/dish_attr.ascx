<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="dish_attr.ascx.cs" Inherits="admin_module.dish_attr" %>
 <div id="divcon" class="row" runat="server">
                        
							<div class="col-4">
								<asp:TextBox id="txt_attribute" class="form-control" runat="server" placeholder="Attribute" ></asp:TextBox>
							</div>
                           
							<div class="col-3">
								
                                <asp:TextBox id="txt_price" class="form-control" runat="server" placeholder="Price" ></asp:TextBox>
							</div>
							<div class="col-3">
								<asp:DropDownList ID="ddl_status" runat="server" class="form-control"  >
                                     <asp:ListItem Text="Select Status" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="Active" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="Deactive" Value="0"></asp:ListItem>
								</asp:DropDownList>
							</div>
                            <asp:Button ID="btn_remove" runat="server" CssClass="btn badge-danger mr-2" OnClick="btn_remove_Click">
						</div>