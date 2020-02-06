<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentsByMajor.aspx.cs" Inherits="Chapter13_StudentsByMajor" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Students by Major</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Students by Major</h2>
        <asp:Label ID="lblSelectAMajor" runat="server" Text="Select a Major: "></asp:Label>
        <asp:DropDownList ID="ddlSelectAMajor" runat="server" AutoPostBack="True" DataSourceID="sdsSelectAMajor" DataTextField="MajorDescription" DataValueField="MajorCode"></asp:DropDownList>
        <asp:SqlDataSource ID="sdsSelectAMajor" runat="server" ConnectionString="<%$ ConnectionStrings:CollegeConnectionString %>" SelectCommand="SELECT * FROM [Major] ORDER BY [MajorDescription]"></asp:SqlDataSource>
        <br /><br />
        <asp:DataList ID="dlDisplayStudents" runat="server" DataSourceID="sdsDisplayStudents" Visible="False">
            <AlternatingItemStyle BackColor="#CCCCFF" Font-Names="Avengeance Heroic Avenger" />
            <ItemStyle BackColor="#CCFFFF" Font-Names="Bauhaus 93" />
            <ItemTemplate>
                <asp:Label ID="StudentIDLabel" runat="server" Text='<%# Eval("StudentID") %>' />
                &nbsp&nbsp
                <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="sdsDisplayStudents" runat="server" ConnectionString="<%$ ConnectionStrings:CollegeConnectionString %>" SelectCommand="SELECT StudentMajor.StudentID, StudentMajor.MajorCode, Student.FirstName + ' ' + Student.MiddleInitial + ' ' + Student.LastName AS Name FROM [StudentMajor] INNER JOIN Student ON Student.StudentID=StudentMajor.StudentID WHERE ([MajorCode] = @MajorCode)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlSelectAMajor" Name="MajorCode" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    </form>
</body>
</html>
