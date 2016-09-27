package com.ts.demand.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ts.demand.partner.dao.DemandDAO;
import com.ts.demand.pojo.DemandPojo;

public class EditDemandController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EditDemandController() {
        super();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
    
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			DemandDAO cdao = new DemandDAO();
			long demand_id = Long.parseLong(request.getParameter("demand_id"));
			String ref_id = request.getParameter("ref_id");
			String bondDetails = request.getParameter("bondDetails");
			String bondDuration = request.getParameter("bondDuration");
			String certification = request.getParameter("certification");
			String compensation = request.getParameter("compensation");
			String endingDate = request.getParameter("endDate");
			String gender = request.getParameter("gender");
			String jobTitle = request.getParameter("jobTitle");
			int lastGradYear = Integer.parseInt(request.getParameter("lastGradYear"));
			String location = request.getParameter("location");
			Double marks10 = Double.parseDouble(request.getParameter("marks10"));
			Double marks12 = Double.parseDouble(request.getParameter("marks12"));
			Double marksPG = Double.parseDouble(request.getParameter("marksPG"));
			Double marksUG = Double.parseDouble(request.getParameter("marksUG"));
			int numberOfPositions = Integer.parseInt(request.getParameter("numberOfPositions"));
			String specialConditions = request.getParameter("specialConditions");
			String constraintLocation = request.getParameter("constraintLocation");
			String[] skillsList = request.getParameterValues("skills");
			String jobDescription = request.getParameter("jobDescription");
			String name = request.getParameter("name");
			DateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd"); 
			Date endDate = (Date)dateformat.parse(endingDate);
			Date createdDate = (Date)new java.util.Date();
			int status = endDate.compareTo(createdDate);
			String degree = request.getParameter("degree");
			System.out.println(degree);
            ArrayList<String> degrees = new ArrayList<String>();
            degrees.add(degree);
			boolean active = false;
			if(status > 0)
				active = true;
			long contact_id = Long.parseLong(request.getParameter("contact_id"));
	    	long partner_id = Long.parseLong(request.getParameter("partner_id"));
			ArrayList<String> skills = new ArrayList<String>();
			for(String skill:skillsList) {
				System.out.println(skill);
			    skills.add(skill);
			}
			String partner_name = "";
			DemandPojo dempojo = new DemandPojo(demand_id, ref_id, active, bondDetails, bondDuration, certification, 
				compensation, createdDate, endDate, gender, jobTitle, lastGradYear, location, marks10,
				marks12, marksPG, marksUG, name, numberOfPositions, specialConditions, contact_id, partner_id,
				constraintLocation, jobDescription, skills, degrees, partner_name);
			boolean result = cdao.editDemand(dempojo);
			if(result) {
				request.getRequestDispatcher("DemandView.jsp").forward(request, response);
			}
			//else
				//out.print("not entered");
	   	}
		catch(ParseException | SQLException | ClassNotFoundException e) {
			System.out.println(e.getMessage());
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
