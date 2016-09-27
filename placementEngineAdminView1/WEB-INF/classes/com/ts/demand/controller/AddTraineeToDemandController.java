package com.ts.demand.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ts.demand.partner.dao.DemandDAO;

public class AddTraineeToDemandController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public AddTraineeToDemandController() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ClassNotFoundException, SQLException {
	    try {
			boolean eligible = Boolean.parseBoolean(request.getParameter("eligible"));
			String traineeId = request.getParameter("traineeId");
    		Long demand_id = Long.parseLong(request.getParameter("demand_id"));
	    	DemandDAO ddao = new DemandDAO();
		    boolean flag = ddao.addTraineeToDemand(traineeId, demand_id, eligible);
    		if(flag)
	    		response.sendRedirect("DemandView.jsp");
		    else
			    System.out.println("elsee of ddtrainee");
		}
		catch(Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try {
			doProcess(request, response);
		}
		catch(Exception ex) {
			
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
    		doProcess(request, response);
		}
		catch(Exception ex) {
			
		}
	}

}
