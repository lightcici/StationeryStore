<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MaintainPurchaseList2.aspx.cs" Inherits="MaintainPurchaseList2" EnableEventValidation = "false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Label ID="Label1" runat="server" Text="Item List" Font-Bold="True" Font-Size="Larger"></asp:Label>
           <br />
           <asp:TextBox ID="SearchTextBox" runat="server"></asp:TextBox>
           <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" />
           &nbsp; 
           <asp:Button ID="ShowAllBtn" runat="server" Text="Show All" OnClick="ShowAllBtn_Click" />
    </div>
        <asp:Label ID="Label2" runat="server"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" DataKeyNames="ItemID" 
            onselectedindexchanged="GridView1_SelectedIndexChanged"
              OnRowDataBound="GridView1_RowDataBound"  AllowPaging="True" 
            OnPageIndexChanging="GridView1_PageIndexChanging" ViewStateMode="Enabled" PageSize="30">
       

        </asp:GridView>
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
    </form>
</body>
</html>
