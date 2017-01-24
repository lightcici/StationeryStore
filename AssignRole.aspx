<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AssignRole.aspx.cs" Inherits="AssignRole" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        Show Existing:<asp:TextBox ID="TextBox1" runat="server" ReadOnly="true"></asp:TextBox>
        <br />
        Covering Head:<asp:DropDownList ID="DropDownList1" runat="server" CausesValidation="false">
        </asp:DropDownList>
        <br />
        Please select start date and end date of convering officer.<br />
        start date:<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" TargetControlID="TextBox2" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please select Start day." ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
        end date:<asp:TextBox ID="TextBox3" runat="server" ></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" TargetControlID="TextBox3" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please select End day." ControlToValidate="TextBox3" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <br />
        <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" style="height: 26px" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Revoke Delegate" OnClick="Button2_Click" />
    
        <br />
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <br />
    </div>          
    
    </form>
</body>
</html>
