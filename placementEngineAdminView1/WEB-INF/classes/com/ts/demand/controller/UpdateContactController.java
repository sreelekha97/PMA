package com.ts.demand.controller;

import java.io.IOException;










import java.sql.SQLException;




import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;




import com.ts.demand.partner.dao.ContactDAO;

import com.ts.demand.pojo.ContactPojo;










public class UpdateContactController extends HttpServlet {

	

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{

		//read username and password

		try {

			long Contact_id = Long.parseLong(request.getParameter("Contact_id"));




			long Partner_id = Long.parseLong(request.getParameter("Partner_id"));

			

			String Name = request.getParameter("Name");

			String Title = request.getParameter("Title");

			String Email = request.getParameter("Email");

			String Phone = request.getParameter("Phone");

			String City= request.getParameter("City");

			

			ContactDAO cdao = new ContactDAO();	

			

			ContactPojo cc = new ContactPojo(Contact_id, Name, Title, Email,Phone,City,Partner_id );

			int result = cdao.updateContact(cc);

			

			

			

			if(result >0) {

				System.out.println("record updated into db");

				response.sendRedirect("partnerView.jsp");

			}

			else {

				response.sendRedirect("updateContact.jsp");

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