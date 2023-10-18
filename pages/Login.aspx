<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" MasterPageFile="~/Site.Master" Inherits="WebApplication2.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="text-center">
            <h2 class="mb-4">Login to Your Account</h2>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-body">
                        <form class="form">
                            <div class="form-group">
                                <label for="txtUsername">Username</label>
                                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter your username" />
                            </div>
                            <div class="form-group">
                                <label for "txtPassword">Password</label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter your password" />
                            </div>
                            <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-primary btn-block" OnClick="btnLogin_Click" />
                            <asp:Label ID="lblMessage" runat="server" EnableViewState="False" CssClass="text-danger mt-2 text-center" />
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


