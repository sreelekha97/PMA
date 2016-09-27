package com.ts.demand.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ts.demand.partner.dao.DemandDAO;

public class DeleteDemandController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteDemandController() {
        super();
    }

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	long demand_id = Long.parseLong(request.getParameter("demand_id"));
			DemandDAO ddao = new DemandDAO();
			System.out.println("111");
			boolean result = ddao.cancelDemand(demand_id);
			System.out.println(result);
			if(result) {
				response.sendRedirect("DemandView.jsp");
			} else {
				response.sendRedirect("DemandView.jsp");
			}				
		} catch (ClassNotFoundException | SQLException e) {

		}	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}


}
