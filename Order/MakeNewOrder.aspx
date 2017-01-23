<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MakeNewOrder.aspx.cs" Inherits="Order_MakeNewOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style10 {
            width: 88px;
            height: 33px;
            background-color: #558C89;
            color: white;
        }
        .auto-style11 {
            height: 33px;
        }
        .auto-style12 {
            width: 16px;
            height: 33px;
            background-color: #558C89;
            color: white;
        }
        .auto-style13 {
            width: 16px;
            height: 77px;
            background-color: #558C89;
            color: white;
        }
        .auto-style17 {
            width: 8%;
            height: 19px;
            vertical-align: top;
            background-color: #558C89;
            color: white;
        }
        .auto-style18 {
            width: 16px;
            height: 19px;
            background-color: #558C89;
            color: white;
        }
        .auto-style19 {
            height: 19px;
        }
        .auto-style20 {
            width: 88px;
            height: 37px;
            background-color: #558C89;
            color: white;
        }
        .auto-style21 {
            width: 16px;
            height: 37px;
            background-color: #558C89;
            color: white;
        }
        .auto-style22 {
            height: 37px;
        }
        .auto-style23 {
            width: 88px;
            height: 77px;
            background-color: #558C89;
            color: white;
        }
        .auto-style24 {
            height: 77px;
        }
        .auto-style25 {
            width: 699px;
            height: 254px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <script type = "text/javascript" >
        function preventBack(){window.history.forward();}
        setTimeout("preventBack()", 0);
        window.onunload=function(){null};
    </script> 

    <table class="auto-style25">
     <tr>
         <td class="auto-style10">
            &nbsp;
              <asp:Label ID="Label1" runat="server" Text="Item ID"></asp:Label></td> 
        <td class="auto-style12">:</td>
          <td class="auto-style11">
             <asp:Label ID="ItemIDLbl" runat="server" Text="Label"></asp:Label></td>
     </tr>
      <tr>
         <td class="auto-style20" valign="top">
            &nbsp; <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label></td>
         <td class="auto-style21">:</td>
          <td class="auto-style22">
             <asp:Label ID="DescriptionLbl" runat="server" Text="Label"></asp:Label></td>
     </tr>
      <tr>
         <td class="auto-style17">
             <asp:Label ID="Label3" runat="server" Text="*Quantity"></asp:Label></td>
        <td class="auto-style18">:</td>
           <td class="auto-style19">
             <asp:TextBox ID="QuantityTextBox" runat="server" Width="50px" MaxLength="3"></asp:TextBox>                       
         </td>
          <td class="auto-style19">
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="QuantityTextBox" Display="Dynamic" ErrorMessage="Quantity must be an integer greater than 0!" ForeColor="Red" Operator="GreaterThan" Type="Integer" ValueToCompare="0"></asp:CompareValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="QuantityTextBox" Display="Dynamic" ErrorMessage="Quantity cannot be null!" ForeColor="Red"></asp:RequiredFieldValidator>
          </td>
     </tr>
      <tr>
         <td class="auto-style23"  valign="top">
           &nbsp;
             <asp:Label ID="Label4" runat="server" Text="Justification" Font-Overline="False" ></asp:Label></td>
        <td valign="top" class="auto-style13">:</td>
           <td class="auto-style24">
             <asp:TextBox ID="JustificationTextBox" runat="server" Height="93px" TextMode="MultiLine"></asp:TextBox></td>
     </tr>
      <tr>
         <td align="right" colspan="3">
             <asp:Button ID="SubmitBtn" runat="server" Text="Submit" OnClick="SubmitBtn_Click"/>
             </td>
     </tr>
 </table>
</asp:Content>

