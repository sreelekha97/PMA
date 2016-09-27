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

public class DownloadDrive extends HttpServlet {
	    Connection con;
		private static final long serialVersionUID = 1L;
 
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request, response);
		}

		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request, response);
		}
		
		protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String partner = request.getParameter("partner");
			System.out.println(partner);
			response.setContentType("text/csv");
		    response.setHeader("Content-Disposition", "attachment; filename=\"Drive.csv\"");
			try {
				ConnectionDAO cdao = new ConnectionDAO();
				con = cdao.getConnection();
				 PreparedStatement pst = con.prepareStatement("select d.ref_id,p.Name from ts_demand d,ts_partner p where d.partnerid_fk = p.partner_id and p.Name ="+"'"+partner+"'");
				 System.out.println(pst);
				    ResultSet rs = pst.executeQuery();
				    OutputStream outputstream = response.getOutputStream();  
			    	while(rs.next()) {
			    		outputstream.write((rs.getString(1) +","+rs.getString(2)+"\n").getBytes());
			    }
			}
			catch(ClassNotFoundException | SQLException e) {
				  System.out.println("error");
					e.printStackTrace();
			}
		}
	}
