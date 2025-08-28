package com.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class DonorInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

	    PrintWriter out = res.getWriter();

	    String name = req.getParameter("name");
	    String address = req.getParameter("address");
	    String number = req.getParameter("number");
	    String gender = req.getParameter("gender");
	    String groupb = req.getParameter("groupb");
	    String email = req.getParameter("email");

	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_blood", "root", "");
	        
	       
	        PreparedStatement st = con.prepareStatement("INSERT INTO donor_information (name, address, number, gender, groupb,email) VALUES (?, ?, ?, ?, ?, ?)");
	        
	        st.setString(1, name);
	        st.setString(2, address);
	        st.setString(3, number);
	        st.setString(4, gender);
	        st.setString(5, groupb);
	        st.setString(6, email);

	        st.executeUpdate();

	        out.print("Inserted successfully");

	        res.sendRedirect("Message.html");

	    } catch (Exception e1) {
	        System.out.println(e1.getMessage());
	    }
	}}
