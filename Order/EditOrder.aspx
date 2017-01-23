<%@ Page Title="" Language="C#" ValidateRequest="false" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="EditOrder.aspx.cs" Inherits="Order_EditOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style10 {
            width: 88px;
            height: 35px;
            background-color: #558C89;
            color: white;
        }
        .auto-style11 {
            height: 35px;
        }
        .auto-style12 {
            height: 37px;
        }
        .auto-style13 {
            width: 88px;
            height: 37px;
            background-color: #558C89;
            color: white;
        }
        .auto-style14 {
            width: 88px;
            height: 27px;
            background-color: #558C89;
            color: white;
        }
        .auto-style15 {
            height: 27px;
        }
        .auto-style16 {
            width: 88px;
            height: 60px;
            background-color: #558C89;
            color: white;
        }
        .auto-style17 {
            height: 60px;
        }
        .auto-style18 {
            width: 491px;
            height: 35px;
            background-color: #558C89;
            color: white;
        }
        .auto-style19 {
            width: 491px;
            height: 37px;
            background-color: #558C89;
            color: white;
        }
        .auto-style20 {
            width: 491px;
            height: 27px;
            background-color: #558C89;
            color: white;
        }
        .auto-style21 {
            width: 491px;
            height: 60px;
            background-color: #558C89;
            color: white;
        }
        .auto-style23 {
            width: 88px;
            height: 44px;
            background-color: #558C89;
            color: white;
        }
        .auto-style24 {
            height: 44px;
        }
        .auto-style25 {
            width: 491px;
            height: 44px;
            background-color: #558C89;
            color: white;
        }
        .auto-style26 {
            height: 53px;
        }
        .auto-style27 {
            width: 491px;
            height: 53px;
            background-color: #558C89;
            color: white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type = "text/javascript" >
        function preventBack(){window.history.forward();}
        setTimeout("preventBack()", 0);
        window.onunload=function(){null};
    </script> 

     <table>
        <tr>
         <td class="auto-style10">
            &nbsp;
              <asp:Label ID="Label5" runat="server" Text="Order ID"></asp:Label></td> 
        <td class="auto-style11">:</td>
          <td class="auto-style18">
             <asp:Label ID="OrderIDLbl" runat="server" Text="Label"></asp:Label></td>
     </tr>
     <tr>
         <td class="auto-style13">
            &nbsp;
              <asp:Label ID="Label1" runat="server" Text="Item ID"></asp:Label></td> 
        <td class="auto-style12">:</td>
          <td class="auto-style19">
             <asp:Label ID="ItemIDLbl" runat="server" Text="Label"></asp:Label></td>
     </tr>
      <tr>
         <td class="auto-style14">
            &nbsp; <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label></td>
         <td class="auto-style15">:</td>
          <td class="auto-style20" valign="top">
             <asp:Label ID="DescriptionLbl" runat="server" Text="Label"></asp:Label></td>
     </tr>
      <tr>
         <td class="auto-style16">
             <asp:Label ID="Label3" runat="server" Text="*Quantity"></asp:Label></td>
        <td class="auto-style17">:</td>
           <td class="auto-style21">
             <asp:TextBox ID="QuantityTextBox" runat="server" Width="50px" MaxLength="3"></asp:TextBox>                       
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="QuantityTextBox" Display="Dynamic" ErrorMessage="Quantity must be a number greater than 0!" ForeColor="Red" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="QuantityTextBox" Display="Dynamic" ErrorMessage="Quantity cannot be null!" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
     </tr>
      <tr>
         <td class="auto-style23"  Valign="top">
           &nbsp;
             <asp:Label ID="Label4" runat="server" Text="Justification" Font-Overline="False" ></asp:Label></td>
        <td Valign="top" class="auto-style24">:</td>
           <td class="auto-style25">
             <asp:TextBox ID="JustificationTextBox" runat="server" Height="93px" TextMode="MultiLine" Width="250px"></asp:TextBox></td>
     </tr>
      <tr>
          <td colspan="2" class="auto-style26"></td>
         <td class="auto-style27">
             <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClick="SubmitBtn_Click"/>
             <asp:Button ID="CancelBtn" runat="server" Text="Cancel Order" OnClick="CancelBtn_Click" />
             </td>
     </tr>
 </table>
</asp:Content>

