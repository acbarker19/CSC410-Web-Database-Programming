using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Lab1b : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("The Page_Load method.<br>");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Write("Username=" + txtUserName.Text + " Password=" + txtPassword.Text + "<br>");
    }
}