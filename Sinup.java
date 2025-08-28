package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Sinup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
    	
    	PrintWriter out=res.getWriter();
    	String user=req.getParameter("name");	
	    String pass=req.getParameter("password");
	    try
		{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://Localhost:3306/project_blood","root","");
			PreparedStatement st=con.prepareStatement("select * from register where name=? and password=?");
			st.setString(1, user);
			st.setString(2, pass);
			ResultSet rs=st.executeQuery();

			if(rs.next())
			{
				out.print("Login Successfuly");
				HttpSession session=req.getSession(true);
				session.setAttribute("user", user);
				out.print("Session created");
//				out.print(session.getId());
//				res.sendRedirect("Getsession");
				res.sendRedirect("UserPanel.html");
			}
			else
			{
				out.print( "Login Fail");
				res.sendRedirect("SinupF.html");
			}

		}
		catch(Exception e1)
		{
			System.out.println(e1.getMessage());
		}
    }

}
