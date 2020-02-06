<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PA1.aspx.cs" Inherits="PA1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PA 1, by Alec Barker</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>PA 1, by Alec Barker</h2>
        <table>
            <tr>
                <td><asp:Label ID="lblMovieID" runat="server" Text="Movie ID #: "></asp:Label></td>
                <td><asp:TextBox ID="txtMovieID" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblTitle" runat="server" Text="Title: "></asp:Label></td>
                <td><asp:TextBox ID="txtTitle" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblDirector" runat="server" Text="Director: "></asp:Label></td>
                <td><asp:TextBox ID="txtDirector" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblYear" runat="server" Text="Release Year: "></asp:Label></td>
                <td><asp:TextBox ID="txtYear" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblRating" runat="server" Text="MPAA Rating: "></asp:Label></td>
                <td><asp:TextBox ID="txtRating" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td><asp:Button ID="btnAdd" runat="server" Text="Add New Movie" OnClick="btnAdd_Click" Width="100%" /></td>
            </tr>
        </table>
        <br />
        <br />
        <asp:DropDownList ID="ddlMovies" runat="server" Width="800px"></asp:DropDownList>
        <br />
        <br />
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
