using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public class Person
{
    private string firstName, lastName;
    private int accountNumber;

    public string FirstName
    {
        get
        {
            return firstName;
        }
        set
        {
            firstName = value;
        }
    }

    public string LastName
    {
        get
        {
            return lastName;
        }
        set
        {
            lastName = value;
        }
    }

    public int AccountNumber
    {
        get
        {
            return accountNumber;
        }
        set
        {
            accountNumber = value;
        }
    }

    public Person(string fn,
                  string ln,
                  int an)
    {
        firstName = fn;
        lastName = ln;
        accountNumber = an;
    } // end of constructor

    public override string ToString()
    {
        return firstName + " " + lastName
             + " who has account number " + accountNumber;
    }
}
