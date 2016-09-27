package com.ts.demand.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ts.demand.partner.dao.TraineeDAO;

public class AddTraineeController extends HttpServlet {	
	private static final long serialVersionUID = 1L;
	private static final int MYSQL_DUPLICATE_PK = 1062;
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ClassNotFoundException, SQLException {
	 String batch = request.getParameter("batch");
	 if(batch.equals("Other")) {
		 batch = request.getParameter("batch-other");
	 }
	 String certification = request.getParameter("certification");
	 String comgrade = request.getParameter("comgrade");
	 String email = request.getParameter("email");
	 String name = request.getParameter("name");
	 String gender = request.getParameter("gender");
	 String lgrad_field = request.getParameter("lgrad");
	 String lgrad_course = request.getParameter("lgrad_course");
	 String specialization = request.getParameter("specialization");
	 String lgrad = lgrad_course + "-" + specialization;
	 System.out.println(lgrad_field);
	 System.out.println(lgrad_course);
	 int marks10 = Integer.parseInt(request.getParameter("marks10"));
	 int marks12 = Integer.parseInt(request.getParameter("marks12"));
	 int markspg;
	 if(request.getParameter("markspg") == null) {
		  markspg = -1;
	 } else {
     	 markspg =Integer.parseInt(request.getParameter("markspg"));
	 }
     int marksug =Integer.parseInt(request.getParameter("marksug"));
	 boolean active = Boolean.parseBoolean(request.getParameter("active"));
	 String mobile = request.getParameter("mobile");
	 String pgrade = request.getParameter("pgrade");
	 String skill = request.getParameter("skill");
	 String tgrade = request.getParameter("tgrade");
	 String traineeid = request.getParameter("traineeid");
	 String verify = request.getParameter("verify");
	 String agrade = request.getParameter("agrade");
	 String vfrom = request.getParameter("vfrom");
	 String vto = request.getParameter("vto");
	 String clocation = request.getParameter("clocation");
	 System.out.println(clocation);
	 String cname = request.getParameter("cname");
	 String dob = request.getParameter("dob");
	 String reason = request.getParameter("reason");
	 int ygrad = Integer.parseInt(request.getParameter("ygrad"));
	 int yinter =Integer.parseInt(request.getParameter("yinter"));
	 int yssc = Integer.parseInt(request.getParameter("yssc"));
	  
	 TraineeDAO ptdao = new TraineeDAO();

	 boolean result = ptdao.addTrainee(name,batch,traineeid,gender,email,dob,mobile,cname,clocation,lgrad,ygrad,yinter,yssc,markspg,marksug,marks12,marks10,skill,certification,comgrade,tgrade,pgrade,agrade,active,reason,vfrom,vto,verify ); 
	 try {
			if(result){
				response.sendRedirect("ListTraineeView.jsp");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
		
		}
}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
	          try {
				doProcess(request,response);
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
			doProcess(request,response);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			PrintWriter out = response.getWriter();
			String error = e.getMessage();
			String docType =
				      "<!doctype html public \"-//w3c//dtd html 4.0 " +
				      "transitional//en\">\n";
			System.out.println("HIv");
			out.println(docType +
	                "<html>\n" +
	                "<body>\n" +
	                "<h1 style = \"color : white;\" id = \"qwe\" align=\"center\">" + error + "</h1>\n" +
	                "</body></html>");
	  
			if(((SQLException) e).getErrorCode() == MYSQL_DUPLICATE_PK ){
				System.out.println("HIr");
				out.println("<script type=\"text/javascript\">");
				out.println("var name  = document.getElementById(\"qwe\").innerHTML");
				out.println("alert(name);");
				out.println("location='addTrainee.jsp';");
				out.println("</script>");
				
		    }

		}
}
}