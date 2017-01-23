<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangeRep.aspx.cs" Inherits="ChangeRep" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Current Department Rep:<asp:TextBox ID="TextBox1" runat="server" ReadOnly="true"></asp:TextBox>
        <br />
        Appoint New Department Rep:<asp:DropDownList ID="DropDownList1" runat="server">
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please select one person." ControlToValidate="DropDownList1" ForeColor="Red" ></asp:RequiredFieldValidator>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
        <br />
        <br />
       
    </div>
    </form>
</body>
</html>
