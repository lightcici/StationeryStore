<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Button ID="Button1" runat="server" Text="Add Item" OnClick="Button1_Click" />
    <asp:GridView ID="cartGridView" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowCommand">
        <Columns>
            <asp:TemplateField HeaderText="Item">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("cat") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("description") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="quantity" runat="server" TextMode="Number" min="0" Text='<%#Eval("quantity") %>'></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>

            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lnkdelete" runat="server" CommandName="Delete" >Delete</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>



        </Columns>
    </asp:GridView>
    <asp:Button ID="Button2" runat="server" Text="Clear Cart" OnClick="Button2_Click" />
    <asp:Button ID="Button3" runat="server" Text="Submit" OnClick="Button3_Click" />
</asp:Content>

