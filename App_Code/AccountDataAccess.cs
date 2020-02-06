using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.ComponentModel; // for using DataObject & DataObjectMethod attributes
using System.Configuration; // for getting ConnectionString from Web.config
using System.Data; // for the DataSet class and for CommandType
using System.Data.SqlClient; // for SqlConnection, SqlCommand, etc.

/// <summary>
/// Summary description for AccountDataAccess
/// </summary>

[DataObject (true)]
public static class AccountDataAccess
{
    private static string getConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ExpConnectionString"].ConnectionString;
    } // end of getConnectionString

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static SqlDataReader getAccountsDataReader()
    {
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand cmd;
        SqlDataReader dr;

        conn.Open();
        cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SELECT * FROM Account";

        dr = cmd.ExecuteReader(CommandBehavior.CloseConnection);

        return dr;
    }

    [DataObjectMethod(DataObjectMethodType.Select)]
    public static DataSet getAccountsDataSet()
    {
        SqlDataAdapter dad = new SqlDataAdapter("SELECT * FROM Account", getConnectionString());
        DataSet ds = new DataSet();
        dad.Fill(ds);

        return ds;
    }

    [DataObjectMethod(DataObjectMethodType.Update)]
    public static void updateAccount(int accountID, int zip, string lastName, string firstName, string street,
        string city, string state)
    {
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand cmd;

        conn.Open();
        cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "UPDATE Account SET FirstName = @FirstName, LastName = @LastName, Street = @Street, " +
            "City = @City, State = @State, Zip = @Zip WHERE AccountID = @AccountID";
        cmd.Parameters.AddWithValue("@FirstName", firstName);
        cmd.Parameters.AddWithValue("@LastName", lastName);
        cmd.Parameters.AddWithValue("@Street", street);
        cmd.Parameters.AddWithValue("@City", city);
        cmd.Parameters.AddWithValue("@State", state);
        cmd.Parameters.AddWithValue("@Zip", zip);
        cmd.Parameters.AddWithValue("@AccountID", accountID);

        cmd.ExecuteNonQuery();
        conn.Close();
    }

    [DataObjectMethod(DataObjectMethodType.Delete)]
    public static void deleteAccount(int accountID)
    {
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand cmd;

        conn.Open();
        cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "DELETE FROM Account WHERE AccountID = @AccountID";
        cmd.Parameters.AddWithValue("@AccountID", accountID);

        cmd.ExecuteNonQuery();
        conn.Close();
    }

    [DataObjectMethod(DataObjectMethodType.Insert)]
    public static void insertAccount(int accountID, int zip, string lastName, string firstName, string street,
        string city, string state)
    {
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand cmd;

        conn.Open();
        cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "INSERT INTO Account VALUES (@AccountID, @LastName, @FirstName, @Street, " +
            "@City, @State, @Zip)";
        cmd.Parameters.AddWithValue("@FirstName", firstName);
        cmd.Parameters.AddWithValue("@LastName", lastName);
        cmd.Parameters.AddWithValue("@Street", street);
        cmd.Parameters.AddWithValue("@City", city);
        cmd.Parameters.AddWithValue("@State", state);
        cmd.Parameters.AddWithValue("@Zip", zip);
        cmd.Parameters.AddWithValue("@AccountID", accountID);

        cmd.ExecuteNonQuery();
        conn.Close();
    }
}