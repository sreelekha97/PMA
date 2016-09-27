package com.ts.demand.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ts.demand.partner.dao.DemandDAO;
import com.ts.demand.partner.dao.DriveDAO;
import com.ts.demand.pojo.DemandPojo;
import com.ts.demand.pojo.DrivePojo;
import com.ts.demand.pojo.DriveRoundsPojo;
import com.ts.demand.pojo.PartnerPojo;
import com.ts.demand.pojo.TraineeBean;

public class AddDriveController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Properties props;
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ArrayIndexOutOfBoundsException  {
		String drive = request.getParameter("drive");
		String demand = request.getParameter("demand");
		try {
			String other =  request.getParameter("other");
			Long demandid;

			String[] round = {""};
			round = request.getParameterValues("rounds");
			
			//create object of DriverDAO
			DemandDAO demdao = new DemandDAO();
			DriveDAO dDao = new DriveDAO();
			demandid = dDao.getDemandId(demand);
			DrivePojo dPojo = new DrivePojo(0, drive, demandid);
			ArrayList<DriveRoundsPojo> rPojo = new ArrayList<DriveRoundsPojo>();
			for(int i=0; i < round.length; i = i+1 ){
				if(round[i].equals("other")){
					rPojo.add(new DriveRoundsPojo(0, other, i+1));	
				}else{
				rPojo.add(new DriveRoundsPojo(0, round[i], i+1));
				}
			}
			//call createDrive() method
            System.out.println("drive created");
			boolean result = dDao.createDrive(dPojo, rPojo);
			if(result == true) {
				System.out.println("qqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
				ArrayList<TraineeBean> btrainees = demdao.getBroadcastDetails(demandid);
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
		        try {
    		        System.out.println("111111");
	            	DemandDAO ddao = new DemandDAO();
	            	DemandPojo dempojo = ddao.getDemandDetails(demandid);
	                PartnerPojo ppojo = ddao.getPartnerDetails(dempojo.getPartner_id());
	                Message message = new MimeMessage(session);
	            	Date curDate = new Date();
    	            Date nextDate = new Date();
	                nextDate.setTime(curDate.getTime() + 1 * 24 * 60 * 60 * 1000);
	                message.setFrom(new InternetAddress(from));
	                for(TraineeBean bTrainee:btrainees) {
	                  	System.out.println("333333");
	                  	System.out.println(bTrainee.getEmail());
	                    message.setRecipient(Message.RecipientType.BCC, new InternetAddress(bTrainee.getEmail()));
	                    // Set Subject: header field
    	                message.setSubject("Drive Details-Placement Talent Sprint");
	                    // Now set the actual message
	                    message.setContent("Dear "+bTrainee.getName()+",<br>"+
	                        "As you have applied for the demand <b>"+dempojo.getRef_id()+"</b> created by our partner <b>"+ppojo.getName()+" </b>, this is to inform you that a drive has been created."+
	                        "<br>We will keep updating further details soon.<br><br>TalentSprint Placement Team.<br>"
	                        , "text/html");
    	                System.out.println("444444-add drive");
    	                Transport.send(message, message.getAllRecipients());
	                    System.out.println("inside broadcast-ending");
	                }
    	        }
    	        catch(Exception e) {
	               e.printStackTrace();     	
	            }
			    response.sendRedirect("DriveView.jsp");
			}else {
				response.sendRedirect("addDrive.jsp");
			}
		} catch (ClassNotFoundException|NullPointerException |NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			String error = "please select any one check box";
			response.sendRedirect("addDrive.jsp?error="+error+"&demand="+demand+"&drive="+drive);
		} catch (SQLException e) {
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