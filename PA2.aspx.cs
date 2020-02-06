using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PA2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void gvEmployee_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblStatus.Text = "Unable to save changes. " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblStatus.Text = "Update failed. Someone else changed or deleted this student.";
        }
    }

    protected void gvEmployee_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblStatus.Text = "Unable to delete. " + e.Exception.Message;
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblStatus.Text = "Delete failed. Someone else changed or deleted this student.";
        }
    }

    protected void gvEmployee_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvEmployee.SelectedIndex = -1;
    }

    protected void gvEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        gvEmployee.SelectedIndex = -1;
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string firstName = txtFirstName.Text.Replace("'", "''");
        string lastName = txtLastName.Text.Replace("'", "''");

        if (firstName.Length > 0 && lastName.Length > 0)
        {
            sdsEmployee.InsertParameters["FirstName"].DefaultValue = firstName;
            sdsEmployee.InsertParameters["LastName"].DefaultValue = lastName;
            try
            {
                sdsEmployee.Insert();

                txtFirstName.Text = "";
                txtLastName.Text = "";
            }
            catch(Exception ex)
            {
                lblStatus.Text = "An error has occurred while inserting the new employee: " + ex;
            }
        }
        else
        {
            lblStatus.Text = "You must enter both a first and last name";
        }
    }
}