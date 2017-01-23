<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ApproveDiscrepancy.aspx.cs" Inherits="ApproveDiscrepancy" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" Font-Underline="True" Text="Discrepancies"></asp:Label>
            <br />
            <asp:GridView ID="GridView1" runat="server" OnRowCommand="GridView1_RowCommand" OnRowCreated="GridView1_RowCreated" DataKeyNames="DiscrepancyID">
                <Columns>

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btn11" CommandName="Approved" CommandArgument='<%#Eval("DiscrepancyID") %>' runat="server" Text="Approve" />
                            <asp:Button ID="btn12" CommandName="Rejected" CommandArgument='<%#Eval("DiscrepancyID") %>' runat="server" Text="Reject" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>

            <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="#558C89" Visible="False"></asp:Label>

            <br />
            <br />
            <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Italic="True" Font-Underline="True" Text="Discrepancy History"></asp:Label>
            <br />
            <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="DiscrepancyID" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="DiscrepancyID" HeaderText="DiscrepancyID" ReadOnly="True" SortExpression="DiscrepancyID" />
                    <asp:BoundField DataField="UserID" HeaderText="Requester" SortExpression="UserID" />
                    <asp:BoundField DataField="ItemID" HeaderText="ItemID" SortExpression="ItemID" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
                    <asp:BoundField DataField="Reason" HeaderText="Reason" SortExpression="Reason" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Team5ADProjectConnectionString %>" SelectCommand="SELECT DiscrepancyID, UserID, ItemID, Quantity, Reason, Status FROM Discrepancy AS d WHERE (Status = 'Approved') OR (Status = 'Rejected')"></asp:SqlDataSource>
            <br />

        </div>
    </form>
</body>
</html>
