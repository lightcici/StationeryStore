<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderList.aspx.cs" Inherits="Order_OrderList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
        <asp:Button ID="OrderBtn" runat="server" Text="New Order" OnClick="OrderBtn_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="SearchDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SearchDDL_SelectedIndexChanged" DataTextField="--Choose Order Status--">
            <asp:ListItem Selected disabled hidden>--Choose Order Status--</asp:ListItem>
            <asp:ListItem>Show All</asp:ListItem>
            <asp:ListItem>PendingApproval</asp:ListItem>
            <asp:ListItem>Approved</asp:ListItem>
            <asp:ListItem>Ordered</asp:ListItem>
            <asp:ListItem>Rejected</asp:ListItem>
            <asp:ListItem>Completed</asp:ListItem>
            <asp:ListItem>Cancelled</asp:ListItem>
        </asp:DropDownList>
    </div>
        <asp:Label ID="Label2" runat="server" Font-Size="Small" ForeColor="Black" Text="Label" Font-Bold="True"></asp:Label>
        <br />
        <asp:GridView ID="OrderListGV" runat="server" OnRowCreated="OrderListGV_RowCreated" OnSelectedIndexChanged="OrderListGV_SelectedIndexChanged" Width="320px" CssClass="auto-style1">
            <Columns>
                <asp:ButtonField CommandName="Select" Text="Proceed" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red"></asp:Label>
</asp:Content>

