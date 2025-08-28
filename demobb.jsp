<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
    String id = request.getParameter("id");
    String name = "",email="", address = "", number = "", gender = "", groupb = "";
    if (id != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_blood", "root", "");
            PreparedStatement pst = con.prepareStatement("SELECT * FROM donor_information WHERE id = ?");
            pst.setInt(1, Integer.parseInt(id));
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                name =  rs.getString("name");
                email =  rs.getString("email");
                address = rs.getString("address");
                number = rs.getString("number");
                gender = rs.getString("gender");
                groupb = rs.getString("groupb");
            }
            con.close();
        } catch(Exception e) {
            out.println("Error: " + e.getMessage());
        }
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
    html, body {
      height: 100%;
      margin: 0;
      font-family: Arial, sans-serif;
    }
        #backimg {
      background-image: url('./image/TH-13654-World.jpg');
      background-size: cover;
      background-position: center;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
    }
#backimg .input {
  width: 440px;  
  height: 40px;
  margin-bottom: 30px;
  border-radius: 10px;
  background-color: white;
  box-sizing: border-box;
   font-size: 20px;
}

#backimg label{
  color:black;
  font-size: 25px;
}

#backimg form{
    margin-left: 200px;
}

#backimg .button {
  width: 30%;
  font-size: 25px;
  border-radius: 10px;
   margin-left: 200px;
}
h1{top:0;}


             
                
    </style>
</head>
<body>
<%--      <h2><%= (id != null) ? "Edit Donor" : "Update Donor" %></h2>
 --%><div id="backimg">
  
<form action="demob" method="post">
    <input type="hidden" name="id" value="<%= id != null ? id : "" %>">
 <h1>Edit Donor</h1>
   <label for="name">Name:-  </label>
    <input class="input" id="input" type="text" name="name" value="<%= name %>" required><br><br>
     <label for="name">Email:-  </label> 
    <input class="input" id="input" type="email" name="email" value="<%= email %>" required><br><br>
     <label for="name">Address:-  </label>
     <input class="input" id="input" type="text" name="address" value="<%= address %>" required><br><br>
   <label for="name">Phone Number:-  </label>  
   <input class="input" id="input" type="text" name="number" value="<%= number %>" required><br><br>

   <label for="name">Gender:-  </label>
    <select class="input" id="input" name="gender" required>
        <option <%= gender.equals("Male") ? "selected" : "" %>>Male</option>
        <option <%= gender.equals("Female") ? "selected" : "" %>>Female</option>
        <option <%= gender.equals("Other") ? "selected" : "" %>>Other</option>
    </select><br><br>

     <label for="name">Blood Group:-  </label>
    <select class="input" id="input" name="groupb" required>
        <option <%= groupb.equals("A+") ? "selected" : "" %>>A+</option>
        <option <%= groupb.equals("B+") ? "selected" : "" %>>B+</option>
        <option <%= groupb.equals("O+") ? "selected" : "" %>>O+</option>
        <option <%= groupb.equals("AB+") ? "selected" : "" %>>AB+</option>
        <option <%= groupb.equals("A-") ? "selected" : "" %>>A-</option>
        <option <%= groupb.equals("B-") ? "selected" : "" %>>B-</option>
        <option <%= groupb.equals("O-") ? "selected" : "" %>>O-</option>
        <option <%= groupb.equals("AB-") ? "selected" : "" %>>AB-</option>
    </select><br><br>

    <input class="button" id="button" type="submit" value="save">
</form>
</div>
</body>
</html>
