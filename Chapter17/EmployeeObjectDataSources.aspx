<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EmployeeObjectDataSources.aspx.cs" Inherits="Chapter17_EmployeeObjectDataSources" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee From ObjectDataSources</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Employee From ObjectDataSources</h2>
        <h3>ObjectDataSource using a DataReader</h3>
        <asp:GridView ID="gvEmployeeFromDataReader" runat="server" DataSourceID="odsEmployeeFromDataReader"></asp:GridView>
        <asp:ObjectDataSource ID="odsEmployeeFromDataReader" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="getEmployee" TypeName="EmployeeDataReader"></asp:ObjectDataSource>
        <h3>ObjectDataSource using a DataSet</h3>
        <asp:GridView ID="gvEmployeeFromDataSet" runat="server" DataKeyNames="EmployeeID" DataSourceID="odsEmployeeFromDataSet" OnRowUpdated="gvEmployeeFromDataSet_RowUpdated">
            <Columns>
                <asp:CommandField ShowEditButton="True" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="odsEmployeeFromDataSet" runat="server" ConflictDetection="CompareAllValues" OldValuesParameterFormatString="original_{0}" SelectMethod="getEmployee" TypeName="EmployeeDataSet" UpdateMethod="updateEmployee" OnUpdated="odsEmployeeFromDataSet_Updated">
            <UpdateParameters>
                <asp:Parameter Name="firstName" Type="String" />
                <asp:Parameter Name="lastName" Type="String" />
                <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                <asp:Parameter Name="original_FirstName" Type="String" />
                <asp:Parameter Name="original_LastName" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:Label ID="lblStatus" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label></form>
</body>
</html>
