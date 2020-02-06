using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Chapter17_EmployeeObjectDataSources : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void odsEmployeeFromDataSet_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        e.AffectedRows = Convert.ToInt32(e.ReturnValue);
    }

    protected void gvEmployeeFromDataSet_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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
            lblStatus.Text = "PrimaryTable was updated.";
        }
    }
}