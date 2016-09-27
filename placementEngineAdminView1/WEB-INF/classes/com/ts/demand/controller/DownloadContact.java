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




public class DownloadContact extends HttpServlet {

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

			response.setContentType("text/csv");

		    response.setHeader("Content-Disposition", "attachment; filename=\"Contacts.csv\"");

			try {

				ConnectionDAO cdao = new ConnectionDAO();

				con = cdao.getConnection();

				 PreparedStatement pst = con.prepareStatement("select c.Name,c.Title,c.Email,c.Phone,c.City from ts_contact c , ts_partner p where p.partner_id = c.partner_fk and p.Name = "+"'"+partner+"'");

				 

				    ResultSet rs = pst.executeQuery();

				    OutputStream outputstream = response.getOutputStream();  

			    	while(rs.next()) {

			    		outputstream.write((rs.getString(1) +","+rs.getString(2)+","+rs.getString(3)+","+rs.getString(4)+","+rs.getString(5)+"\n").getBytes());

			    }

			}

			catch(ClassNotFoundException | SQLException e) {

				  

			}

		}

	}