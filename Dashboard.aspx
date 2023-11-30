<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WebApplication2.Dashboard" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="dashboard-container">
        <h2 class="dashboard-title">Dashboard</h2>

        <div class="dashboard-info">
            <div class="dashboard-info-item">
                <h3>Current Items Out</h3>
                <asp:Label ID="lblCurrentItemsOut" runat="server" CssClass="dashboard-value"></asp:Label>
            </div>

            <div class="dashboard-info-item">
                <h3>Total Requests</h3>
                <asp:Label ID="lblTotalRequests" runat="server" CssClass="dashboard-value"></asp:Label>
            </div>
        </div>

        <div class="dashboard-table">
            <h3>Items Currently Borrowed</h3>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                <Columns>
                    <asp:BoundField DataField="ItemName" HeaderText="Item Name" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" ItemStyle-CssClass="grid-item" HeaderStyle-CssClass="grid-header" />
                </Columns>
                <EmptyDataTemplate>
                    <div class="empty-table">No items currently borrowed.</div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
