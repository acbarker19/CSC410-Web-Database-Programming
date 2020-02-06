using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StateTest_DisplayStateData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("Session variable userID = " + Session["userID"]);
        Response.Write("<br>");
        Response.Write("Application variable whateverYouWantForAName = " + Application["whateverYouWantForAName"]);
        
        /*
        Response.Write("<br>");
        int test;
        Session["makeUpSomeVariableName"] = test;
        if(Session["makeUpSomeVariableName"] == null)
        {
            Response.Write("makeUpSomeVariableName is undefined.");
        }
        else
        {
            Response.Write("Session variable makeUpSomeVariableName = " + Session["makeUpSomeVariableName"]);
        }

        Response.Write("<br>");
        Person person;
        Session["personTest"]
        if(Session["personTest"] == null)
        {
            Response.Write("personTest is undefined.");
        }
        else
        {
            Response.Write("Session variable personTest = " + Session["personTest"]);
        }
        */

        Response.Write("<br>");
        Response.Write("Bogus Session variable = " + Session["bogus"]);
    }
}