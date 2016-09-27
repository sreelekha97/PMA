package com.ts.demand.partner.dao;

import java.io.File;

import java.io.FileWriter;

import java.io.IOException;

import java.sql.Connection;

import java.sql.DriverManager;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.sql.Statement;

import java.text.DateFormat;

import java.text.SimpleDateFormat;

import java.util.Date;

import java.util.TimeZone;

import org.apache.log4j.BasicConfigurator;

import org.apache.log4j.Logger;




import com.ts.demand.partner.dao.ConnectionDAO;










public class ExportDb {

	

	

	

	//protected static String logFile = "C:/Users/dell/Desktop/Download2.csv";

	protected static String logFile = "C:/Users/Srujana/DownloadPartner.csv";

	private static org.apache.log4j.Logger log = Logger.getLogger(ExportDb.class);

	private static Object appender;

	

	

	//private Logger logger = null;

	

	public void init() {

		log = Logger.getRootLogger();

		BasicConfigurator.configure();

		

	}

    public void write(String username) throws IOException, SQLException, ClassNotFoundException {

	         write(logFile, username);

	         System.out.println(username);

	     }

	    




	public static void write(String logFile, String partner_name) throws IOException, SQLException, ClassNotFoundException {

		

		Connection con;

		ConnectionDAO cdao;

		PreparedStatement pst = null;

		ResultSet rs;

		

		cdao = new ConnectionDAO();

		con = cdao.getConnection();

		

		File f = new File(logFile);

		if (f.exists())

		{

		  //delete if exists

		   f.delete();

		}	

	    	

		

	         

	         FileWriter fWriter = new FileWriter(logFile, true);

	         

	         

	         rs = pst.executeQuery("SELECT * FROM ts_partner") ;

	         

	         while(rs.next()){

	        

	        fWriter.write("\n"+rs.getString(1)+","+rs.getString(2)+","+rs.getString(3)+""+"\n");

	        

	         

	         }

	         

	         //AddressBookLog.appender.DatePattern='yyyy-MM-dd';

	         fWriter.flush();

	         fWriter.close();

	     }

}