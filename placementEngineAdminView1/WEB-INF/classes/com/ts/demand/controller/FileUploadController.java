package com.ts.demand.controller;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
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

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;
import com.ts.demand.partner.dao.ConnectionDAO;

public class FileUploadController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public FileUploadController() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
			doProcess(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
			doProcess(request, response);
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		String contentType = request.getContentType(); 
		if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) { 
		    DataInputStream in = new DataInputStream(request.getInputStream()); 
	    	int formDataLength = request.getContentLength(); 
		    byte dataBytes[] = new byte[formDataLength]; 
    		int byteRead = 0; 
	    	int totalBytesRead = 0; 

		    while (totalBytesRead < formDataLength) { 
    		    byteRead = in.read(dataBytes, totalBytesRead,formDataLength); 
	    	    totalBytesRead += byteRead; 
		    } 
    		
		    String file = new String(dataBytes); 
	    	String saveFile = file.substring(file.indexOf("filename=\"") + 10); 
		    System.out.println("1. saveFile=" + saveFile); 
    		saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\"")); 
	    	//System.out.println("2. saveFile" + saveFile); 
		    saveFile = file.substring(file.indexOf("filename=\"") + 10); 
    		saveFile = saveFile.substring(0, saveFile.indexOf("\n")); 
	    	saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\"")); 
		    int lastIndex = contentType.lastIndexOf("="); 
    		String boundary = contentType.substring(lastIndex + 1,contentType.length()); 
	    	int pos; 
    
	    	pos = file.indexOf("filename=\""); 
		    pos = file.indexOf("\n", pos) + 1; 
    		pos = file.indexOf("\n", pos) + 1; 
	    	pos = file.indexOf("\n", pos) + 1; 
		    int boundaryLocation = file.indexOf(boundary, pos) - 4; 
    		int startPos = ((file.substring(0, pos)).getBytes()).length; 
	    	int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length; 

		    FileOutputStream fileOut = new FileOutputStream(saveFile); 
		    fileOut.write(dataBytes, startPos, (endPos - startPos)); 

		    try {
		    	ConnectionDAO cdao = new ConnectionDAO();
				Connection con = cdao.getConnection(); 
				PreparedStatement pst = null; 
				String line = null; 
				String value = null; 
                int successful = 0;
                int failed = 0;
                String duplicates = "";
				BufferedReader input = new BufferedReader(new FileReader( 
				    saveFile));
				pst = con.prepareStatement("insert into ts_partner(Name,Website,City,Address,Description) values(?,?,?,?,?)");
				while ((line = input.readLine()) != null) {
				    value = line.toString(); 
					String[] words = value.split(",");
					int count = 1;
					for(String word:words) {
						pst.setString(count++, word);
					}
					try {
    					int val = pst.executeUpdate();
    					if(val > 0) {
    						successful += 1;
			    		} else {
			    			failed += 1;
			    		}
					}
					catch(MySQLIntegrityConstraintViolationException ex) {
						failed += 1;
						duplicates += words[0]+",";
					}
				} 
				input.close();
				fileOut.close();
				System.out.println(successful);
				System.out.println(failed);
				response.sendRedirect("uploadFile.jsp?msg=File uploaded&success="+successful+"&fail="+failed+"&duplicates="+duplicates);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			} 
		}
    }

}