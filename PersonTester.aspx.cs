using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PersonTester : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Person tempPerson;
        Person tempPerson2;
        ListItem li;
        ListItem li2;

        tempPerson = new Person("Sally", "Smitherington", 12345);
        tempPerson2 = new Person("Person", "Two", 54321);

        li = new ListItem(tempPerson.ToString(), Convert.ToString(tempPerson.AccountNumber));
        li2 = new ListItem(tempPerson2.ToString(), Convert.ToString(tempPerson2.AccountNumber));

        lbxPeople.Items.Add(li);
        lbxPeople.Items.Add(li2);
    }
}