package com.ts.demand.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;




import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;




import com.ts.demand.partner.dao.PartnerDAO;

import com.ts.demand.pojo.PartnerPojo;










public class UpdatePartnerController extends HttpServlet {

	

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{

		//read username and password

		try {

			

			long Partner_id = Long.parseLong(request.getParameter("Partner_id"));

			

			String Name = request.getParameter("Name");

			String Website = request.getParameter("Website");

			String City = request.getParameter("City");

			String Address = request.getParameter("Address");

			String Description = request.getParameter("Description");

			

			PartnerDAO pdao = new PartnerDAO();	

			

			PartnerPojo pp = new PartnerPojo(Partner_id, Name, Website, City, Address, Description);

			int result = pdao.updatePartner(pp);

			

			

			

			if(result >0) {

				response.sendRedirect("partnerView.jsp");

			}

			else {
				System.out.println("pop should be dispalyed");
				//response.sendRedirect("addPartner.jsp?error='errorissent'");
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Partner already exists . You cant update');");
				out.println("location='updatePartner.jsp?Id="+Partner_id+"&Name="+Name+"&Website="+Website+"&City="+City+"&Address="+Address+"&Description="+Description+"';");
				out.print("</script>");
			}

		} catch (ClassNotFoundException e) {

			System.out.println("class not found exception");

			// TODO Auto-generated catch block

			//e.printStackTrace();

		} catch (SQLException e) {

			System.out.println("sql exception");

			// TODO Auto-generated catch block

			//e.printStackTrace();

		} catch (NullPointerException e) {

			// TODO Auto-generated catch block

			//e.printStackTrace();

			System.out.println("null pointer exception");

		}

	

	}

	

	 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request,response);

		

		

	

		

		

	}




	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request,response);	

	}




}