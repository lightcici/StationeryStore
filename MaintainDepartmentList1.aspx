<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MaintainDepartmentList1.aspx.cs" Inherits="MaintainDepartmentList1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    Department List
        
        <asp:GridView ID="GridView1"  runat="server" AutoGenerateColumns="False" Height="242px"  onrowcancelingedit="GridView1_RowCancelingEdit" 
   onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating" onrowdeleting="GridView1_OnRowDeleting" Width="1115px">
            
            <Columns>
                <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" ReadOnly="true" />
                
                <asp:TemplateField HeaderText="Department">
          <ItemTemplate>
            <%# Eval("DepartmentName")%>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" ID="txtDepartmentName" Text='<%# Eval("DepartmentName")%>' />
          </EditItemTemplate>
      </asp:TemplateField>
                 <asp:TemplateField HeaderText="Contact">
          <ItemTemplate>
              <%# Eval("ContactName")%> 
          </ItemTemplate>
          <EditItemTemplate>
              <asp:TextBox runat="server" ID="txtContactName" Text='<%# Eval("ContactName")%>' />
          </EditItemTemplate>
      </asp:TemplateField>
                <asp:TemplateField HeaderText="Tel">
          <ItemTemplate>
              <%# Eval("Telephone")%>
          </ItemTemplate>
          <EditItemTemplate>
              <asp:TextBox runat="server" ID="txtTelephone" Text='<%# Eval("Telephone")%>' />
          </EditItemTemplate>
      </asp:TemplateField>
                <asp:TemplateField HeaderText="Head">
          <ItemTemplate>
              <%# Eval("HeadName")%>
          </ItemTemplate>
          <EditItemTemplate>
              <asp:TextBox runat="server" ID="txtHeadName" Text='<%# Eval("HeadName")%>' />
          </EditItemTemplate>
      </asp:TemplateField>
                <asp:TemplateField HeaderText="Collection Point">
          <ItemTemplate>
              <%# Eval("Collection_Point")%>
          </ItemTemplate>
          <EditItemTemplate>
              <asp:TextBox runat="server" ID="txtCollection_Point" Text='<%# Eval("Collection_Point")%>' />
          </EditItemTemplate>
      </asp:TemplateField>
                <asp:TemplateField HeaderText="Rep Name">
          <ItemTemplate>
              <%# Eval("RepresentativeName")%>
          </ItemTemplate>
          <EditItemTemplate>
              <asp:TextBox runat="server" ID="txtRepresentativeName" Text='<%# Eval("RepresentativeName")%>' />
          </EditItemTemplate>
      </asp:TemplateField>
                
                
                <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowCancelButton="true" />
                
                <asp:CommandField ShowDeleteButton="true" ButtonType="Button"  />
                    
            </Columns>
        </asp:GridView>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Department" />
    </form>
</body>
</html>
