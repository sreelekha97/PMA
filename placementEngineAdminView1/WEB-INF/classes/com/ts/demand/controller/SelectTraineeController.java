package com.ts.demand.controller;

import java.io.IOException;
import java.sql.SQLException;
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







public class SelectTraineeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    Properties props;
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ArrayIndexOutOfBoundsException  {
		try {
			int driveid = Integer.parseInt(request.getParameter("driveid"));
			System.out.println("in schdell"+driveid);
			String date = request.getParameter("date");
			String time = request.getParameter("time");
			String contact = request.getParameter("contact");
			String[] check = request.getParameterValues("check");
			int roundid = Integer.parseInt(request.getParameter("roundid"));
			ScheduleDAO dDao = new ScheduleDAO();
			System.out.println("in schdell"+roundid);
			//Long demand_id = Long.parseLong(request.getParameter("demand_id"));

			//DemandDAO ddao = new DemandDAO();
			//DemandPojo dempojo = ddao.getDemandDetails(demand_id);
	    	//PartnerPojo ppojo = ddao.getPartnerDetails(dempojo.getPartner_id());
			if(check.length != 0){
				for(int i = 0; i < check.length;i++){
					System.out.println(check[i]+"checkbox");
				}
			}
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
       	    Date curDate = new Date();
           	Date nextDate = new Date();
           	nextDate.setTime(curDate.getTime() + 1 * 24 * 60 * 60 * 1000);
            message.setFrom(new InternetAddress(from));
            System.out.println("333333");
			TraineeDAO tdao = new TraineeDAO();
			boolean result1;
			boolean result = dDao.addDateTime(date,time,contact,driveid,roundid);
			if(result){
				if(check.length != 0){
					
					for(int i = 0; i < check.length;i++){
						result1 = dDao.scheduleTraineeview(check[i],driveid,roundid,date,time);
						TraineeBean tbean = tdao.getTraineeDetails(check[i]);
						message.setRecipient(Message.RecipientType.BCC, new InternetAddress(tbean.getEmail()));
                        message.setSubject("Drive Scheduled - Placement Talent Sprint");
	                    message.setContent("Dear"+tbean.getName()+" ,"+
	                        "<br>We are happy to inform you that your interview with for the position of has been scheduled."+"<br><br>Please find below your schedule.<br>"
	                    		+"Date : "+date+"<br>" + "<br>Time : "+time+"<br>" + "Mode of Interview : <br>"+ "Contact Person : <br>"
								+"Contact Number : <br>" +"Venue: <br>"+ "Land Mark: <br>" +"Documents to be carried: <br>" + "<br><br>Note; It is mandatory for all the trainees to attend the interview without fail. Those who do not attend the interview will be suspended from Placements for two week" + "<br><br>Please note that it is very important to attend all scheduled interviews punctually. You must be in formal attire and exhibit professional conduct." + "<br><br>In case you are unable to attend, please immediately reach us at placement.support@talentsprint.com or call 040 4243 9913 for assistance." + "<br><br>We wish you all the best for your interview. <br> Thanks, <br> TS Placement Support", "text/html");
	   	                Transport.send(message, message.getAllRecipients());

					}
				}
				response.sendRedirect("scheduleView.jsp?driveid="+driveid+"&roundid="+roundid);
			}else {
				response.sendRedirect("scheduleView.jsp?driveid="+driveid+"&roundid="+roundid);
			}
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