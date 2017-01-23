<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ItemList.aspx.cs" Inherits="Order_ItemList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div>
           <asp:Label ID="Label1" runat="server" Text="Item List" Font-Bold="True" Font-Size="Larger"></asp:Label>
           <br />
           <asp:TextBox ID="SearchTextBox" runat="server" ToolTip="Search by Item Description" MaxLength="70"></asp:TextBox>
           <asp:Button ID="SearchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" />
           
           <asp:Button ID="ShowAllBtn" runat="server" Text="Show All" OnClick="ShowAllBtn_Click" />
       </div>
        <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="Red"></asp:Label>
        <br />
        <asp:GridView ID="GridView1" runat="server" OnRowCreated="GridView1_RowCreated" DataKeyNames="ItemID">
        </asp:GridView>
        <br />
</asp:Content>

