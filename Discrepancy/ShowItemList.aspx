<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShowItemList.aspx.cs" Inherits="ShowItemList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript">
        var prevselitem = null;
        function selectx(row) {
            if (prevselitem != null) {
                prevselitem.style.backgroundColor = '#ffffff';
            }
            row.style.backgroundColor = 'PeachPuff';
            prevselitem = row;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label2" runat="server" Text="Item List"></asp:Label>

        </div>
        <asp:Label ID="Label3" runat="server" Text="Categoty:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Search" OnClick="Button1_Click" />
        <div>
            <asp:GridView ID="GridView1" runat="server" OnRowDataBound="GridView1_RowDataBound" DataKeyNames="ItemID,Description" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging">
                <Columns>
                    <asp:TemplateField>

                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# string.Format("NewDiscrepancy.aspx?id={0}&description={1}", Eval("ItemID"),Eval("Description"))%>'>New Discrepancy</asp:HyperLink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <SelectedRowStyle BackColor="#FFCC00" />
            </asp:GridView>
        </div>
    </form>
</body>
</html>
