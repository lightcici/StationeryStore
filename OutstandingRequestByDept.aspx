<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OutstandingRequestByDept.aspx.cs" Inherits="OutstandingRequestByDept" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Button ID="ButtonSum" runat="server" OnClick="ButtonSum_Click" Text="ViewSummary" />
        <asp:Button ID="ButtonDept" runat="server" Text="View By Department" />
        <br />
        <asp:PlaceHolder ID="PlaceHolderSum" runat="server"></asp:PlaceHolder>
        <br />
        <asp:PlaceHolder ID="PlaceHolderDept" runat="server"></asp:PlaceHolder>
    
    </div>
    </form>
</body>
</html>
