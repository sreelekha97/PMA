package com.ts.demand.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.runtime.output.StAXExStreamWriterOutput;
import com.ts.demand.partner.dao.DemandDAO;
import com.ts.demand.partner.dao.TraineeDAO;
import com.ts.demand.pojo.DemandPojo;
import com.ts.demand.pojo.TraineeBean;

public class ValidateTraineeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ValidateTraineeController() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
        	System.out.println("Inside validate trainee");
        	String traineeId = request.getParameter("traineeId");
            Long demand_id = Long.parseLong(request.getParameter("demand_id"));
            DemandDAO ddao = new DemandDAO();
            TraineeDAO tdao = new TraineeDAO();
            System.out.println("before demand");
            DemandPojo dempojo = ddao.getDemandDetails(demand_id);
            System.out.println("Demand");
            System.out.println(traineeId);
            TraineeBean tbean = tdao.getTraineeDetails(traineeId);
            if(tbean == null) {
            	response.sendRedirect("AddTraineeToDemand.jsp?msg=Please Enter Valid TraineeId&demand_id="+demand_id);
            } else {
                System.out.println("Trainee");
              	request.setAttribute("demand", dempojo);
            	request.setAttribute("trainee", tbean);
            	RequestDispatcher rd = request.getRequestDispatcher("CompareTrainee.jsp");
        	    rd.forward(request, response);
            }
        }
        catch(SQLException | ClassNotFoundException ex) {
        	ex.printStackTrace();
        }
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}