<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewDiscrepancy.aspx.cs" Inherits="ViewDiscrepancy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Button ID="Button1" runat="server" Text="New Discrepancy" OnClick="Button1_Click" />
&nbsp;<asp:Label ID="Label1" runat="server" Text="View By:"></asp:Label>
&nbsp;&nbsp;
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" style="height: 29px">
            <asp:ListItem Value="ShowAll">ShowAll</asp:ListItem>
            <asp:ListItem>Approved</asp:ListItem>
            <asp:ListItem>Rejected</asp:ListItem>
            <asp:ListItem Value="Pending Approval">PendingApproval</asp:ListItem>
        </asp:DropDownList>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
        </asp:GridView>
    
    </div>
    </form>
</body>
</html>
