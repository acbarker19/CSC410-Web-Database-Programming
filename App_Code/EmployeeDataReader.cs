using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.ComponentModel; // for using DataObject & DataObjectMethod attributes
using System.Configuration; // for getting ConnectionString from Web.config
using System.Data; // for the DataSet class and for CommandType
using System.Data.SqlClient; // for SqlConnection, SqlCommand, etc.

/// <summary>
/// Summary description for EmployeeDataReader
/// </summary>

[DataObject (true)]
public static class EmployeeDataReader
{
    private static string getConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ExpConnectionString"].ConnectionString;
    } // end of getConnectionString

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static SqlDataReader getEmployee()
    {
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand cmd;
        SqlDataReader dr;

        conn.Open();
        cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM acbEmployee";

        dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        return dr;
    }
}