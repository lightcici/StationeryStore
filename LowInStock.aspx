<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LowInStock.aspx.cs" Inherits="LowInStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Label ID="Label1" runat="server" Text="Reminder: Below items are in low stock. Please proceed to order." Font-Size="Medium" ForeColor="Red"></asp:Label>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server">
        <Columns>
        <asp:TemplateField HeaderText="Request ID">
                    <ItemTemplate>
                        <asp:HyperLink runat="server" NavigateUrl='<%# String.Format("/Order/MakeNewOrder.aspx?ItemID={0}&Description={1}",Eval("ItemID"),Eval("Description")) %>'</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
    </asp:GridView>
</asp:Content>

