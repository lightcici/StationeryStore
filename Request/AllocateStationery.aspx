<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AllocateStationery.aspx.cs" Inherits="Request_AllocateStationery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" AllowSorting="True" OnSorting="GridView1_Sorting">
         <Columns>
            <asp:TemplateField HeaderText="Item Description" SortExpression ="Item">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("description") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Requester" SortExpression ="Requester">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("userName") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Request Date">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("date") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="Needed">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("neededQty")%>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
             <asp:TemplateField HeaderText="UOM">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("uom")%>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Allocated">
                <ItemTemplate>
                    <asp:TextBox ID="allocated" runat="server" TextMode="Number" min="0" ></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click1" />
</asp:Content>

