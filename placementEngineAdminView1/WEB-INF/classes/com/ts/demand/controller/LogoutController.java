package com.ts.demand.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ts.demand.partner.dao.*;

public class LogoutController extends HttpServlet {
       
   	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   		doProcess(request,response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// deleting user from session
        
        HttpSession hs = request.getSession();
        String name = (String) hs.getAttribute("U");
        hs.removeAttribute("U");
        // calling invalidate() 
        hs.invalidate();
        //redirecting response
        response.sendRedirect("login.jsp");
	}
}