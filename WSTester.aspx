<%@ Page Language="C#" AutoEventWireup="true" CodeFile="WSTester.aspx.cs" Inherits="WSTester" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Web Service Testing</title>
</head>
<body>
    <form id="form1" runat="server">
        <h3>Web Service Testing</h3>
        <asp:GridView ID="gvEmployees" runat="server"></asp:GridView>
        <asp:Label ID="lblID" runat="server" Text="Employee ID: "></asp:Label>
        <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblFirstName" runat="server" Text="First Name: "></asp:Label>
        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblLastName" runat="server" Text="Last Name: "></asp:Label>
        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnAddEmployee" runat="server" Text="Add this Employee" OnClick="btnAddEmployee_Click" />
        <br />
        <asp:Label ID="lblStatus" runat="server"></asp:Label>
    </form>
</body>
</html>
