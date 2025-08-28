<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Certificate of Donation</title>
   <style>
      #main{height: 900px;
            width: 100%;}
            
      #nevbar{height: 100px;
              width: 100%;
              background-color: red;
              display: flex;
              flex-direction:row ;
              justify-content: end;}
              
      .nev{height: 100px;
           width: 15%;
           font-size: 30px;
           text-align: center;
           padding-top: 25px;
           }
          
      #formhe{height: 150px;
              width: 100%;}
              
      table{margin-left: 13%;
            width: 70%;
            text-align: center;}
            
      tr{height: 50px;}
      
      th{font-size: 27px;
         color: red;}
         
      td{font-size: 22px;
         color: orangered;}
         
      #up{color: green;
          font-size: 15px;
          font-weight: bolder;
          text-decoration: none;}
          
      #de{color: red;
          font-size: 15px;
          font-weight: bolder;
          text-decoration: none;}    

    </style>
</head>
<body>


        <div id="nevbar">
              <div class="nev"><a style="text-decoration: none; color: black;" href="UserPanel.html">HOME</a></div>
            <div class="nev"><a style="text-decoration: none; color: black;" href="CampainTable.jsp">CAMPPASE</a></div>
            <div class="nev"><a style="text-decoration: none; color: black;" href="AboutUs.html">ABOUT US</a></div> 
            <div class="nev"><a style="text-decoration: none; color: black;" href="certificate.jsp">CERTIFICATE</a></div> </div>
                 </div>
     
        <div id="formhe">
            <h1 style="font-size: 55px;text-align: center;">Certificate of Honor for Your Life-Saving Donation</h1>
        </div>
    </div>
    
    <div>
        
    
<table border="1">
    <tr>
        <th>Donor Id</th>
        <th>Donor Name</th>
        <th>Donor Email</th>
        <th>Address</th>
        <th>Phone Number</th>
        <th>Gender</th>
        <th>Blood Group</th>
        <th>Action</th>
    </tr>

<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_blood", "root", "");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM donor_information");

        while(rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("id") %></td>
        <td><%= rs.getString("name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("address") %></td>
        <td><%= rs.getString("number") %></td>
        <td><%= rs.getString("gender") %></td>
        <td><%= rs.getString("groupb") %></td>
        <td>
           <a id="up" href="certificate2.jsp?id=<%= rs.getInt("id") %>">Creat Your Certificate</a> 
        </td>
    </tr>
<%
        }
        con.close();
    } catch(Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

</table>
</body>
</html>
