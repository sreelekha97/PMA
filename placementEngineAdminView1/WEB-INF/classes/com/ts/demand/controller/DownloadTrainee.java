package com.ts.demand.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ts.demand.partner.dao.ConnectionDAO;

/**
 * Servlet implementation class DownloadTrainee
 */
public class DownloadTrainee extends HttpServlet {
	    Connection con;
		private static final long serialVersionUID = 1L;
	       
	    public DownloadTrainee() {
	    	super();
	    	// TODO Auto-generated constructor stub
	    }

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request, response);
		}
		
		protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			response.setContentType("text/csv");
		    response.setHeader("Content-Disposition", "attachment; filename=\"Trainee.csv\"");
			try {
                ConnectionDAO cdao = new ConnectionDAO();
				con = cdao.getConnection();
			    PreparedStatement pst = con.prepareStatement("select * from ts_trainee");
			    ResultSet rs = pst.executeQuery();
			    OutputStream outputstream = response.getOutputStream();  
		    	while(rs.next()) {
		    		outputstream.write(("\n"+rs.getString(1)+","+rs.getString(2)+","+rs.getString(3)+","+rs.getString(4)+","+rs.getString(5)+","+rs.getString(6)+","+","+rs.getString(7)+","+rs.getString(8)+","+rs.getString(9)+","+rs.getString(10)+","+rs.getString(11)+","+rs.getInt(12)+","+rs.getInt(13)+","+rs.getInt(14)+","+rs.getInt(15)+","+rs.getInt(16)+","+rs.getInt(17)+","+rs.getInt(18)+","+rs.getString(19)+","+rs.getString(20)+","+rs.getString(21)+","+rs.getString(22)+","+rs.getString(23)+","+rs.getString(24)+","+rs.getString(25)+","+rs.getString(26)+","+rs.getString(27)+","+rs.getString(28)+","+rs.getString(29)+"\n").getBytes());
			    }
			}
			catch(ClassNotFoundException | SQLException e) {
				  
			}
		}
	}
