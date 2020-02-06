<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PA2.aspx.cs" Inherits="PA2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PA 2, by Alec Barker</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>PA 2, by Alec Barker</h2>
        <hr />
        <h3>Add a New Employee</h3>
        <asp:Label ID="lblFirstName" runat="server" Text="First Name: "></asp:Label>
        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
        <br />
        <asp:Label ID="lblLastName" runat="server" Text="Last Name: "></asp:Label>
        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
        <br />
        <br />
        <hr />
        <br />
        <asp:GridView ID="gvEmployee" runat="server" DataSourceID="sdsEmployee" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="EmployeeID" OnRowDeleted="gvEmployee_RowDeleted" OnRowUpdated="gvEmployee_RowUpdated" OnRowDeleting="gvEmployee_RowDeleting" OnRowEditing="gvEmployee_RowEditing">
            <AlternatingRowStyle BackColor="#CCFFCC" />
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
            </Columns>
            <EditRowStyle BackColor="#FFCC99" />
            <RowStyle BackColor="#FFFFCC" />
            <SelectedRowStyle BackColor="#FFCC99" />
        </asp:GridView>
        <asp:SqlDataSource ID="sdsEmployee" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ExpEmployee %>" DeleteCommand="DELETE FROM [acbEmployee] WHERE [EmployeeID] = @original_EmployeeID AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL))" InsertCommand="INSERT INTO [acbEmployee] ([FirstName], [LastName]) VALUES (@FirstName, @LastName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [acbEmployee] ORDER BY [LastName], [FirstName], [EmployeeID]" UpdateCommand="UPDATE [acbEmployee] SET [FirstName] = @FirstName, [LastName] = @LastName WHERE [EmployeeID] = @original_EmployeeID AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([LastName] = @original_LastName) OR ([LastName] IS NULL AND @original_LastName IS NULL))">
            <DeleteParameters>
                <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="FirstName" Type="String" />
                <asp:Parameter Name="LastName" Type="String" />
                <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <br />
        <asp:GridView ID="gvDepartment" runat="server" AutoGenerateColumns="False" DataKeyNames="DepartmentID" DataSourceID="sdsDepartment">
            <Columns>
                <asp:BoundField DataField="DepartmentID" HeaderText="DepartmentID" InsertVisible="False" ReadOnly="True" SortExpression="DepartmentID" />
                <asp:BoundField DataField="DepartmentName" HeaderText="DepartmentName" SortExpression="DepartmentName" />
                <asp:BoundField DataField="DepartmentCode" HeaderText="DepartmentCode" SortExpression="DepartmentCode" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsDepartment" runat="server" ConnectionString="<%$ ConnectionStrings:ExpEmployee %>" SelectCommand="SELECT * FROM acbDepartment, acbEmployeeInDepartment WHERE acbDepartment.DepartmentID = acbEmployeeInDepartment.DepartmentID AND EmployeeID = @EmployeeID">
            <SelectParameters>
                <asp:ControlParameter ControlID="gvEmployee" Name="EmployeeID" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblStatus" runat="server" EnableViewState="False" ForeColor="Red"></asp:Label>
    </form>
</body>
</html>
