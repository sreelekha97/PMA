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
public class DownloadInactiveTrainee extends HttpServlet {
	    Connection con;
		private static final long serialVersionUID = 1L;
	       
	    public DownloadInactiveTrainee() {
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
		    response.setHeader("Content-Disposition", "attachment; filename=\"InactiveTrainee.csv\"");
			try {
                ConnectionDAO cdao = new ConnectionDAO();
				con = cdao.getConnection();
			    PreparedStatement pst = con.prepareStatement("select name,traineeId,Reason from ts_trainee where Active = "+0);
			    ResultSet rs = pst.executeQuery();
			    OutputStream outputstream = response.getOutputStream();  
		    	while(rs.next()) {
		    		outputstream.write(("\n"+rs.getString(1)+","+rs.getString(2)+","+rs.getString(3)+"\n").getBytes());
			    }
			}
			catch(ClassNotFoundException | SQLException e) {
				  
			}
		}
	}
