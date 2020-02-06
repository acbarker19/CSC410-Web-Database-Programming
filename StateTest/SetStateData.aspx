<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SetStateData.aspx.cs" Inherits="StateTest_SetStateData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SetStateData.aspx</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>SetStateData.aspx</h2>
        <asp:Label ID="lblSession" runat="server" Text="Session Data: "></asp:Label>
        <asp:TextBox ID="tbxSession" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblApplication" runat="server" Text="Application Data: "></asp:Label>
        <asp:TextBox ID="tbxApplication" runat="server"></asp:TextBox>
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit Data" OnClick="btnSubmit_Click" />
        <br />
        <asp:Button ID="btnDisplay" runat="server" Text="Display Data" PostBackUrl="~/StateTest/DisplayStateData.aspx" />
    </form>
</body>
</html>
