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










public class AddPartnerController extends HttpServlet {

	

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException{

		//read username and password

		try {

			boolean popup = Boolean.parseBoolean(request.getParameter("popup"));

			int partner_id;

			String Name = request.getParameter("name");

			String Website = request.getParameter("website");

			String City = request.getParameter("city");

			String Address = request.getParameter("address");

			String Description = request.getParameter("description");

			System.out.println(Name+"jhbd\n"+popup);

			PartnerPojo pp = new PartnerPojo((Long)0L, Name, Website, City, Address, Description);

			PartnerDAO pdao = new PartnerDAO();	

			int result = pdao.addPartner(pp);

		    partner_id = result;

			System.out.println(result);

			if(result > 0) {

				if(popup){

					response.sendRedirect("addContact.jsp?popup="+popup+"&partner_id="+partner_id+"&Name="+Name);

					System.out.println("record inserted into db");

				}

				else {

			    	response.sendRedirect("partnerView.jsp");

				}

			}

			else {
				System.out.println("pop should be dispalyed");
				//response.sendRedirect("addPartner.jsp?error='errorissent'");
				PrintWriter out = response.getWriter();
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Partner you added exits! Add a NEW partner');");
				out.println("location='addPartner.jsp';");
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