<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MakeRequest.aspx.cs" Inherits="MakeRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style9 {
            width: 430px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">    
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />
        <br />
        <br />
        <table style="width:100%;">
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td>
        <asp:ImageButton ID="ImageButton1" runat="server" Height="50px" ImageAlign="Left" ImageUrl="~/Image/Shopping Cart Filled-100.png" OnClick="ImageButton1_Click" Width="50px" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">&nbsp;</td>
                <td>
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9">
        <asp:GridView ID="itemGridView" runat="server" AutoGenerateColumns="False" OnPageIndexChanging="itemGridView_PageIndexChanging" AllowPaging="True">
        <Columns>
            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("Description") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Category">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("Category") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="UOM">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("UOM") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Quantity">
                <ItemTemplate>
                    <asp:TextBox ID="quantity" runat="server" TextMode="Number" min="0"></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>

        </Columns>
    </asp:GridView>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
        <asp:Button ID="Button2" runat="server" Text="Add to Cart" OnClick="Button2_Click" />
        <asp:Label ID="Label1" runat="server"></asp:Label>
        <br />
        </asp:Content>
