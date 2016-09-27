package com.ts.demand.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ts.demand.pojo.TraineeBean;
import com.ts.demand.partner.dao.TraineeDAO;

public class UpdateController extends HttpServlet {
	
	private static final int MYSQL_DUPLICATE_PK = 1062;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doProcess(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			doProcess(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,SQLException {
		// TODO Auto-generated method stub
		try {
			 int sno = 0;
			 String batch = request.getParameter("batch");
			 String certification = request.getParameter("certification");
			 String comgrade = request.getParameter("comgrade");
			 String email = request.getParameter("email");
			 String name = request.getParameter("name");
			 String gender = request.getParameter("gender");
			 String lgrad = request.getParameter("lgrad");
			 int marks10 = Integer.parseInt(request.getParameter("marks10"));
			 int marks12 = Integer.parseInt(request.getParameter("marks12"));
			 int markspg = Integer.parseInt(request.getParameter("markspg"));
			 int marksug = Integer.parseInt(request.getParameter("marksug"));
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
			 String cname = request.getParameter("cname");
			 String dob = request.getParameter("dob");
			 String reason = request.getParameter("reason");
			 int ygrad = Integer.parseInt(request.getParameter("ygrad"));
			 int yinter =Integer.parseInt(request.getParameter("yinter"));
			 int yssc = Integer.parseInt(request.getParameter("yssc"));
			 boolean active = Boolean.parseBoolean(request.getParameter("active"));
			 com.ts.demand.pojo.TraineeBean tbean = new com.ts.demand.pojo.TraineeBean(sno,name,batch,traineeid,gender,email,dob,mobile,cname,clocation,lgrad,ygrad,yinter,yssc,markspg,marksug,marks12,marks10,skill,certification,comgrade,tgrade,pgrade,agrade,active,reason,vfrom,vto,verify);
             com.ts.demand.partner.dao.TraineeDAO ud = new com.ts.demand.partner.dao.TraineeDAO();
             int result = ud.update(tbean);
             if (result == 1){
                 response.sendRedirect("ListTraineeView.jsp");
              }
            else {
			   response.sendRedirect("Update.jsp");
             }
		    } catch (NumberFormatException e) {
		 	    // TODO Auto-generated catch block
			    e.printStackTrace();
 	         } catch (ClassNotFoundException e) {
		    	// TODO Auto-generated catch block
		     	e.printStackTrace();
		     } catch (SQLException e) {
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
		  
			
				System.out.println("HIv");
				if(((SQLException) e).getErrorCode() == MYSQL_DUPLICATE_PK ){
					System.out.println("HIr");
					out.println("<script type=\"text/javascript\">");
					out.println("var name  = document.getElementById(\"qwe\").innerHTML");
					out.println("alert(name);");
					out.println("location='ListTraineeView.jsp';");
					out.println("</script>");
				
		   }

		    	
		   }
	}
}
