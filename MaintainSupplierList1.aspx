<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MaintainSupplierList1.aspx.cs" Inherits="MaintainSupplierList1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     Supplier List
        
        <asp:GridView ID="GridView1"  runat="server" AutoGenerateColumns="False" Height="242px"  onrowcancelingedit="GridView1_RowCancelingEdit" 
   onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating" 
            onrowdeleting="GridView1_OnRowDeleting" CellPadding="0" Width="1048px" 
            OnPageIndexChanging="GridView1_PageIndexChanging"  AllowPaging="True" PageSize="30">
            <RowStyle HorizontalAlign="Left"></RowStyle>
            <Columns>
                
                 <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" ReadOnly="true" />
                
                <asp:TemplateField HeaderText="Supplier Name"  ItemStyle-HorizontalAlign="Left">
          <ItemTemplate>
            <%# Eval("SupplierName")%>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" ID="txtSupplierName" Text='<%# Eval("SupplierName")%>' />
          </EditItemTemplate>
      <ControlStyle BorderWidth="0px" Width="300px" />
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="GST Registration No.">
          <ItemTemplate>
              <%# Eval("GSTRegistrationNo")%> 
          </ItemTemplate>
          <EditItemTemplate>
              <asp:TextBox runat="server" ID="txtGSTRegistrationNo" Text='<%# Eval("GSTRegistrationNo")%>' />
          </EditItemTemplate>
      </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact Name">
          <ItemTemplate>
              <%# Eval("ContactName")%>
          </ItemTemplate>
          <EditItemTemplate>
              <asp:TextBox runat="server" ID="txtContactName" Text='<%# Eval("ContactName")%>' />
          </EditItemTemplate>
      </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone">
          <ItemTemplate>
              <%# Eval("Phone")%>
          </ItemTemplate>
          <EditItemTemplate>
              <asp:TextBox runat="server" ID="txtPhone" Text='<%# Eval("Phone")%>' />
          </EditItemTemplate>
      </asp:TemplateField>
                <asp:TemplateField HeaderText="Fax">
          <ItemTemplate>
              <%# Eval("FaxNo")%>
          </ItemTemplate>
          <EditItemTemplate>
              <asp:TextBox runat="server" ID="txtFax" Text='<%# Eval("FaxNo")%>' />
          </EditItemTemplate>
      </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
          <ItemTemplate>
              <%# Eval("Address")%>
          </ItemTemplate>
          <EditItemTemplate>
              <asp:TextBox runat="server" ID="txtAddress" Text='<%# Eval("Address")%>' />
          </EditItemTemplate>
                        
      </asp:TemplateField>

                
                <asp:CommandField ButtonType="Button" ShowEditButton="True" ShowCancelButton="true" />
                
                <asp:CommandField ShowDeleteButton="True" ButtonType="Button"  />
                    
            </Columns>
            
        </asp:GridView>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Supplier" />
    </div>
    </form>
</body>
</html>
