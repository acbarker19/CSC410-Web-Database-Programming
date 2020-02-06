<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentMaintenance.aspx.cs" Inherits="Chapter14_StudentMaintenance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Maintenance</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Student Maintenance</h2>
        <asp:GridView ID="gvStudents" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="StudentID" DataSourceID="sdsStudents" OnRowDeleted="gvStudents_RowDeleted" OnRowUpdated="gvStudents_RowUpdated" OnRowDeleting="gvStudents_RowDeleting" OnRowEditing="gvStudents_RowEditing">
            <AlternatingRowStyle BackColor="#FF9966" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="StudentID" HeaderText="StudentID" ReadOnly="True" SortExpression="StudentID" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" SortExpression="FirstName" />
                <asp:BoundField DataField="MiddleInitial" HeaderText="MiddleInitial" SortExpression="MiddleInitial" />
            </Columns>
            <EditRowStyle BackColor="#66FFFF" />
            <RowStyle BackColor="#FF6666" />
            <SelectedRowStyle BackColor="#CCFF66" />
        </asp:GridView>
        <asp:SqlDataSource ID="sdsStudents" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:CollegeConnectionString %>" DeleteCommand="DELETE FROM [Student] WHERE [StudentID] = @original_StudentID AND [LastName] = @original_LastName AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([MiddleInitial] = @original_MiddleInitial) OR ([MiddleInitial] IS NULL AND @original_MiddleInitial IS NULL))" InsertCommand="INSERT INTO [Student] ([StudentID], [LastName], [FirstName], [MiddleInitial]) VALUES (@StudentID, @LastName, @FirstName, @MiddleInitial)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Student] ORDER BY [LastName], [FirstName], [MiddleInitial]" UpdateCommand="UPDATE [Student] SET [LastName] = @LastName, [FirstName] = @FirstName, [MiddleInitial] = @MiddleInitial WHERE [StudentID] = @original_StudentID AND [LastName] = @original_LastName AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([MiddleInitial] = @original_MiddleInitial) OR ([MiddleInitial] IS NULL AND @original_MiddleInitial IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_StudentID" Type="Int32" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_MiddleInitial" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="StudentID" Type="Int32" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="MiddleInitial" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="MiddleInitial" Type="String" />
                <asp:Parameter Name="original_StudentID" Type="Int32" />
                <asp:Parameter Name="original_LastName" Type="String" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_MiddleInitial" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="lblStatus" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="gvMajorsForStudent" runat="server" AutoGenerateColumns="False" DataSourceID="sdsMajorsForStudent">
            <Columns>
                <asp:BoundField DataField="MajorCode" HeaderText="Major Code" SortExpression="MajorCode" />
                <asp:BoundField DataField="MajorDescription" HeaderText="Majors" SortExpression="MajorDescription" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsMajorsForStudent" runat="server" ConnectionString="<%$ ConnectionStrings:CollegeConnectionString %>" SelectCommand="SELECT * FROM [StudentMajor] INNER JOIN Major ON StudentMajor.MajorCode = Major.MajorCode WHERE ([StudentID] = @StudentID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="gvStudents" Name="StudentID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
