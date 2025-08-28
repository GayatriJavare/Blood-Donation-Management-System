package com.servlet;

import java.io.IOException;
import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

@WebServlet("Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));

	    try {
	      Class.forName("com.mysql.jdbc.Driver");
	      Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/project_blood", "root", "");
	      PreparedStatement stmt = (PreparedStatement) conn.prepareStatement("DELETE FROM donor_information WHERE id = ?");
	      stmt.setInt(1, id);
	      stmt.executeUpdate();

	      res.sendRedirect("AdminPanel.jsp");
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	  }
	}





