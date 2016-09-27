package com.ts.demand.partner.dao;

import java.io.IOException;
import java.math.BigInteger;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ts.demand.partner.dao.ConnectionDAO;
import com.ts.demand.pojo.ContactPojo;
import com.ts.demand.pojo.InactiveTrainee;
import com.ts.demand.pojo.ListDrivePojo;
import com.ts.demand.pojo.PartnerPojo;
import com.ts.demand.pojo.SelectedTrainee;
import com.ts.demand.pojo.TraineeBean;
import com.ts.demand.pojo.TraineeHistory;

public class ReportDAO {
	Connection con;
	ConnectionDAO cdao;
	PreparedStatement pst;
	ResultSet rs;
	public ReportDAO()
		throws ClassNotFoundException,SQLException{
		cdao = new ConnectionDAO();
		con = cdao.getConnection();
	}
	public ArrayList<InactiveTrainee> getAllInactiveTrainee() throws SQLException{
		ArrayList<InactiveTrainee>  cc = new ArrayList<InactiveTrainee>();
		InactiveTrainee bean;
		try {
			pst =  con.prepareStatement("select name,traineeId,Reason from ts_trainee where Active = "+0);
			rs=pst.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		 while(rs.next()) {
			 String name = rs.getString("name");
			 String traineeId = rs.getString("traineeId");	
			 String Reason = rs.getString("Reason");
			 bean = new InactiveTrainee(name,traineeId,Reason);
			 cc.add(bean);
		 }	 
		return  cc;
	}
	public ArrayList<TraineeHistory> getTraineeHistory() throws SQLException{
		ArrayList<TraineeHistory>  cc = new ArrayList<TraineeHistory>();
		TraineeHistory bean;
		try {
			pst =  con.prepareStatement("select t.traineeId,t.name,tr.status,tr.selection_round,r.rounds,d.name from ts_trainee_round tr,ts_trainee t,ts_drive_rounds r,ts_drive d where tr.selection_round = (select max(selection_round) from ts_trainee_round) group by(t.name);");
			rs=pst.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		 while(rs.next()) {
			 String name = rs.getString("t.name");
			 String traineeId = rs.getString("traineeId");	
			 String status = rs.getString("status");
			 String selection_round = rs.getString("rounds");
			 String drive = rs.getString("d.name");
			 bean = new TraineeHistory(name,traineeId,status,selection_round,drive);
			 cc.add(bean);
		 }	 
		return  cc;
	}
	public ArrayList<SelectedTrainee> getSelectedTrainee() throws SQLException{
		ArrayList<SelectedTrainee>  cc = new ArrayList<SelectedTrainee>();
		SelectedTrainee bean;
		try {
			pst =  con.prepareStatement("select tr.traineeId,t.name,tr.status,tr.selection_round,r.rounds,d.name from ts_trainee_round tr,ts_trainee t,ts_drive_rounds r,ts_drive d group by(t.name) having tr.status = '"+"Offered"+"'");
			rs=pst.executeQuery();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		 while(rs.next()) {
			 String name = rs.getString("t.name");
			 String traineeId = rs.getString("traineeId");	
			 String status = rs.getString("status");
			 String drive = rs.getString("d.name");
			 bean = new SelectedTrainee(name,traineeId,status,drive);
			 cc.add(bean);
		 }	 
		return  cc;
	}
	public ArrayList<ListDrivePojo>getAllDrives()throws SQLException{
		ArrayList<ListDrivePojo> cc = new ArrayList<ListDrivePojo>();
		ListDrivePojo ldp;
		try{
			pst =  con.prepareStatement("select dd.ref_id,p.Name from ts_demand dd,ts_drive dr,ts_partner p where dd.demand_id = dr.demand_fk and dd.partnerid_fk = p.partner_id");
			rs=pst.executeQuery();
		} catch (SQLException e) {
				System.out.println("error");
				e.printStackTrace();
		}
		while(rs.next()){
			String ref_id = rs.getString(1);
			String partner1 = rs.getString(2);
			ldp = new ListDrivePojo(ref_id,partner1);
			cc.add(ldp);
		}
		return cc;
	}
	public ArrayList<ListDrivePojo>getAllDistinctDrives()throws SQLException{
		ArrayList<ListDrivePojo> cc = new ArrayList<ListDrivePojo>();
		ListDrivePojo ldp;
		try{
			pst =  con.prepareStatement("select DISTINCT p.Name from ts_demand dd,ts_drive dr,ts_partner p where dd.demand_id = dr.demand_fk and dd.partnerid_fk = p.partner_id");
			rs=pst.executeQuery();
		} catch (SQLException e) {
				System.out.println("error");
				e.printStackTrace();
		}
		while(rs.next()){
			String partner1 = rs.getString(1);
			ldp = new ListDrivePojo(null,partner1);
			cc.add(ldp);
		}
		return cc;
	}
	public ArrayList<ListDrivePojo>getAllDistinctContacts()throws SQLException{
		ArrayList<ListDrivePojo> cc = new ArrayList<ListDrivePojo>();
		ListDrivePojo ldp;
		try{
			pst =  con.prepareStatement("select DISTINCT * from ts_partner");
			rs=pst.executeQuery();
		} catch (SQLException e) {
				e.printStackTrace();
		}
		while(rs.next()){
			String partner1 = rs.getString(2);
			ldp = new ListDrivePojo(null,partner1);
			cc.add(ldp);
		}
		return cc;
	}
	
	public ArrayList<ContactPojo> getAllContact() throws SQLException, ClassNotFoundException, IOException{
		ArrayList<ContactPojo>  cc = new ArrayList<ContactPojo>();
		ContactPojo cp;
		try {
			pst =  con.prepareStatement("select * from ts_contact");
			rs=pst.executeQuery();
					
			} catch (SQLException e) {
			
			    e.printStackTrace();
		   }
		while(rs.next()){
			long Contact_id = rs.getLong(1);
			String Name = rs.getString("Name");
   			String Title = rs.getString("Title");
   			String Email = rs.getString("Email");
   			String Phone = rs.getString("Phone");
   			String City = rs.getString("City");
   			long Partner_fk = rs.getLong(7);
   			cp  = new ContactPojo(Contact_id,Name,Title, Email, Phone,City,Partner_fk);
   			cc.add(cp);
		}
		return  cc;
	}
	
public ArrayList<TraineeBean> GetTraineesMarks(int marks) throws SQLException, ClassNotFoundException, IOException {
		
		
		ArrayList<TraineeBean> abeanList = new ArrayList<TraineeBean>();
		
		
		
	    pst = con.prepareStatement("select * from ts_trainee t  where t.marksUG >= ? and t.marksUG < ?");
	    pst.setInt(1,marks);
	    pst.setInt(2, marks+10);
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


public ArrayList<TraineeBean> GetTraineesGradYear(int year) throws SQLException, ClassNotFoundException, IOException {
	
	
	ArrayList<TraineeBean> abeanList = new ArrayList<TraineeBean>();
	
	
	
    pst = con.prepareStatement("select * from ts_trainee t  where t.yearOfGrad = ?");
    pst.setInt(1,year);
    
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

public ArrayList<TraineeBean> GetTraineesGrad(String grad)throws SQLException, ClassNotFoundException, IOException {
	
	
	ArrayList<TraineeBean> abeanList = new ArrayList<TraineeBean>();
	
	
	
    pst = con.prepareStatement("select * from ts_trainee t  where t.last = ?");
    pst.setString(1,grad);
    
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
public ArrayList<TraineeBean> GetTraineesSkills(String skills) throws SQLException, ClassNotFoundException, IOException {
	
	
	ArrayList<TraineeBean> abeanList = new ArrayList<TraineeBean>();
	
	
	
    pst = con.prepareStatement("select * from ts_trainee t  where t.skill = ?");
    pst.setString(1,skills);
    
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

public ArrayList<TraineeBean> GetTraineesBatch(String batchs) throws SQLException, ClassNotFoundException, IOException {
	
	
	ArrayList<TraineeBean> abeanList = new ArrayList<TraineeBean>();
	
	
	
    pst = con.prepareStatement("select * from ts_trainee t  where t.batch = ?");
    pst.setString(1,batchs);
    
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

public ArrayList<TraineeBean> GetTraineesCLocation(String location) throws SQLException, ClassNotFoundException, IOException {
	
	
	ArrayList<TraineeBean> abeanList = new ArrayList<TraineeBean>();
	
	
	
    pst = con.prepareStatement("select * from ts_trainee t  where t.currentLocation = ?");
    pst.setString(1,location);
    
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


public ArrayList<PartnerPojo> getPartnersLocation(String location) throws SQLException, ClassNotFoundException, IOException{
	ArrayList<PartnerPojo>  cc = new ArrayList<PartnerPojo>();
	PartnerPojo pp;
	try {
		pst =  con.prepareStatement("select * from ts_partner where city = ?");
		pst.setString(1,location);
		rs=pst.executeQuery();
	} catch (SQLException e) {
		    e.printStackTrace();
    }
	while(rs.next()){
		long partner_id = rs.getLong(1);
		String Name = rs.getString("Name");
			String Website = rs.getString("Website");
			String City = rs.getString("City");
			String Description = rs.getString("Description");
			String Address = rs.getString("Address");
			pp  = new PartnerPojo(partner_id,Name, Website, City, Address,Description);
			cc.add(pp);
	}
	return  cc;
}
 


}

