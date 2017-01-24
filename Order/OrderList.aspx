<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderList.aspx.cs" Inherits="Order_OrderList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div>
        <asp:Button ID="OrderBtn" runat="server" Text="New Order" OnClick="OrderBtn_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="SearchDDL" runat="server" AutoPostBack="True" OnSelectedIndexChanged="SearchDDL_SelectedIndexChanged">
        </asp:DropDownList>
    </div>
        <asp:Label ID="Label2" runat="server" Font-Size="Small" ForeColor="Black" Text="Label" Font-Bold="True"></asp:Label>
        <br />
        <asp:GridView ID="OrderListGV" runat="server" OnRowCreated="OrderListGV_RowCreated" OnSelectedIndexChanged="OrderListGV_SelectedIndexChanged" Width="320px" CssClass="auto-style1" AutoGenerateColumns="False">
            <Columns>
             <asp:TemplateField HeaderText="OrderID">
                <ItemTemplate>
                    <asp:Label ID="orderid" runat="server" Text='<%#Eval("orderId") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="ItemID">
                <ItemTemplate>
                    <asp:Label ID="itemid" runat="server" Text='<%#Eval("itemId") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>

        <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <asp:Label ID="desc" runat="server" Text='<%#Eval("description") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:Label ID="qty" runat="server" Text='<%#Eval("quantity") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Justification">
                <ItemTemplate>
                    <asp:Label ID="justification" runat="server" Text='<%#Eval("justification") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <asp:Label ID="stt" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>

    
                <asp:ButtonField CommandName="Select" Text="Proceed" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="Label1" runat="server" Text="Label" ForeColor="Red"></asp:Label>
</asp:Content>

