<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewDiscrepancy.aspx.cs" Inherits="NewDiscrepancy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label1" runat="server" Text="Item Code:"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label2" runat="server" Text="Description:"></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server" ReadOnly="true"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Text="Value($):"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" ReadOnly="true"></asp:TextBox>
            per item<br />
            <br />
            <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="*Negative: decrease stock number ,positive: increase stock number."></asp:Label>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Quantity:"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
            &nbsp;
            <br />
            <br />
            <asp:Label ID="Label4" runat="server" Text="Reason:"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        </div>

    </form>
</body>
</html>
