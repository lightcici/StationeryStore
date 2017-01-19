<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewSubmission.aspx.cs" Inherits="RequestHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <p>
        <asp:Label ID="Label1" runat="server" Text="View Submission"></asp:Label>
    </p>
    <p>
        <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
            <asp:ListItem>All</asp:ListItem>
            <asp:ListItem>PendingApproval</asp:ListItem>
            <asp:ListItem>Approved</asp:ListItem>
            <asp:ListItem>Rejected</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
            <Columns>

                <asp:TemplateField HeaderText="Request ID">
                    <ItemTemplate>
                        <asp:HyperLink ID="rqId" runat="server" NavigateUrl='<%#Eval("rqId", "ApproveRequest.aspx?id={0}") %>'><%#Eval("rqId") %></asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Date Requested">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("date") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Requester">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("requester") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                    <ItemTemplate>
                        <asp:Label runat="server" Text='<%#Eval("status") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                </asp:TemplateField>


            </Columns>
        </asp:GridView>
    </p>
    <p>
        &nbsp;
    </p>
</asp:Content>

