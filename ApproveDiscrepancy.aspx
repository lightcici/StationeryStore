<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApproveDiscrepancy.aspx.cs" Inherits="ApproveDiscrepancy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" DataKeyNames="DiscrepancyID">
                <Columns>
                    <asp:BoundField DataField="DiscrepancyID" HeaderText="DiscrepancyID" SortExpression="DiscrepancyID" />
                    <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btn1" CommandName="Approved" CommandArgument='<%#Eval("DiscrepancyID") %>' runat="server" Text="Approve" />
                            <asp:Button ID="btn2" CommandName="Rejected" CommandArgument='<%#Eval("DiscrepancyID") %>' runat="server" Text="Reject" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<asp:ButtonField ButtonType="Button" CommandName="Approve" Text="Approve" />
                <asp:ButtonField ButtonType="Button" CommandName="Reject" Text="Reject" />  --%>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Team5ADProjectConnectionString %>" SelectCommand="SELECT d.DiscrepancyID, i.ItemID, i.Description, d.Quantity, d.Reason, s.Price FROM Item AS i INNER JOIN Discrepancy AS d ON i.ItemID = d.ItemID INNER JOIN SupplyDetails AS s ON i.ItemID = s.ItemID WHERE (s.Price &gt; 250) AND (d.Status = 'Pending Approval')" ProviderName="System.Data.SqlClient"></asp:SqlDataSource>

            <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="#558C89" Visible="False"></asp:Label>

        </div>
    </form>
</body>
</html>
