package com.ts.demand.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ts.demand.partner.dao.DemandDAO;
import com.ts.demand.partner.dao.TraineeDAO;
import com.ts.demand.pojo.DemandPojo;
import com.ts.demand.pojo.TraineeBean;


public class MailCaptureController extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    Properties props;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    doProcess(request, response);	
	}
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String traineeid = request.getParameter("traineeId");
			String edate = request.getParameter("expdate");
			Long demand_id = Long.parseLong(request.getParameter("demand_id"));
			DemandDAO ddao = new DemandDAO();
/*		    SimpleDateFormat sdf = new SimpleDateFormat("EEE MMM dd kk:mm:ss z yyyy",Locale.ENGLISH);
			Date curdate = new Date();
*/			TraineeDAO tdao = new TraineeDAO();
			DemandPojo dempojo = ddao.getDemandDetails(demand_id);
			TraineeBean trainee = tdao.getTraineeDetails(traineeid);
	        request.setAttribute("trainee", trainee);
	        request.setAttribute("demand", dempojo);
	        request.setAttribute("expDate", edate);
	        RequestDispatcher rd = request.getRequestDispatcher("TraineeApply.jsp");
	    	rd.forward(request, response);
			/*
			try {
				java.util.Date expdate = sdf.parse(edate);
				System.out.println(expdate+"hii qwerty");
				if(curdate.before(expdate)){
				    result = ddao.appliedTrainee(traineeid, demand_id);
				    if(result == true) {        
				    	String from = "sshirisha97@gmail.com";//change accordingly
    			        final String username = "sshirisha97";//change accordingly, username means just remove '@' in gmail id.
			            final String password = "cherry12@";//change accordingly
    			        props = new Properties();
	    		        String host = "smtp.gmail.com";
		    	        props.put("mail.smtp.auth", true);
			            props.put("mail.smtp.starttls.enable", true);
			            props.put("mail.smtp.host", host);
			            props.put("mail.smtp.port", "587");
    			        Session session = Session.getInstance(props,
	    		            new javax.mail.Authenticator() {
		        	            protected PasswordAuthentication getPasswordAuthentication() {
			                    return new PasswordAuthentication(username, password);
			                }
			            });
    			        Message message = new MimeMessage(session);
    			        message.setRecipient(Message.RecipientType.BCC, new InternetAddress(trainee.getEmail()));
                        // Set Subject: header field
                        message.setSubject("Thank you for applying - Placement Talent Sprint");
                        // Now set the actual message
                        message.setContent("Dear"+trainee.getName()+",<br>"+
                         "Thank you for applying.", "text/html");
                        System.out.println("4444444");
                        Transport.send(message, message.getAllRecipients());
                     
				    	response.sendRedirect("Applied.jsp?msg=You have successfully applied.");
				    } else {
				    	response.sendRedirect("Applied.jsp");
				    }
				} else{
					response.sendRedirect("Applied.jsp?msg=Sorry! Link has expired.");
				}
			 } catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}*/
		    
		    }
		catch(SQLException | ClassNotFoundException e) {
			
		}
	}

}
