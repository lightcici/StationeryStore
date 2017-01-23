<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MaintainCatalogueList1.aspx.cs" Inherits="MaintainCatalogueList1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        Catalogue List
        
        <asp:GridView ID="GridView1"  runat="server" AutoGenerateColumns="False" Height="242px"  onrowcancelingedit="GridView1_RowCancelingEdit" 
   onrowediting="GridView1_RowEditing" onrowupdating="GridView1_RowUpdating" onrowdeleting="GridView1_OnRowDeleting"
            AllowPaging="True" 
            OnPageIndexChanging="GridView1_PageIndexChanging" Width="1115px" PageSize="30">
            
            <Columns>
                <asp:BoundField DataField="ItemID" HeaderText="ItemID" ReadOnly="true" />
                
                <asp:TemplateField HeaderText="Description">
          <ItemTemplate>
            <%# Eval("Description")%>
          </ItemTemplate>
          <EditItemTemplate>
            <asp:TextBox runat="server" ID="txtDescription" Text='<%# Eval("Description")%>' />
          </EditItemTemplate>
      </asp:TemplateField>
                 <asp:TemplateField HeaderText="Category">
          <ItemTemplate>
              <%# Eval("Category")%> 
          </ItemTemplate>
          <EditItemTemplate>
               <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True"></asp:DropDownList>
          </EditItemTemplate>
      </asp:TemplateField>
                <asp:TemplateField HeaderText="Reorder Level">
          <ItemTemplate>
              <%# Eval("ReorderLevel")%>
          </ItemTemplate>
          <EditItemTemplate>
              <asp:TextBox runat="server" ID="txtReorderLevel" Text='<%# Eval("ReorderLevel")%>' />
               <asp:RangeValidator ID="RangeValidator1" runat="server"
ErrorMessage="RangeValidator" ControlToValidate="txtReorderLevel"
ForeColor="Red" Type="Integer"
MaximumValue="999" MinimumValue="1">please input positive integer!</asp:RangeValidator>
          </EditItemTemplate>
      </asp:TemplateField>
                <asp:TemplateField HeaderText="Reorder Qty">
          <ItemTemplate>
              <%# Eval("ReorderQty")%>
          </ItemTemplate>
          <EditItemTemplate>
              <asp:TextBox runat="server" ID="txtReorderQty" Text='<%# Eval("ReorderQty")%>' />
              <asp:RangeValidator ID="RangeValidator2" runat="server"
ErrorMessage="RangeValidator" ControlToValidate="txtReorderQty"
ForeColor="Red" Type="Integer"
MaximumValue="999" MinimumValue="1">please input positive integer!</asp:RangeValidator>
          </EditItemTemplate>
      </asp:TemplateField>
                <asp:TemplateField HeaderText="Unit of Measure">
          <ItemTemplate>
              <%# Eval("UOM")%>
          </ItemTemplate>
          <EditItemTemplate>
             
              <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True"></asp:DropDownList>
          </EditItemTemplate>
      </asp:TemplateField>
                
                
                <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowCancelButton="true" />
                
                <asp:CommandField ShowDeleteButton="true" ButtonType="Button"  />
                    
            </Columns>
        </asp:GridView>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Item" />
</asp:Content>
