package com.ts.demand.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ts.demand.partner.dao.DemandDAO;
import com.ts.demand.partner.dao.ScheduleDAO;
import com.ts.demand.partner.dao.TraineeDAO;
import com.ts.demand.pojo.DemandPojo;
import com.ts.demand.pojo.PartnerPojo;
import com.ts.demand.pojo.TraineeBean;

public class UpdateStatusController extends HttpServlet {
	private static final long serialVersionUID = 1L;       
	Properties props;
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ArrayIndexOutOfBoundsException  {
		try {
			String status = request.getParameter("status");
			String single = request.getParameter("single");
			int driveid = Integer.parseInt(request.getParameter("driveid"));
			int roundid = Integer.parseInt(request.getParameter("roundid"));
			ScheduleDAO dDao = new ScheduleDAO();
			long demand_id = Long.parseLong(request.getParameter("demand_id"));
        	DemandDAO ddao = new DemandDAO();
        	DemandPojo dempojo = ddao.getDemandDetails(demand_id);
        	PartnerPojo ppojo = ddao.getPartnerDetails(dempojo.getPartner_id());
			boolean result1;
			System.out.println("in schdell"+roundid);
			System.out.println("in schedule single"+single);
			TraineeDAO tdao = new TraineeDAO();
			System.out.println("updateds status");
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
           	System.out.println("22222");
           	//PartnerPojo ppojo = demdao.getPartnerDetails(dempojo.getPartner_id());
           	Message message = new MimeMessage(session);
       	    Date curDate = new Date();
           	Date nextDate = new Date();
           	nextDate.setTime(curDate.getTime() + 1 * 24 * 60 * 60 * 1000);
            message.setFrom(new InternetAddress(from));
            System.out.println("333333");
			if(single.equals("0")){
				System.out.println("entered into else update");
				String traineeid = request.getParameter("traineeid");
				System.out.println(traineeid);
				TraineeBean tbean = tdao.getTraineeDetails(traineeid);
				result1 = dDao.updateStatus(traineeid,status,driveid,roundid);
				if(result1 == true){
					
	                message.setRecipient(Message.RecipientType.BCC, new InternetAddress(tbean.getEmail()));
	                // Set Subject: header field
	                if(status.equals("Offered")) {
                        message.setSubject("Offer Update - Placement Talent Sprint");
	                    message.setContent("Dear"+tbean.getName()+" ,"+
	                        "<br>Congratulations!! <br<br>We are delighted to inform you that you have been selected for employment with our partner"+ppojo.getName()+"for the position of "+dempojo.getJobTitle()+"."+ "<br>Our hearty congratulations to you and we will get in touch with you shortly regarding your joining formalities. ", "text/html");
	                } else if(status.equals("No_show")) {
	                	message.setSubject("No show - Placement Talent Sprint");
	                    message.setContent("Dear"+tbean.getName()+" ,"+
	                        "<br>You have been made inactive as you have not showed up.", "text/html");
	                } else if(status.equals("Rejected")) {
	                	message.setSubject("Interview feedback - Placement Talent Sprint");
	                    message.setContent("Dear"+tbean.getName()+" ,"+
	                        "<br>We regret to inform you that your application has not been shortlisted for further interview with our partner "+ppojo.getName()+" for the position of "+dempojo.getJobTitle()+ "." + "<br>As you are aware, every company follows its own procedures and policies with regard to its selection processes. These procedures and policies are beyond our control. We assure you that we will continue to work for your success with other companies."
	                    		+ "<br>We request you to check your email on regular basis and apply to other positions where ever you meet the eligibility criterion."
	                    		+ "<br>Wishing you the best."
	                    		+ "<br> Please feel to reach us at placement.support@talentsprint.com or 040 – 4243 9913 for any further queries or assistance."
	                    		+ "<br>Thanks, <br> TS Placement Support ","text/html");
	                } else if(status.equals("Cleared")) {
	                	message.setSubject("Cleared round - Placement Talent Sprint");
	                    message.setContent("Dear"+tbean.getName()+" ,"+
	                        "<br>We received your application for the position of "+dempojo.getJobTitle()+ " open with our partner" +ppojo.getName()+ "."
			                         + "We would like to inform you that you have cleared the round."
			                         + "<br> We will update with further details shortly. <br> Wishing you the best. <br>Please feel to reach us at placement.support@talentsprint.com or 040 – 4243 9913 for any further queries or assistance. <br> Thanks, <br> TS Placement Support.","text/html");
	                } else if(status.equals("Attended")){
	                	message.setSubject("Attended - Placement Talent Sprint");
	                    message.setContent("Dear"+tbean.getName()+" ,"+
	                        "<br>Thanks for attending. Your status will be updated soon.", "text/html");
	                }
   	                Transport.send(message, message.getAllRecipients());
                }
			}
			else{
				System.out.println("entered into else update");
				String[] check = request.getParameterValues("check");
				if(check.length != 0){
					for(int i = 0; i < check.length;i++){
						result1 = dDao.updateStatus(check[i],status,driveid,roundid);
						System.out.println("entered into else update");
						TraineeBean tbean = tdao.getTraineeDetails(check[i]);
						if(result1 == true){
			                message.setRecipient(Message.RecipientType.BCC, new InternetAddress(tbean.getEmail()));
			                // Set Subject: header field
			                if(status.equals("Offered")) {
		                        message.setSubject("Offer Update - Placement Talent Sprint");
			                    message.setContent("Dear"+tbean.getName()+" ,"+
			                        "<br>Congratulations!! <br<br>We are delighted to inform you that you have been selected for employment with our partner"+ppojo.getName()+"for the position of "+dempojo.getJobTitle()+"."+ "<br>Our hearty congratulations to you and we will get in touch with you shortly regarding your joining formalities. ", "text/html");
			                } else if(status.equals("No_show")) {
			                	message.setSubject("No show - Placement Talent Sprint");
			                    message.setContent("Dear"+tbean.getName()+" ,"+
			                        "<br>You have been made inactive as you have not showed up.", "text/html");
			                } else if(status.equals("Rejected")) {
			                	message.setSubject("Interview feedback - Placement Talent Sprint");
			                    message.setContent("Dear"+tbean.getName()+" ,"+
			                        "<br>We regret to inform you that your application has not been shortlisted for further interview with our partner "+ppojo.getName()+" for the position of "+dempojo.getJobTitle()+ "." + "<br>As you are aware, every company follows its own procedures and policies with regard to its selection processes. These procedures and policies are beyond our control. We assure you that we will continue to work for your success with other companies."
	                    		+ "<br>We request you to check your email on regular basis and apply to other positions where ever you meet the eligibility criterion."
	                    		+ "<br>Wishing you the best."
	                    		+ "<br> Please feel to reach us at placement.support@talentsprint.com or 040 – 4243 9913 for any further queries or assistance."
	                    		+ "<br>Thanks, <br> TS Placement Support ","text/html");
			                } else if(status.equals("Cleared")) {
			                	message.setSubject("Cleared round - Placement Talent Sprint");
			                    message.setContent("Dear"+tbean.getName()+" ,"+
			                        "<br>We received your application for the position of "+dempojo.getJobTitle()+ " open with our partner" +ppojo.getName()+ "."
			                         + "We would like to inform you that you have cleared the round."
			                         + "<br> We will update with further details shortly. <br> Wishing you the best. <br>Please feel to reach us at placement.support@talentsprint.com or 040 – 4243 9913 for any further queries or assistance. <br> Thanks, <br> TS Placement Support.","text/html");
			                } else if(status.equals("Attended")){
			                	message.setSubject("Attended - Placement Talent Sprint");
			                    message.setContent("Dear"+tbean.getName()+" ,"+
			                        "<br>Thanks for attending. Your status will be updated soon.", "text/html");
			                }
		   	                Transport.send(message, message.getAllRecipients());
		                }
					}
				}
			}
		response.sendRedirect("scheduleView.jsp?driveid="+driveid+"&roundid="+roundid);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (AddressException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doProcess(request, response);
	}

}