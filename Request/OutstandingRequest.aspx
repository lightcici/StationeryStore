<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OutstandingRequest.aspx.cs" Inherits="Request_OutstandingRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
        <asp:ListItem Selected="True">ViewSummary</asp:ListItem>
        <asp:ListItem>ViewByDepartment</asp:ListItem>
    </asp:RadioButtonList>

    <asp:Panel ID="PanelSummary" runat="server">

        <asp:GridView ID="GridViewSummary" runat="server" AutoGenerateColumns="False">
             <Columns>
            <asp:TemplateField HeaderText="ItemID">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("ItemID") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Description">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("ItemDesp") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="InStock">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("InStock") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="BinNumber">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("BinNum") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Needed">
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%#Eval("NeededNumber") %>'></asp:Label>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Retrieved">
                <ItemTemplate>
                    <asp:TextBox ID="Retrieved" runat="server" TextMode="Number" min="0" Text='<%#Eval("RetrivedNumber") %>'></asp:TextBox>
                </ItemTemplate>
                <HeaderStyle HorizontalAlign="Center" />
            </asp:TemplateField>
        </Columns>
        </asp:GridView>
        <asp:Button ID="ButtonSummary" runat="server" Text="Submit" OnClick="ButtonSummary_Click" />
    </asp:Panel>
    <asp:Panel ID="PanelDept" runat="server">
        
        <table style="width:100%;">
            <tr>
                <td>
                    <asp:GridView ID="GridViewDept" runat="server" AllowSorting="True" AutoGenerateColumns="False" OnSorting="GridViewDept_Sorting" OnSelectedIndexChanged="GridViewDept_SelectedIndexChanged">
                        <Columns>
                            <asp:TemplateField HeaderText="DepartmentID" Visible="false">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("DepartmentID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DepartmentName" SortExpression="Department">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("DepartmentName") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ItemID" SortExpression="Item">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("ItemID") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("ItemDesp") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Needed">
                                <ItemTemplate>
                                    <asp:Label runat="server" Text='<%#Eval("NeededNumber") %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Retrieved">
                                <ItemTemplate>
                                    <asp:TextBox ID="retrieved" runat="server" min="0" TextMode="Number" Text='<%#Eval("RetrivedNumber") %>'></asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ActualGiven">
                                <ItemTemplate>
                                    <asp:TextBox ID="given" runat="server" min="0" TextMode="Number" Text='<%#Eval("GivenNumber") %>'></asp:TextBox>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
                <td>
                    <asp:DetailsView ID="DetailsView" runat="server" Height="50px" Width="125px">
                    </asp:DetailsView>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="ButtonDept0" runat="server" Text="Submit" OnClick="ButtonDept0_Click" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>

</asp:Content>

