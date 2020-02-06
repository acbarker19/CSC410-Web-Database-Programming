<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Lab1b.aspx.cs" Inherits="Lab1b" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Alec Barker, CSC 410 Lab 1b</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Alec Barker, CSC 410 Lab 1b</h2>
            <asp:Label ID="lblUserName" runat="server" Text="User Name: "></asp:Label>
            <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
            <p>
                <asp:Label ID="lblPassword" runat="server" Text="Password: "></asp:Label>
                <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            </p>
            <p>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
            </p>
        </div>
    </form>
</body>
</html>
