package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	 PrintWriter out=res.getWriter();
   	   String name=req.getParameter("name");
   	   String password=req.getParameter("password");
   	
   	 
   	   
   	   try 
  		{
  			Class.forName("com.mysql.jdbc.Driver");
  			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_blood","root","");
  			PreparedStatement st=con.prepareStatement("Insert into register values (?,?)");
  			st.setString(1,name);
  			st.setString(2, password);
  			
  			st.executeUpdate();
//  			out.print("inserted successfully");
  			res.sendRedirect("Sinup.html");

  		}
  		catch(Exception e1)
  		{
  			System.out.println(e1.getMessage());
  		}
    }

}
