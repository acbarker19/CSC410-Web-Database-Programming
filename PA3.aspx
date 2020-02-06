<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PA3.aspx.cs" Inherits="PA3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PA 3, by Alec Barker</title>
</head>
<body>
    <form id="form1" runat="server">
        <h3>PA 3, by Alec Barker</h3>
        County name begins with (hit Tab when done): <asp:TextBox ID="txtBeginsWith" runat="server" AutoPostBack="True"></asp:TextBox>
        <br /><br />
        Year the county was established: <asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" DataTextField="EstablishedYear" DataValueField="EstablishedYear" ></asp:DropDownList>
        <asp:SqlDataSource ID="sdsYear" runat="server" ConnectionString="<%$ ConnectionStrings:ExpConnectionString %>" SelectCommand="SELECT * FROM [OhioCountyYear] ORDER BY [EstablishedYear]"></asp:SqlDataSource>
        <br /><br />
        <asp:GridView ID="gvCounties" runat="server" AutoGenerateColumns="False" DataKeyNames="County" DataSourceID="sdsCounties">
            <Columns>
                <asp:BoundField DataField="County" HeaderText="County" ReadOnly="True" SortExpression="County" />
                <asp:BoundField DataField="CountySeat" HeaderText="CountySeat" SortExpression="CountySeat" />
                <asp:BoundField DataField="Established" HeaderText="Established" SortExpression="Established" />
                <asp:BoundField DataField="Population" HeaderText="Population" SortExpression="Population" />
                <asp:BoundField DataField="Area" HeaderText="Area" SortExpression="Area" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="sdsCounties" runat="server" ConnectionString="<%$ ConnectionStrings:ExpConnectionString %>" SelectCommand="SELECT * FROM [OhioCounty] WHERE (([County] LIKE @County + '%') AND ([Established] LIKE @Established + '%'))">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtBeginsWith" DefaultValue="%" Name="County" PropertyName="Text" Type="String" />
                <asp:ControlParameter ControlID="ddlYear" DefaultValue="%" Name="Established" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblStatus" runat="server"></asp:Label></form>
</body>
</html>
