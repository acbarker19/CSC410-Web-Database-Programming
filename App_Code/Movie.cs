using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Movie
/// </summary>
public class Movie
{
    private string title, director, rating;
    private int movieID, year;

    public Movie(int movieID, string title, string director, int year, string rating)
    {
        this.movieID = movieID;
        this.title = title;
        this.director = director;
        this.year = year;
        this.rating = rating;
    }

    public string Title
    {
        get
        {
            return title;
        }
        set
        {
            title = value;
        }
    }

    public string Director
    {
        get
        {
            return director;
        }
        set
        {
            director = value;
        }
    }

    public string Rating
    {
        get
        {
            return rating;
        }
        set
        {
            rating = value;
        }
    }

    public int MovieID
    {
        get
        {
            return movieID;
        }
        set
        {
            movieID = value;
        }
    }

    public int Year
    {
        get
        {
            return year;
        }
        set
        {
            year = value;
        }
    }

    public override string ToString()
    {
        return "Movie #" + movieID + ": \"" + title + "\" was directed by " + director
            + " and was released in " + year + " with a rating of " + rating + ".";
    }
}