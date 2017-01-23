<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AcknowledgeOrder.aspx.cs" Inherits="Order_AcknowledgeOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script type = "text/javascript" >
        function preventBack(){window.history.forward();}
        setTimeout("preventBack()", 0);
        window.onunload=function(){null};
    </script> 

    <asp:Label ID="Label4" runat="server" Text="Order ID:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="OrderIDLbl" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Item ID:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="ItemIDLbl" runat="server" Text="Label"></asp:Label>
        <br />
        <asp:Label ID="Label3" runat="server" Text="Description:"></asp:Label>
&nbsp;<asp:Label ID="DescriptionLbl" runat="server" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server">
        </asp:GridView>
        <br />
    
        
    <asp:Button ID="SubmitBtn" runat="server" Text="Acknowledge" OnClick="SubmitBtn_Click1" />
</asp:Content>

