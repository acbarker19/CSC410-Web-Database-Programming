using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Chapter14_StudentMaintenance : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void gvStudents_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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

    protected void gvStudents_RowDeleted(object sender, GridViewDeletedEventArgs e)
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

    protected void gvStudents_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvStudents.SelectedIndex = -1;
    }

    protected void gvStudents_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        gvStudents.SelectedIndex = -1;
    }
}