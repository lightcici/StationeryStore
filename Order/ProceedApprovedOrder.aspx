<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProceedApprovedOrder.aspx.cs" Inherits="Order_ProceedApprovedOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style10 {
            width: 113px;
            height: 30px;
            margin-left: 9px;
        }
        .auto-style11 {
            height: 93px;
            background-color: #558C89;
            color: white;
            padding-left: 0em;
            padding-right: 0em;
        }
        .auto-style12 {
            width: 486px;
        }
        .auto-style13 {
            width: 486px;
            height: 30px;
            margin-left: 9px;
        }
        .auto-style14 {
            height: 81px;
            background-color: #558C89;
            color: white;
            width: 486px;
            padding-left: 0em;
            padding-right: 0em;
        }
        .auto-style15 {
            height: 93px;
            width: 113px;
            background-color: #558C89;
            color: white;
            font-family: 'Comic Sans MS';
        }
        .auto-style16 {
            height: 81px;
            vertical-align: top;
            width: 113px;
        }
        .auto-style17 {
            height: 81px;
        }
        .auto-style18 {
            width: 88px;
            height: 74px;
            background-color: #558C89;
            color: white;
        }
        .auto-style19 {
            height: 43px;
            width: 113px;
            background-color: #558C89;
            color: white;
            font-family: 'Comic Sans MS';
        }
        .auto-style20 {
            height: 43px;
        }
        .auto-style21 {
            width: 486px;
            height: 43px;
            margin-left: 9px;
        }
        .auto-style22 {
            height: 37px;
            width: 113px;
            background-color: #558C89;
            color: white;
            font-family: 'Comic Sans MS';
        }
        .auto-style23 {
            height: 37px;
        }
        .auto-style24 {
            width: 486px;
            height: 37px;
            margin-left: 9px;
        }
        .auto-style25 {
            height: 34px;
            width: 113px;
            background-color: #558C89;
            color: white;
            font-family: 'Comic Sans MS';
        }
        .auto-style26 {
            height: 34px;
        }
        .auto-style27 {
            width: 486px;
            height: 34px;
            margin-left: 9px;
        }
        .auto-style28 {
            height: 33px;
            width: 113px;
            background-color: #558C89;
            color: white;
            font-family: 'Comic Sans MS';
        }
        .auto-style29 {
            height: 33px;
        }
        .auto-style30 {
            width: 486px;
            height: 33px;
            margin-left: 9px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type = "text/javascript" >
        function preventBack(){window.history.forward();}
        setTimeout("preventBack()", 0);
        window.onunload=function(){null};
    </script>
    <table cellpadding="10">
          <tr>
        <td class="auto-style19">&nbsp;<asp:Label ID="Label1" runat="server" Text="OrderID "></asp:Label></td>
        <td class="auto-style20">:</td>
        <td  class="auto-style21"><asp:Label ID="OrderIDLbl" runat="server" Text="Label"></asp:Label></td>
        </tr>

           <tr>
        <td class="auto-style22">&nbsp;<asp:Label ID="Label2" runat="server" Text="Item ID "></asp:Label></td>
        <td class="auto-style23">:</td>
         <td  class="auto-style24"><asp:Label ID="ItemIDLbl" runat="server" Text="Label"></asp:Label></td>
        </tr>

          <tr>
        <td class="auto-style25">&nbsp;<asp:Label ID="Label3" runat="server" Text="Description "></asp:Label></td>
        <td class="auto-style26">:</td>
              <td  class="auto-style27"><asp:Label ID="DescriptionLbl" runat="server" Text="Label"></asp:Label></td>
        </tr>

          <tr>
        <td class="auto-style28">&nbsp;<asp:Label ID="Label4" runat="server" Text="Total Quantity "></asp:Label></td>
        <td class="auto-style29">:</td>
              <td  class="auto-style30"><asp:Label ID="TotalQtyLbl" runat="server" Text="Label"></asp:Label></td>
        </tr>

          <tr>
        <td Valign="top" class="auto-style16">
            <asp:CheckBox ID="Supplier1CB" runat="server" Text="1st Supplier" OnCheckedChanged="Supplier1CB_CheckedChanged" AutoPostBack="True" />
              </td>
              <td Valign="top" class="auto-style17">:</td>
        <td class="auto-style14">
            <asp:Label ID="Supplier1Lbl" runat="server" Text="Label"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label11" runat="server" Text="Quantity:" ClientIDMode="Static"></asp:Label>&nbsp;<asp:TextBox ID="QuantityTextBox1" runat="server" Width="50px" MaxLength="3"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="QuantityTextBox1" ErrorMessage="Quantity must be integer greater than 0!" Font-Size="Small" ForeColor="Red" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
            <br />
            <asp:Label ID="SupplierDetails1Lbl" runat="server" Text="Label"></asp:Label>
            <br />
              </td>
               </tr>

          <tr>
        <td Valign="top" class="auto-style15">
            <asp:CheckBox ID="Supplier2CB" runat="server" Text="2nd Supplier" OnCheckedChanged="Supplier2CB_CheckedChanged" AutoPostBack="True" />
              </td>
              <td Valign="top">:</td>
        <td class="auto-style13">
            <asp:Label ID="Supplier2Lbl" runat="server" Text="Label"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label12" runat="server" Text="Quantity:" ClientIDMode="Static"></asp:Label>&nbsp;<asp:TextBox ID="QuantityTextBox2" runat="server" Width="50px" MaxLength="3"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="QuantityTextBox2" ErrorMessage="Quantity must be integer greater than 0!" Font-Size="Small" ForeColor="Red" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
            <br />
            <asp:Label ID="SupplierDetails2Lbl" runat="server" Text="Label"></asp:Label>
            <br />
              </td>
  
          </tr>

         <tr>
        <td Valign="top" class="auto-style10">
            <asp:CheckBox ID="Supplier3CB" runat="server" Text="3rd Supplier" OnCheckedChanged="Supplier3CB_CheckedChanged" AutoPostBack="True" />
             </td>
             <td Valign="top" class="auto-style11">:</td>
        <td class="auto-style12">
            <asp:Label ID="Supplier3Lbl" runat="server" Text="Label"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label13" runat="server" Text="Quantity:" ClientIDMode="Static"></asp:Label>&nbsp;<asp:TextBox ID="QuantityTextBox3" runat="server" Width="50px" MaxLength="3"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="QuantityTextBox3" ErrorMessage="Quantity must be integer greater than 0!" Font-Size="Small" ForeColor="Red" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
            <br />
            <asp:Label ID="SupplierDetails3Lbl" runat="server" Text="Label"></asp:Label>
            <br />
             </td>

         </tr>
 
          <tr>
              <td colspan="3" align="right" class="auto-style18"><asp:Button ID="OrderBtn" runat="server" Text="Order" OnClick="OrderBtn_Click" />
                  <br />
                  <asp:Label ID="Label14" runat="server" Font-Bold="True" Font-Size="Small" ForeColor="Red" Text="Label"></asp:Label>
              </td>
          </tr>       
</table>
</asp:Content>

