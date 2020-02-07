# CSC410: Web Database Programming
A repository containing multiple projects from my CSC 410 class, Web Database Programming, that was taught by Dr. John Kirchmeyer.

List of webpages and what they do:
- Default.html page - The home page with links to the other pages
- Lab 1a.html - A simple HTML webpage
- Lab 1b.aspx - Gets input from textboxes and printing it
- PersonTester.aspx - Pulls data from objects and displays it in a ListBox
    - AppCode/Person.cs - Contains first name, last name, and account number
- StateTest/SetStateData.aspx - Users set a session and an application variable
    - StateTest/DisplayStateData - Displays the session and application variables set in SetStateData
- PA1.aspx - Users enter information about a movie into text boxes and it appears in a DropDownList
    - App_Code/Movie.cs - Contains movie ID, title, director, release year, and rating
- Chapter13/StudentsByMajor.aspx - Allows a user to select a major from a DropDownList, pulls information from an SQL database, and displays the students who are studying that major in a DataList
- Chapter14/StudentMaintenance.aspx - Pulls data from an SQL database, displays the current students in a GridView, and allows the user to select/edit/delete the students (edit and delete are disabled due to the SQL table being protected)
- PA2.aspx - Pulls data from an SQL database, displays the current employees in a GridView, allows the user to select/edit/delete the employees, and takes input from text boxes to send the new employee information to the SQL database
- Chapter17/EmployeeObjectDataSources.aspx - Pulls data from an SQL database, creates ObjectDataSources using both DataReaders and DataSets, displays employees in a GridView, and allows the user to edit existing employees
    - App_Code/EmployeeDataSet.cs - Uses a DataSet to pull data from an SQL database and update it
    - App_Code/EmployeeDataReader.cs - Uses a DataReader to pull data from an SQL database
- Chapter17/AccountEditor.aspx - Pulls data from an SQL database, stores data in an ObjectDataSource, displays accounts in a GridView, allows the user to edit accounts, and takes input from text boxes to send the new account information to the SQL database
    - App_Code/AccountDataAccess.cs - Uses a DataReader and DataSet to pull data from an SQL database and update it
- PA3.aspx - Pulls data from an SQL database, displays the county data in a GridView, and allows the user to filter the GridView data by using a text box and DropDownList
- WSTester.aspx - Uses a web service to pulls data from an SQL database, display employees in a GridView, and takes input from text boxes to send the new employee information to the web service which sends it to the SQL database
    - App_Code/WSEmployee.cs - The web service used by WSTester that contains methods to print "Hello World", get a DataSet of employees, and update the database with new employees
