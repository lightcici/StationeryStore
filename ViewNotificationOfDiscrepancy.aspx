<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ViewNotificationOfDiscrepancy.aspx.cs" Inherits="ViewNotification" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ItemID,Description" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" ReadOnly="True" SortExpression="ItemID" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="InStock" HeaderText="InStock" SortExpression="InStock" />
                <asp:BoundField DataField="ReorderLevel" HeaderText="ReorderLevel" SortExpression="ReorderLevel" />
                <asp:BoundField DataField="ReorderQty" HeaderText="ReorderQuantity" SortExpression="ReorderQuantity" />
                 <asp:TemplateField>

                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# string.Format("~/MakeNewOrder.aspx?ItemID={0}&Description={1}", Eval("ItemID"),Eval("Description"))%>'>Order Now</asp:HyperLink>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
                        </ItemTemplate>
                    </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Team5ADProjectConnectionString %>" SelectCommand="SELECT ItemID, Description, InStock, ReorderLevel, ReorderQty FROM Item AS i WHERE (InStock &lt; ReorderLevel)"></asp:SqlDataSource>
    
    </div>
    </form>
</body>
</html>
