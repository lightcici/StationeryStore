<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MaintainCatalogueList2.aspx.cs" Inherits="MaintainCatalogueList2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    Item Code:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="RequiredFieldValidator">
          please enter item code</asp:RequiredFieldValidator> 
        <br />
        Category:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="DropDownList1" runat="server"
            AutoPostBack="True" ViewStateMode="Enabled"></asp:DropDownList>
        &nbsp;<br />
        Description:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="RequiredFieldValidator">please enter 
            description
        </asp:RequiredFieldValidator>
        <br />
        ReorderLevel:&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="RequiredFieldValidator">
            please enter reorder level</asp:RequiredFieldValidator>
        <br />
        Reorder Qty:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
            ControlToValidate="TextBox5" ErrorMessage="RequiredFieldValidator">please enter reorder qty</asp:RequiredFieldValidator>
        <br />
        Unit of Measure: <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
            ControlToValidate="TextBox6" ErrorMessage="RequiredFieldValidator">please enter unit of measure</asp:RequiredFieldValidator>
        <br />
         Bin No: <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="TextBox7" ErrorMessage="RequiredFieldValidator">please enter bin no</asp:RequiredFieldValidator>
        <br />
        


    </div>
        <asp:Button ID="Button1" runat="server" Text="Save" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Cancel" CausesValidation="false" OnClick="Button2_Click" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    </form>
</body>
</html>
