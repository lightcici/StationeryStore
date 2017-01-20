<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SupervisorApproveDiscrepancy.aspx.cs" Inherits="SupervisorApproveDiscrepancy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" DataKeyNames="DiscrepancyID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="DiscrepancyID" HeaderText="DiscrepancyID" ReadOnly="True" SortExpression="DiscrepancyID" />
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" ReadOnly="True" SortExpression="ItemID" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
                <asp:BoundField DataField="Price" HeaderText="Price" ReadOnly="True" SortExpression="Price" />
                <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btn1" CommandName="Approved" CommandArgument='<%#Eval("DiscrepancyID") %>' runat="server" Text="Approve" />
                            <asp:Button ID="btn2" CommandName="Rejected" CommandArgument='<%#Eval("DiscrepancyID") %>' runat="server" Text="Reject" />
                        </ItemTemplate>
                    </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Team5ADProjectConnectionString %>" SelectCommand="SELECT DISTINCT d.DiscrepancyID, i.ItemID, i.Description, d.Quantity, d.Reason, MAX(s.Price) AS Price FROM Discrepancy AS d INNER JOIN Item AS i ON d.ItemID = i.ItemID INNER JOIN SupplyDetails AS s ON i.ItemID = s.ItemID WHERE (s.Price &lt;= 250) AND (d.Status = 'Pending Approval') GROUP BY d.DiscrepancyID, i.ItemID, i.Description, d.Quantity, d.Reason"></asp:SqlDataSource>
    
            <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="#558C89" Visible="False"></asp:Label>

    </div>
    </form>
</body>
</html>
