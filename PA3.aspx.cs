using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PA3 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlYear.DataSource = sdsYear;
            ddlYear.DataBind();
            ddlYear.Items.Insert(0, new ListItem("Select a Year", "%"));
        }
    }
}