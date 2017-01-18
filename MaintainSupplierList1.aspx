<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MaintainSupplierList1.aspx.cs" Inherits="WebApplication23.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head> 
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        Supplier List
        
        <asp:GridView ID="GridView1"  runat="server" AutoGenerateColumns="False" Height="242px"  onrowcancelingedit="GridView1_RowCancelingEdit" 
   onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating" Width="985px">
            
            <Columns>
                <asp:BoundField DataField="SupplierID" HeaderText="SupplierID" ReadOnly="true" />
                
                <asp:TemplateField HeaderText="Supplier Name">
          <ItemTemplate>
            <%# Eval("SupplierName")%>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" ID="txtSupplierName" Text='<%# Eval("SupplierName")%>' />
          </EditItemTemplate>
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
              <%# Eval("PhoneNo")%>
          </ItemTemplate>
          <EditItemTemplate>
              <asp:TextBox runat="server" ID="txtPhone" Text='<%# Eval("PhoneNo")%>' />
          </EditItemTemplate>
      </asp:TemplateField>
                <asp:TemplateField HeaderText="Fax">
          <ItemTemplate>
              <%# Eval("Fax")%>
          </ItemTemplate>
          <EditItemTemplate>
              <asp:TextBox runat="server" ID="txtFax" Text='<%# Eval("Fax")%>' />
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

                
                <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowCancelButton="true" />
                
                <asp:CommandField ShowDeleteButton="true" ButtonType="Button"  />
            </Columns>
        </asp:GridView>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Supplier" />
    </form>
</body>
</html>
