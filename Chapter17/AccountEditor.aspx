<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AccountEditor.aspx.cs" Inherits="Chapter17_AccountEditor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Account Editor using an ObjectDataSource</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Account Editor using an ObjectDataSource</h2>
        <asp:GridView ID="gvAllAccounts" runat="server" DataSourceID="odsAllAccounts" DataKeyNames="AccountID" OnRowDeleted="gvAllAccounts_RowDeleted" OnRowUpdated="gvAllAccounts_RowUpdated">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="odsAllAccounts" runat="server" SelectMethod="getAccountsDataSet" TypeName="AccountDataAccess" UpdateMethod="updateAccount" DeleteMethod="deleteAccount" OnUpdated="odsAllAccounts_Updated">
            <DeleteParameters>
                <asp:Parameter Name="accountID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="accountID" Type="Int32" />
                <asp:Parameter Name="zip" Type="Int32" />
                <asp:Parameter Name="lastName" Type="String" />
                <asp:Parameter Name="firstName" Type="String" />
                <asp:Parameter Name="street" Type="String" />
                <asp:Parameter Name="city" Type="String" />
                <asp:Parameter Name="state" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:Label ID="lblAccountID" runat="server" Text="AccountID: "></asp:Label>
        <asp:TextBox ID="txtAccountID" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblLastName" runat="server" Text="LastName: "></asp:Label>
        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblFirstName" runat="server" Text="FirstName: "></asp:Label>
        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblStreet" runat="server" Text="Street: "></asp:Label>
        <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblCity" runat="server" Text="City: "></asp:Label>
        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblState" runat="server" Text="State: "></asp:Label>
        <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblZip" runat="server" Text="Zip: "></asp:Label>
        <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnEnter" runat="server" Text="Enter" OnClick="btnEnter_Click" />
        <br />
        <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
    </form>
</body>
</html>
