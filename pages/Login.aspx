<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" MasterPageFile="~/Site.Master" Inherits="WebApplication2.Login" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div class="login-container">
            <h2 style="margin-bottom: 20px;">Login</h2>
            <asp:TextBox ID="txtUsername" runat="server" CssClass="login-input" placeholder="Username"></asp:TextBox>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="login-input" placeholder="Password"></asp:TextBox>
            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="login-button" OnClick="btnLogin_Click" />
            <asp:Label ID="ResultLabel" runat="server" CssClass="result-label" Text=""></asp:Label>
        </div>
    </div>
</asp:Content>

