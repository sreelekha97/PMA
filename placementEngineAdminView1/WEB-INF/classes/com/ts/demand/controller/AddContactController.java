package com.ts.demand.controller;

import java.io.IOException;













import java.sql.SQLException;




import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import javax.servlet.http.HttpSession;




import com.ts.demand.partner.dao.ContactDAO;

import com.ts.demand.partner.dao.PartnerDAO;

import com.ts.demand.pojo.ContactPojo;

import com.ts.demand.pojo.PartnerPojo;




public class AddContactController extends HttpServlet {

	

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{

		//read username and password

		try {

			

			

			boolean popup = Boolean.parseBoolean(request.getParameter("popup"));

			String p_id = request.getParameter("result");

			System.out.println("hey this is "+p_id+popup);

		    	long partner_id = Long.parseLong(p_id);

		    	String name = request.getParameter("Name");

			String Name = request.getParameter("name");

			String Title = request.getParameter("title");

			String Email = request.getParameter("email");

			String Phone = request.getParameter("phone");

			String City = request.getParameter("city");

			ContactPojo cp = new ContactPojo((Long)0L, Name, Title, Email, Phone, City, partner_id);

			ContactDAO cdao = new ContactDAO();	

			boolean result = cdao.addContact(cp);

			

			

			if(result) {

				System.out.println("record inserted into db");

			

				response.sendRedirect("partnerView.jsp");

				System.out.println(partner_id);

			}

			else {

				response.sendRedirect("addContact.jsp");

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

		catch(NumberFormatException ex){ // handle your exception

		    System.out.println("number format exception");   

			ex.printStackTrace();

		       

		    }

	

	}

	

	 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request,response);

		

	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doProcess(request,response);	

	}




}