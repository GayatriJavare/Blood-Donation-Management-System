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

public class AdminCampain extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

        PrintWriter out = res.getWriter();
        String c_name = req.getParameter("c_name");
        String o_name = req.getParameter("o_name");
        String date = req.getParameter("date");
        String time = req.getParameter("time");
        String loca = req.getParameter("loca");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project_blood", "root", "");

            // Exclude the 'id' from insert, assuming it's auto-increment
            PreparedStatement st = con.prepareStatement(
                "INSERT INTO create_campain (c_name, o_name, date, time, loca) VALUES (?, ?, ?, ?, ?)"
            );

            st.setString(1, c_name);
            st.setString(2, o_name);
            st.setString(3, date);
            st.setString(4, time);
            st.setString(5, loca);

            st.executeUpdate();
            out.print("Inserted successfully");

            res.sendRedirect("AdminPanel.jsp");

        } catch (Exception e1) {
            System.out.println(e1.getMessage());
        }
    }
}






//package com.servlet;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//
//public class AdminCampain extends HttpServlet {
//	private static final long serialVersionUID = 1L;
//
//	@Override
//	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//	
//		 PrintWriter out=res.getWriter();
//	   String id=req.getParameter("id");
//  	   String c_name=req.getParameter("c_name");
//  	   String o_name=req.getParameter("o_name");
//  	   String date=req.getParameter("date");
//  	   String time=req.getParameter("time");
//  	   String loca=req.getParameter("loca");
//  	 
//  	   
//  	   try 
// 		{
// 			Class.forName("com.mysql.jdbc.Driver");
// 			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/project_blood","root","");
// 			PreparedStatement st=con.prepareStatement("Insert into create_campain values (?,?,?,?,?,?)");
// 			st.setInt(1, 1);
// 			st.setString(2,c_name);
// 			st.setString(3, o_name);
// 			st.setString(4,date );
// 			st.setString(5,time );
// 			st.setString(6,loca );
// 			
//
//			
// 			st.executeUpdate();
// 			out.print("inserted successfully");
//
// 			res.sendRedirect("AdminPanel.jsp");
//
// 		}
// 		catch(Exception e1)
// 		{
// 			System.out.println(e1.getMessage());
// 		}
//	}
//
//}
