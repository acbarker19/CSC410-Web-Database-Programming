<%@ Page Language="C#" AutoEventWireup="true" CodeFile="YesICan.aspx.cs" Inherits="YesICan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Alec Barker</title>
</head>
<body>
    <form id="form1" runat="server">
        <h4>All Accounts</h4>
        <asp:GridView ID="gvAccounts" runat="server" AutoGenerateColumns="False" DataKeyNames="AccountID" DataSourceID="sdsAccounts">
            <AlternatingRowStyle BackColor="LightGreen" />
            <Columns>
                <asp:BoundField DataField="AccountID" HeaderText="AccountID" ReadOnly="True" SortExpression="AccountID" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="Street" HeaderText="Street" SortExpression="Street" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                <asp:BoundField DataField="Zip" HeaderText="Zip" SortExpression="Zip" />
            </Columns>
            <HeaderStyle BackColor="Yellow" />
            <RowStyle BackColor="LightBlue" />
        </asp:GridView>
        <asp:SqlDataSource ID="sdsAccounts" runat="server" ConnectionString="<%$ ConnectionStrings:ExpConnectionString %>" SelectCommand="SELECT * FROM [Account] ORDER BY [LastName], [FirstName]"></asp:SqlDataSource>
        <asp:Label ID="lblAuthor" runat="server" Text="Author:"></asp:Label>
        <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnDisplayBooks" runat="server" Text="Display Books" />
        <asp:GridView ID="gvBooks" runat="server" AutoGenerateColumns="False" DataKeyNames="BookID" DataSourceID="sdsBooks">
            <Columns>
                <asp:BoundField DataField="BookID" HeaderText="BookID" ReadOnly="True" SortExpression="BookID" />
                <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" />
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsBooks" runat="server" ConnectionString="<%$ ConnectionStrings:ExpConnectionString %>" SelectCommand="SELECT * FROM [Book] WHERE ([Author] = @Author) ORDER BY [Title]">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtAuthor" Name="Author" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
