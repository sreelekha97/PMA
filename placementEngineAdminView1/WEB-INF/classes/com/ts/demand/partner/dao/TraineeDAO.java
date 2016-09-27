 package com.ts.demand.partner.dao;
import java.io.IOException;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.ts.demand.pojo.TraineeBean;
import com.ts.demand.partner.dao.ConnectionDAO;
//import com.sun.org.apache.xerces.internal.util.SynchronizedSymbolTable;



public class TraineeDAO {
	Connection con;
	ConnectionDAO cdao;
	PreparedStatement pst,pst1;
	Statement st;
	ResultSet rs,rs1;
	
	public TraineeDAO() throws ClassNotFoundException, SQLException {
		cdao = new ConnectionDAO();
		con = cdao.getConnection();
	}

	
    
	public boolean addTrainee(String name, String batch,String traineeid,String gender,String email,String dob,String mobile,String cname,
			String clocation, String lgrad,int ygrad,int yinter,int yssc,int markspg,int marksug,int marks12,int marks10,String skill,
			String certification,String comgrade,String tgrade,String pgrade,String agrade,boolean active,String reason,String vfrom,String vto,String verify)
			throws ClassNotFoundException,SQLException{
		boolean result = false;
		if(markspg != -1) {
    		pst = con.prepareStatement("INSERT INTO ts_trainee(traineeId,name,batch,gender,email,dob,mobile,collegeName,currentLocation,lastGraduation,yearOfGrad,yearOfInter,yearOfSSC,marksPG,marksUG,marks12,marks10,skill,certification,communicationGrade,technicalGrade,projectGrade,aptitudeGrade,Active,Reason,validFrom,validTo,verifiedBy) VALUES('"+traineeid+"','"+name+"','"+batch+"','"+gender+"','"+email+"','"+dob+"','"+mobile+"','"+cname+"','"+clocation+"','"+lgrad+"',?,?,?,?,?,?,?,'"+skill+"','"+certification+"','"+comgrade+"','"+tgrade+"','"+pgrade+"','"+agrade+"',?,'"+reason+"','"+vfrom+"','"+vto+"','"+verify+"')");
	    	pst.setInt(1,ygrad);
		    pst.setInt(2,yinter);
		    pst.setInt(3,yssc);
			pst.setInt(4,markspg);
		    pst.setInt(5,marksug);
    		pst.setInt(6,marks12);
	    	pst.setInt(7,marks10);
		    pst.setBoolean(8,active);
		} else {
			pst = con.prepareStatement("INSERT INTO ts_trainee(traineeId,name,batch,gender,email,dob,mobile,collegeName,currentLocation,lastGraduation,yearOfGrad,yearOfInter,yearOfSSC,marksUG,marks12,marks10,skill,certification,communicationGrade,technicalGrade,projectGrade,aptitudeGrade,Active,Reason,validFrom,validTo,verifiedBy) VALUES('"+traineeid+"','"+name+"','"+batch+"','"+gender+"','"+email+"','"+dob+"','"+mobile+"','"+cname+"','"+clocation+"','"+lgrad+"',?,?,?,?,?,?,'"+skill+"','"+certification+"','"+comgrade+"','"+tgrade+"','"+pgrade+"','"+agrade+"',?,'"+reason+"','"+vfrom+"','"+vto+"','"+verify+"')");
	    	pst.setInt(1,ygrad);
		    pst.setInt(2,yinter);
		    pst.setInt(3,yssc);
		    pst.setInt(4,marksug);
    		pst.setInt(5,marks12);
	    	pst.setInt(6,marks10);
		    pst.setBoolean(7,active);
		}
		int i = pst.executeUpdate();
		if(i>0){
			result = true;
    	}
		return result;
	}
	
	public int update(TraineeBean tbean) throws SQLException {
		int result = 0;
			
			String name = tbean.getName();
			String batch = tbean.getBatch();
			String traineeid = tbean.getTraineeid();
			String gender = tbean.getGender();
			String email = tbean.getEmail();
			String dob = tbean.getDob();
			String mobile = tbean.getMobile();
			String cname = tbean.getCname();
			String clocation = tbean.getClocation();
			String lgrad = tbean.getLgrad();
			int ygrad = tbean.getYgrad();
			int yinter = tbean.getYinter();
			int yssc = tbean.getYssc();
			int markspg = tbean.getMarkspg();
			int marksug = tbean.getMarksug();
			int marks12 = tbean.getMarks12();
			int marks10 = tbean.getMarks10();
			String skill = tbean.getSkill();
			String certification = tbean.getCertification();
			String comgrade = tbean.getComgrade();
			String tgrade = tbean.getTgrade();
			String pgrade = tbean.getPgrade();
			String agrade = tbean.getAgrade();
			String reason = tbean.getReason();
			String vfrom = tbean.getVfrom();
			String vto = tbean.getVto();
			String verify = tbean.getVerify();
			boolean active = tbean.isActive();
			pst = con.prepareStatement("update ts_trainee set name = ?,batch =?,gender = ?,email =?,dob =?,mobile =?,collegeName = ?,currentLocation = ?,lastGraduation = ?,yearOfGrad = ?,yearOfInter = ?,yearOfSSC = ?,marksPG = ?,marksUG = ?,marks12=?,marks10 = ?,skill = ?,certification =?,communicationGrade =?,technicalGrade=?,projectGrade = ?,aptitudeGrade=?,Active = ?,Reason = ?,validFrom=?,validTo=?,verifiedBy=? where traineeId = ?");       
		    pst.setString(1,name);
		    pst.setString(2,batch);
		    pst.setString(3,gender);
		    pst.setString(4,email);
		    pst.setString(5,dob);
		    pst.setString(6,mobile);
		    pst.setString(7,cname);
		    pst.setString(8,clocation);
		    pst.setString(9,lgrad);
		    pst.setInt(10,ygrad);
		    pst.setInt(11,yinter);
		    pst.setInt(12,yssc);
		    pst.setInt(13,markspg);
		    pst.setInt(14,marksug);
		    pst.setInt(15,marks12);
		    pst.setInt(16,marks10);
		    pst.setString(17,skill);
		    pst.setString(18,certification);
		    pst.setString(19,comgrade);
		    pst.setString(20,tgrade);
		    pst.setString(21,pgrade);
		    pst.setString(22,agrade);
		    pst.setBoolean(23,active);
		    pst.setString(24,reason);
		    pst.setString(25,vfrom);
		    pst.setString(26,vto);
		    pst.setString(27,verify);
		    pst.setString(28,traineeid);
		    result = pst.executeUpdate();
		    System.out.println(result);
		    if(result>0){
		    	result = 1;
		    }
			return result;
	}
	
	
	
	public ArrayList<TraineeBean> listTrainee() throws SQLException, ClassNotFoundException, IOException {
				int result;
				ArrayList<TraineeBean> tbeanList = new ArrayList<TraineeBean>();
			    pst = con.prepareStatement("select * from ts_trainee");
			    rs = pst.executeQuery();
			   	    
			    while(rs.next()) {
			    	 int sno = Integer.parseInt(rs.getString(1));
			    	 String name = rs.getString(2);
			    	 String batch = rs.getString(3);
			    	 String traineeId = rs.getString(4);
			    	 String gender = rs.getString(5);
			    	 String email = rs.getString(6);
			    	 String dob = rs.getString(7);
			    	 String mobile = rs.getString(8);
			    	 String collegeName = rs.getString(9);
			    	 String clocation = rs.getString(10);
			    	 String lgrad = rs.getString(11);   
			    	 int ygrad = Integer.parseInt(rs.getString(12));
				   	 int yinter =Integer.parseInt(rs.getString(13));
				   	 int yssc = Integer.parseInt(rs.getString(14));
				   	 int markspg;
				   	 if(rs.getString(15) != null) {
				   		 markspg = Integer.parseInt(rs.getString(15));
				   	 } else {
				   		 markspg = -1;
				   	 }
				   	 int marksug = Integer.parseInt(rs.getString(16));
				   	 int marks12 = Integer.parseInt(rs.getString(17));
				   	 int marks10 = Integer.parseInt(rs.getString(18));
				   	 String skill = rs.getString(19);
				     String certification = rs.getString(20);
			   	     String comgrade = rs.getString(21);
			   	     String tgrade = rs.getString(22);
			   	     String pgrade = rs.getString(23);
			   	     String agrade = rs.getString(24);
			   	     boolean active = rs.getBoolean(25);
			   	     String reason = rs.getString(26); 	   	 
			   	     String vfrom = rs.getString(27);
			   	     String vto = rs.getString(28);	   	 
			   	     String verify = rs.getString(29);
			         TraineeBean bean = new TraineeBean(sno,name,batch,traineeId,gender,email,dob,mobile,collegeName,clocation,lgrad,
							ygrad,yinter,yssc,markspg,marksug,marks12,marks10,skill,certification,comgrade,tgrade,pgrade,agrade,active,reason,vfrom,vto,verify);
			   	     tbeanList.add(bean);
					
			    }
			    return tbeanList;
			}
	public TraineeBean getTraineeDetails(String TraineeId) throws SQLException {
	    pst = con.prepareStatement("select * from ts_trainee where traineeId = ?");
	    pst.setString(1, TraineeId);
	    ResultSet rs = pst.executeQuery();
	    TraineeBean tbean = null;
	    if(rs.next()) {
	        tbean = new TraineeBean(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),
	                                rs.getString(9),rs.getString(10),rs.getString(11),rs.getInt(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16),rs.getInt(17),
	                                rs.getInt(18),rs.getString(19),rs.getString(20),rs.getString(21),rs.getString(22),rs.getString(22),rs.getString(22),rs.getBoolean(23),
	                                rs.getString(24),rs.getString(25),rs.getString(26),rs.getString(27));
        } 
	    return tbean;
	}
	
	public ArrayList<TraineeBean> AcessedTrainee() throws SQLException, ClassNotFoundException, IOException {
		
		
		ArrayList<TraineeBean> abeanList = new ArrayList<TraineeBean>();
		
		
		
	    pst = con.prepareStatement("select * from ts_trainee t, ts_broadcast b where t.traineeId = b.trainee_fk and b.applied = 1;");
	    rs = pst.executeQuery();
	   	    
	    while(rs.next()) {
	    	 int sno = Integer.parseInt(rs.getString(1));
	    	 String name = rs.getString(2);
	         String batch = rs.getString(3);
	    	 String traineeId = rs.getString(4);
	         String gender = rs.getString(5);
	    	 String email = rs.getString(6);
	         String dob = rs.getString(7);
	    	 String mobile = rs.getString(8);
	    	 String collegeName = rs.getString(9);
	    	 String clocation = rs.getString(10);
	    	 String lgrad = rs.getString(11);   
	    	 int ygrad = Integer.parseInt(rs.getString(12));
         	 int yinter =Integer.parseInt(rs.getString(13));
         	 int yssc = Integer.parseInt(rs.getString(14));
		 int markspg;
		 if(rs.getString(15) != null) {
			 markspg = Integer.parseInt(rs.getString(15));
		  } else {
	  		 markspg = -1;
	   	 }
	   	 int marksug = Integer.parseInt(rs.getString(16));
         	 int marks12 = Integer.parseInt(rs.getString(17));
		 int marks10 = Integer.parseInt(rs.getString(18));
        	 String skill = rs.getString(19);
		 String certification = rs.getString(20);
	         String comgrade = rs.getString(21);
                 String tgrade = rs.getString(22);
	         String pgrade = rs.getString(23);
		 String agrade = rs.getString(24);
	   	 boolean active = rs.getBoolean(25);
	         String reason = rs.getString(26); 	   	 
	         String vfrom = rs.getString(27);
	         String vto = rs.getString(28);	   	 
	   	 String verify = rs.getString(29);
	     
	    
	    TraineeBean abean = new TraineeBean(sno,name,batch,traineeId,gender,email,dob,mobile,collegeName,clocation,lgrad,
				ygrad,yinter,yssc,markspg,marksug,marks12,marks10,skill,certification,comgrade,tgrade,pgrade,agrade,active,reason,vfrom,vto,verify);
		     abeanList.add(abean);
	
	    }	    
	    return abeanList; 

}
}