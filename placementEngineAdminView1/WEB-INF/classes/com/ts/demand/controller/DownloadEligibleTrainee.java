package com.ts.demand.controller;




import java.io.IOException;

import java.io.OutputStream;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.util.ArrayList;




import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;




import com.ts.demand.partner.dao.ConnectionDAO;

import com.ts.demand.partner.dao.DemandDAO;

import com.ts.demand.pojo.TraineeBean;




/**

 * Servlet implementation class DownloadTrainee

 */

public class DownloadEligibleTrainee extends HttpServlet {

	    Connection con;

		private static final long serialVersionUID = 1L;

	       

	    public DownloadEligibleTrainee() {

	    	super();

	    	// TODO Auto-generated constructor stub

	    }




		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			doProcess(request, response);

		}




		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			doProcess(request, response);

		}

		

		protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			response.setContentType("text/csv");

		    response.setHeader("Content-Disposition", "attachment; filename=\"EligibleTrainee.csv\"");

			try {

				long demand_id = Long.parseLong(request.getParameter("demand_id"));

                DemandDAO ddao = new DemandDAO();

                ArrayList<TraineeBean> etrainees = ddao.getEligibleTraineesForDemand(demand_id);

				OutputStream outputstream = response.getOutputStream();  

		    	for(TraineeBean etrainee:etrainees) {

		    		outputstream.write(("\n"+etrainee.getName()+","+etrainee.getBatch()+","+etrainee.getTraineeid()+

		    		","+etrainee.getGender()+","+etrainee.getEmail()+","+etrainee.getDob().toString()+","+etrainee.getMobile()+

		    		","+etrainee.getCname()+","+etrainee.getClocation()+","+etrainee.getLgrad()+","+etrainee.getYgrad()+

		    		","+etrainee.getYinter()+","+etrainee.getYssc()+","+etrainee.getMarks10()+","+etrainee.getMarks12()+

		    		","+etrainee.getMarksug()+","+etrainee.getMarkspg()+","+etrainee.getSkill()+","+etrainee.getCertification()+

		    		","+etrainee.getComgrade()+","+etrainee.getTgrade()+","+etrainee.getPgrade()+","+etrainee.getAgrade()+

		    		"\n").getBytes());

			    }

			}

			catch(ClassNotFoundException | SQLException e) {

				  

			}

		}

	}