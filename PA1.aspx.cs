using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PA1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        /*
        Movie m1;

        m1 = new Movie(1, "Star Wars", "George Lucas", 1977, "PG");

        Response.Write(m1.ToString());
        */
        Session["test"] = 5;
        Response.Write(Session["test"]);
    }

    protected void btnAdd_Click(object sender, EventArgs e)
    {
        try {
            Movie newMovie = new Movie(Convert.ToInt32(txtMovieID.Text), txtTitle.Text, txtDirector.Text,
            Convert.ToInt32(txtYear.Text), txtRating.Text);

            ddlMovies.Items.Add(new ListItem(newMovie.ToString(), Convert.ToString(newMovie.MovieID)));

            txtMovieID.Text = "";
            txtTitle.Text = "";
            txtDirector.Text = "";
            txtYear.Text = "";
            txtRating.Text = "";
            lblError.Text = "";
        }
        catch (Exception)
        {
            lblError.Text = "There was an error adding that movie." +
                " Please check that you entered integers for the Movie ID # and release year.";
        }
    }
}