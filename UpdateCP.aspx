<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UpdateCP.aspx.cs" Inherits="UpdateCP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Collection Point</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Current Collection Point:<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <br />
        <br />
        Select Collection Point:<br />
        <asp:RadioButtonList ID="RadioButtonList1" runat="server">
            <asp:ListItem>Medical School (9:30AM)</asp:ListItem>
            <asp:ListItem>Science School (9:30AM)</asp:ListItem>
            <asp:ListItem>Stationery Store (9:30AM) --Adminstration Building</asp:ListItem>
            <asp:ListItem>Management School(11:00AM)</asp:ListItem>
            <asp:ListItem>Engineering School (11:00AM)</asp:ListItem>
            <asp:ListItem>University Hospital (11:00AM)</asp:ListItem>
        </asp:RadioButtonList>
    
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select one point." ControlToValidate="RadioButtonList1" ForeColor="Red"></asp:RequiredFieldValidator>
    
        <br />
        <asp:Button ID="Button1" runat="server" Text="Confirm" OnClick="Button1_Click" />
    
    </div>
    </form>
</body>
</html>
