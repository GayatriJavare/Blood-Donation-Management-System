<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Campaign List</title>
<style>
    table { margin-left: 13%; 
           width: 70%; 
           text-align: center; }
    tr { height: 50px; }
    th { font-size: 27px;
         color: red; }
    td { font-size: 22px; 
         color: orangered; }
    button { position: fixed; 
             bottom: 0; 
             margin-bottom: 10px; 
             height: 50px;
             width: 10%;
             background-color: green;
             border-radius: 4px;
             font-size: 25px; 
             text-align: center; }
    a { color: black;
       text-decoration: none; }
</style>
</head>
<body>


<table border="1">
    <tr>
        <th>Campaign Name</th>
        <th>Organizer Name</th>
        <th>Campaign Date</th>
        <th>Campaign Time</th>
        <th>Campaign Location</th>
    </tr>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_blood", "root", "");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM create_campain");

        while(rs.next()) {
%>
    <tr>
        
        <td><%= rs.getString("c_name") %></td>
        <td><%= rs.getString("o_name") %></td>
        <td><%= rs.getString("date") %></td>
        <td><%= rs.getString("time") %></td>
        <td><%= rs.getString("loca") %></td>
    </tr>
<%
        }
        con.close();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

</table>
<center>
    <button><a href="UserPanel.html">Go Back</a></button>
</center>

</body>
</html>
