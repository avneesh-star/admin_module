<%@ Page Title="" Language="C#" MasterPageFile="~/admin/adminn.Master" AutoEventWireup="true" CodeBehind="adminHome.aspx.cs" Inherits="admin_module.adminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Dashboard</title>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="cart-main-area pt-95 pb-100">
   <div class="card">
    <div class="card-body">
        <div class="container bootstrap snippet">
  <div class="row">
    <div class="col-lg-2 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading dark-blue"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content dark-blue">
          <div class="circle-tile-description text-faded">Registered Users</div>
          <div class="circle-tile-number text-faded "><asp:Label ID="lbl_users" runat="server"></asp:Label></div>
         
        </div>
      </div>
    </div>
      <div class="col-lg-2 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading red"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content red">
          <div class="circle-tile-description text-faded">1 Day Sale</div>
          <div class="circle-tile-number text-faded "><asp:Label ID="lbl_sale1" runat="server"></asp:Label>&#x20b9;</div>
         
        </div>
      </div>
    </div> 
     
    <div class="col-lg-2 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading red"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content red">
          <div class="circle-tile-description text-faded">7 Days Sale</div>
          <div class="circle-tile-number text-faded "><asp:Label ID="lbl_sale7" runat="server"></asp:Label>&#x20b9;</div>
         
        </div>
      </div>
    </div> 

      <div class="col-lg-2 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading red"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content red">
          <div class="circle-tile-description text-faded">15 Days Sale</div>
          <div class="circle-tile-number text-faded "><asp:Label ID="lbl_sale15" runat="server"></asp:Label>&#x20b9;</div>
         
        </div>
      </div>
    </div> 

      <div class="col-lg-2 col-sm-6">
      <div class="circle-tile ">
        <a href="#"><div class="circle-tile-heading red"><i class="fa fa-users fa-fw fa-3x"></i></div></a>
        <div class="circle-tile-content red">
          <div class="circle-tile-description text-faded">30 Days Sale</div>
          <div class="circle-tile-number text-faded "><asp:Label ID="lbl_sale30" runat="server"></asp:Label>&#x20b9;</div>
         
        </div>
      </div>
    </div> 
  </div> 
</div>  
  
</div>
        </div>
</div>
    
</asp:Content>
