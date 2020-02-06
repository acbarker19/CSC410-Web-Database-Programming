using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.ComponentModel; // for using DataObject & DataObjectMethod attributes
using System.Configuration; // for getting ConnectionString from Web.config
using System.Data; // for the DataSet class and for CommandType
using System.Data.SqlClient; // for SqlConnection, SqlCommand, etc.


/// <summary>
/// Summary description for EmployeeDataSet
/// </summary>

[DataObject (true)]
public static class EmployeeDataSet
{
    private static string getConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ExpConnectionString"].ConnectionString;
    } // end of getConnectionString

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static DataSet getEmployee()
    {
        SqlDataAdapter dad = new SqlDataAdapter("SELECT * FROM acbEmployee", getConnectionString());
        DataSet ds = new DataSet();
        dad.Fill(ds);

        return ds;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public static int updateEmployee(string firstName, string lastName, int original_EmployeeID, string original_FirstName, string original_LastName)
    {
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand cmd;

        conn.Open();
        cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "UPDATE acbEmployee SET FirstName = @FirstName, " +
            "LastName = @LastName WHERE EmployeeID = @original_EmployeeID AND " +
            "FirstName = @original_FirstName AND LastName = @original_LastName";
        cmd.Parameters.AddWithValue("@FirstName", firstName);
        cmd.Parameters.AddWithValue("@LastName", lastName);
        cmd.Parameters.AddWithValue("@original_EmployeeID", original_EmployeeID);
        cmd.Parameters.AddWithValue("@original_FirstName", original_FirstName);
        cmd.Parameters.AddWithValue("@original_LastName", original_LastName);

        return cmd.ExecuteNonQuery();
    }
}