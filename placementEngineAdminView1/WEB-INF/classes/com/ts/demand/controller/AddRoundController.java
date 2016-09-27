package com.ts.demand.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ts.demand.partner.dao.DriveDAO;


public class AddRoundController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
	
		PrintWriter out = response.getWriter();  
		String drivename = request.getParameter("drivename");
		String round = request.getParameter("round");
		String pop = request.getParameter("pop");
		DriveDAO dDao = new DriveDAO();
		int result = 0 ;
		if (pop.equals("a")){
			result = dDao.addRound(drivename, round ,0);
		}
		else if(pop.equals("true")){
			result = dDao.addRound(drivename, round ,1);	
		}
		else if(pop.equals("false")){
			result = dDao.addRound(drivename, round ,2);
		}
			
		if(result == 1){
			response.sendRedirect("round.jsp?drivename="+drivename);
		}else if(result == 11){
				String doctype = "<!doctype html public \"-//w3c//dtd html 4.0 transitional//en\">\n";
			 out.println(doctype +
					"<html>\n" +
					"<head>\n" +
					"<script src = \"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script> \n" +
					"<script>" +
					"$(document).ready(function(){if (confirm('Do you want to add the round again?')){"
					+ "document.getElementById('pop').value = 'true';"
					+ "document.getElementById('ef').submit();"
					+ "} \n"
					+ "else{document.getElementById('pop').value = 'false';"
					+ "document.getElementById('ef').submit();} });" +
					"</script>" +
					"</head>"+
					"<body>\n" +
					"<form id = 'ef' action = 'addround' method = 'post'>" +
					"<input type = 'hidden' name = 'drivename' value = "+ drivename +">"+
					"<input type = 'hidden' name = 'round' value = "+ round +">"+
					"<input type = 'hidden' name = 'pop' id = 'pop' value = 'true'>"+
					"</body>\n" +
					"</html>"
		    );
	        
		}
		
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doProcess(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doProcess(request, response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}