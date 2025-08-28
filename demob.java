package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

public class demob extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PreparedStatement stmt;
    
	@WebServlet("/demob")
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		    res.setContentType("text/html");
		    PrintWriter out = res.getWriter();

		    String idStr = req.getParameter("id");
		    int id = 0;

		    if (idStr != null && !idStr.trim().isEmpty()) {
		        try {
		            id = Integer.parseInt(idStr);
		        } catch (NumberFormatException e) {
		            id = 0; // treat as insert
		        }
		    }

		    String name = req.getParameter("name");
		    String email = req.getParameter("email");
		    String address = req.getParameter("address");
		    String number = req.getParameter("number");
		    String gender = req.getParameter("gender");
		    String groupb = req.getParameter("groupb");

		    java.sql.Connection conn = null;
		    java.sql.PreparedStatement stmt = null;

		    try {
		        Class.forName("com.mysql.jdbc.Driver");
		        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_blood", "root", "");

		        if (id == 0) {
		            // INSERT
		            stmt = conn.prepareStatement("INSERT INTO donor_information (name, address, number, gender, groupb,email) VALUES (?,?, ?, ?, ?, ?)");
		            stmt.setString(1, name);
		            stmt.setString(2, address);
		            stmt.setString(3, number);
		            stmt.setString(4, gender);
		            stmt.setString(5, groupb);
		            stmt.setString(6, email);
		           
		        } else {
		            // UPDATE
		            stmt = conn.prepareStatement("UPDATE donor_information SET name=?, address=?, number=?, gender=?, groupb=?,email=? WHERE id=?");
		            stmt.setString(1, name);
		            stmt.setString(2, address);
		            stmt.setString(3, number);
		            stmt.setString(4, gender);
		            stmt.setString(5, groupb);
		            stmt.setString(6, email);
		            stmt.setInt(7, id);
		        }

		        // Run query
		        int rowsAffected = stmt.executeUpdate();
		        out.println("<p>Success! Rows affected: " + rowsAffected + "</p>");

		        // Redirect back to donor list
		        res.sendRedirect("AdminPanel.jsp");

		    } catch (Exception e) {
		        e.printStackTrace(); // log error to console
		        out.println("Error: " + e.getMessage()); // show error to browser
		    } finally {
		        try { if (stmt != null) stmt.close(); } catch (Exception ex) {}
		        try { if (conn != null) conn.close(); } catch (Exception ex) {}
		    }
		}

	}



