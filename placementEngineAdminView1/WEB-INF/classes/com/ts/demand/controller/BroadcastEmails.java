package com.ts.demand.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ts.demand.partner.dao.DemandDAO;
import com.ts.demand.pojo.DemandPojo;
import com.ts.demand.pojo.PartnerPojo;
import com.ts.demand.pojo.TraineeBean;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class BroadcastEmails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Properties props;
	Connection con;

    public BroadcastEmails() {
        super();
    }
    
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {        
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
        ArrayList<TraineeBean> trainees = null;
        try {
        	System.out.println("111111");
        	long demand_id = Long.parseLong(request.getParameter("demand_id"));
        	DemandDAO ddao = new DemandDAO();
        	trainees = ddao.getBroadcastTraineesForDemand(demand_id);
            boolean result = ddao.insertBroadCastDetails(demand_id, trainees);
            if(result == true) {
            	System.out.println("22222");
            	DemandPojo dempojo = ddao.getDemandDetails(demand_id);
            	PartnerPojo ppojo = ddao.getPartnerDetails(dempojo.getPartner_id());
            	Message message = new MimeMessage(session);
            	Date curDate = new Date();
            	System.out.println(curDate);
            	Date nextDate = new Date();
            	nextDate.setTime(curDate.getTime() + 1 * 24 * 60 * 60 * 1000);
            	//nextDate.setTime(curDate.getTime() + 60 *1000);
                message.setFrom(new InternetAddress(from));
                for(TraineeBean trainee:trainees) {
                	System.out.println("333333");
                    message.setRecipient(Message.RecipientType.BCC, new InternetAddress(trainee.getEmail()));
                    // Set Subject: header field
                    message.setSubject("Demand Details-Placement Talent Sprint");
                    // Now set the actual message
                    message.setContent("Dear "+trainee.getName()+",<br>"+
                            "We are happy to announce that our partner <b>"+ppojo.getName()+" </b>has expressed interest to "+
                            "hire entry level professionals for <b>"+dempojo.getJobTitle()+"</b>.\n"+
                            "\n<b>COMPANY PROFILE:</b><br><br>"+ppojo.getDescription()+"<a href = 'http://localhost:8080/PlacementEngineAdminView/mailcapture?traineeId="+trainee.getTraineeid()+"&curdate="+curDate+"&expdate="+nextDate+"&demand_id="+dempojo.getDemand_id()+"'><br><br> Please click the below link to apply <br> ClickHere</a>"+".<br><br> Cut-off time for application : "+
                            nextDate.toString() + "<br> Thanks & Regards, <br> TS Placement Support <br>", "text/html" );
                    System.out.println("4444444");
                    Transport.send(message, message.getAllRecipients());
                    System.out.println("inside broadcast-ending");
                }
            }    
        }
        catch (MessagingException | SQLException | ClassNotFoundException e) {
        	e.printStackTrace();
        }
        catch(Exception e) {
        	e.printStackTrace();
        }    
        request.setAttribute("etrainees", trainees);
        RequestDispatcher rd = request.getRequestDispatcher("ListBroadcastTraineesView.jsp");
    	rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
}
