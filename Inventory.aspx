<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="WebApplication2.Inventory" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<link href="Styles.css" rel="stylesheet" type="text/css" />
<div>
<asp:GridView runat="server" ID="gvToDoListOverview" DataSourceID="inventoryDataSource" AutoGenerateColumns="False" CssClass="grid" ShowHeaderWhenEmpty="True">
    <Columns>
        <asp:TemplateField HeaderText="Inventory ID">
            <ItemTemplate>
                <asp:Label runat="server" ID="lID" Text='<%# Eval("InventoryID") %>' CssClass="grid-label"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Name">
            <ItemTemplate>
                <asp:Label runat="server" ID="lName" Text='<%# Eval("Name") %>' CssClass="grid-label"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Quantity">
            <ItemTemplate>
                <asp:Label runat="server" ID="lQuantity" Text='<%# Eval("Quantity") %>' CssClass="grid-label"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Category">
            <ItemTemplate>
                <asp:Label runat="server" ID="lCategory" Text='<%# Eval("Category") %>' CssClass="grid-label"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
<%--        <asp:TemplateField HeaderText="Image">
            <ItemTemplate>
                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' CssClass="grid-image" />
            </ItemTemplate>
        </asp:TemplateField>--%>
    </Columns>
</asp:GridView>

    <asp:SqlDataSource ID="InventoryDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:Hardware %>" SelectCommand=SelectAllFromTable SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</div>
</asp:Content>

