using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Chapter17_AccountEditor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void odsAllAccounts_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        e.AffectedRows = Convert.ToInt32(e.ReturnValue);
    }

    protected void gvAllAccounts_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblStatus.Text = "Update failed. " + e.Exception.Message.ToString();
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblStatus.Text = "Update failed. Another user may have updated this record.";
        }
        else
        {
            lblStatus.Text = "Account was updated.";
        }
    }

    protected void gvAllAccounts_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lblStatus.Text = "Delete failed. " + e.Exception.Message.ToString();
            e.ExceptionHandled = true;
        }
        else if (e.AffectedRows == 0)
        {
            lblStatus.Text = "Delete failed. Another user may have updated this record.";
        }
        else
        {
            lblStatus.Text = "Account was deleted.";
        }
    }

    protected void btnEnter_Click(object sender, EventArgs e)
    {
        try
        {
            AccountDataAccess.insertAccount(Convert.ToInt32(txtAccountID.Text), Convert.ToInt32(txtZip.Text),
            txtLastName.Text, txtFirstName.Text, txtStreet.Text, txtCity.Text, txtState.Text);
        }
        catch(Exception ex)
        {
            lblStatus.Text = "Insert failed. " + ex.Message.ToString();
        }
    }
}