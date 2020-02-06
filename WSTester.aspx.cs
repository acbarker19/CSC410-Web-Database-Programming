using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WSTester : System.Web.UI.Page
{
    // Declare the proxy object. This will have methods with names identical
    // to the WebMethods. We call these methods, and they know how to call
    // the actual WebMethods in the web service.

    edu.mountunion.silver.WSEmployee ws = new edu.mountunion.silver.WSEmployee();

    protected void Page_Load(object sender, EventArgs e)
    {
        // Call the WebMethod
        Response.Write("My WebMethod says " + ws.HelloWorld());

        // Call the WebMethod to get the YourTableThings,
        // and tell the GridView to use the returned DataSet as its DataSource.

        gvEmployees.DataSource = ws.getEmployees();

        // Tell the GridView to re-bind its data. (re-get its data from the DataSource).

        gvEmployees.DataBind();
    }

    protected void btnAddEmployee_Click(object sender, EventArgs e)
    {
        if (txtFirstName.Text.Length.Equals(0)
                || txtLastName.Text.Length.Equals(0)
                || txtID.Text.Length.Equals(0))
        {
            lblStatus.Text = "Please enter information into all fields.";
        }
        else
        {
            try
            {
                Convert.ToInt32(txtID.Text);

                int accountAdded = ws.insertEmployee(Convert.ToInt32(txtID.Text), txtFirstName.Text, txtLastName.Text);
                
                if (accountAdded > 0)
                {
                    lblStatus.Text = "Employee added successfully";
                    Server.Transfer("~/WSTester.aspx");
                }
                else
                {
                    lblStatus.Text = "Duplicate Employee ID, not added";
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Please enter an integer value for the Employee ID field.";
            }
        }
    }
}