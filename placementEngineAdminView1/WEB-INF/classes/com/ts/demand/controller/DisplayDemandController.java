package com.ts.demand.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ts.demand.partner.dao.DemandDAO;
import com.ts.demand.pojo.DemandPojo;

public class DisplayDemandController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DisplayDemandController() {
        super();
    }

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        long demand_id = Long.parseLong(request.getParameter("demandId"));
        try {
        DemandDAO ddao = new DemandDAO();
        DemandPojo dempojo = ddao.getDemandDetails(demand_id);
        if(dempojo != null) {
        	request.setAttribute("demand_pojo", dempojo);
        	RequestDispatcher rd = request.getRequestDispatcher("EditDemandView.jsp");
        	rd.forward(request, response);
        }
        }
        catch(SQLException se) {
            System.out.println(se.getMessage());	
        }
        catch(ClassNotFoundException cnfe) {
        	System.out.println(cnfe.getMessage());
        }
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
    }
}