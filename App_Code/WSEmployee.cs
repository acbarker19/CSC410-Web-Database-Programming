using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for WSEmployee
/// </summary>
[WebService(Namespace = "https://barkera2020.silver.mountunion.edu/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WSEmployee : System.Web.Services.WebService
{

    public WSEmployee()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld()
    {
        return "Hello World";
    }

    private string getConnectionString()
    {
        return ConfigurationManager.ConnectionStrings["ExpConnectionString"].ConnectionString;
    } // end of getConnectionString

    [WebMethod]
    public DataSet getEmployees()
    {
        SqlDataAdapter dad = new SqlDataAdapter("SELECT * FROM acbEmployee", getConnectionString());
        DataSet ds = new DataSet();
        dad.Fill(ds);

        return ds;
    }

    [WebMethod]
    public int insertEmployee(int id, string firstName, string lastName)
    {
        SqlConnection conn = new SqlConnection(getConnectionString());
        SqlCommand cmd;

        int numRowsAffected;

        conn.Open();
        cmd = new SqlCommand();
        cmd.Connection = conn;
        cmd.CommandType = CommandType.Text;
        cmd.CommandText = "SET IDENTITY_INSERT acbEmployee ON";

        numRowsAffected = cmd.ExecuteNonQuery();

        cmd.CommandText = "INSERT INTO acbEmployee (EmployeeID, FirstName, LastName) VALUES (" + id + ", '" + firstName + "', '" + lastName + "')";

        try
        {
            numRowsAffected = cmd.ExecuteNonQuery();
        }
        catch(Exception ex)
        {
            numRowsAffected = 0;
        }
        conn.Close();

        return numRowsAffected;
    }

}
