package com.ts.demand.partner.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import com.ts.demand.pojo.BroadcastPojo;
import com.ts.demand.pojo.PartnerPojo;
import com.ts.demand.pojo.TraineeBean;

public class ScheduleDAO {
	Connection con;
	ConnectionDAO cdao;
	PreparedStatement pst,pst1;
	ResultSet rs,rs2;
	ResultSet rs1,rs3,rs4;
    int demandid;
	public ScheduleDAO() throws ClassNotFoundException, SQLException {
		cdao = new ConnectionDAO();
		con = cdao.getConnection();
	}
	
	 public TraineeBean getUpdatedStatusForTrainee(String traineeid, long driveid, long roundid) {
		 TraineeBean tbean = null;
		 
		 
		 return tbean;
	 }
	public boolean addDateTime(String date,String time,String contact ,int driveid,int roundid) throws SQLException, ClassNotFoundException, IOException{
		boolean result = false;
		try {
			
			pst =  con.prepareStatement("insert into ts_selection_round(contactDetails,date,roundNumber,time,drive_fk) values("+"'"+contact+"'"+","+"'"+date+"'"+","+roundid+","+"'"+time+"'"+","+driveid+")");		
			System.out.println(pst);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("error");
			e.printStackTrace();
		}
			try {
				int ans = pst.executeUpdate();
				if(ans > 0) {
					result = true;
				}
			} catch (SQLException e) {
				System.out.println("execute update");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result; 
	}
	@SuppressWarnings("deprecation")
	public boolean updateStatus(String traineeId,String status,int driveid,int roundid) throws SQLException, ClassNotFoundException, IOException{
		boolean result = false;
		Date curDate = new Date();
		Date nextDate = new Date();
    	nextDate.setTime(curDate.getTime() + (long)30 * 24 * 60 * 60 * 1000L);
		//nextDate.setTime(curDate.getTime() + 60*60* 1000);
		System.out.println(curDate.getTime());
    	System.out.println(nextDate + "     " + curDate);
    	try {
    	    java.sql.Date expdate = new java.sql.Date(nextDate.getTime());
		    pst =  con.prepareStatement("update ts_trainee_round set status = "+"'"+status+"'"+" where traineeId = "+"'"+traineeId+"'"+" and selection_round in(select id from ts_selection_round where roundNumber = "+roundid+" and drive_fk="+driveid+")");
		    System.out.println(pst);
		    int ans = pst.executeUpdate();
		    if(ans > 0) {
					result = true;
					if(status.equals("No_show")) {
		                System.out.println("no show status"+expdate);
    					pst = con.prepareStatement("update ts_trainee set Active = false,Reason ="+"'"+status+"'"+" where traineeId ="+"'"+traineeId+"'");
    					pst1 = con.prepareStatement("insert into table1 values("+"'"+traineeId+"'"+","+"'"+expdate+"'"+")");
    					System.out.println(pst1);
    					int flag = pst.executeUpdate();
    					int flag1 = pst1.executeUpdate();
		    	        if(flag > 0 && flag1 > 0) {
                            System.out.println("updated");		          	
			            } else {
			        	    System.out.println("not executed");
			            }
					}
				}
			} catch (SQLException e) {
				System.out.println("PARSE update");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result; 
	}
	
	public boolean scheduleTraineeview(String traineeId,int driveid,int roundid,String date,String time) throws SQLException, ClassNotFoundException, IOException{
		boolean result = false;
			String updated = "qwe";
			String status = "none";
			pst = con.prepareStatement("select id from ts_selection_round where roundNumber = "+roundid+" "+"and drive_fk="+driveid+" and date="+"'"+date+"'"+" and time = "+"'"+time+"'");
			System.out.println(pst);
			rs = pst.executeQuery();
			while(rs.next()){
			pst =  con.prepareStatement("insert into ts_trainee_round(traineeId,status,updatedBy,selection_round) values("+"'"+traineeId+"'"+","+"'"+status+"'"+","+"'"+updated+"'"+","+rs.getInt(1)+")");		
			System.out.println(pst);
			try {
				int ans = pst.executeUpdate();
				if(ans > 0) {
					result = true;
				}
			} catch (SQLException e) {
				System.out.println("execute update");
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
			return result;
			
	}
	public ArrayList<TraineeBean> scheduleTrainee(String driveid ,String roundId, int choice) throws SQLException{
		ArrayList<BroadcastPojo> dd = new ArrayList<BroadcastPojo>();
		int driveId = Integer.parseInt(driveid);
		int roundid = Integer.parseInt(roundId);
		ArrayList<TraineeBean> tbeanList = new ArrayList<TraineeBean>();
		System.out.println("hey thsis nikku "+driveId);
		pst = con.prepareStatement(" select DISTINCT traineeId,status from ts_trainee_round t where selection_round IN(select id  from  ts_selection_round where roundNumber = "+roundid+" and drive_fk ="+ driveid+")");
		rs4 = pst.executeQuery();
		System.out.println(pst);
		
		pst = con.prepareStatement("select demand_fk from ts_drive where drive_id ="+driveId);
		System.out.println(pst);
		
		try{
			rs = pst.executeQuery();
		}catch(Exception e){
			System.out.println("awesrdtfgbhjnkm");
		}

		while(rs.next()){
			demandid = rs.getInt(1);
			System.out.println( "scheduleDAO demandid "+rs.getInt(1));
		}
		if(roundid == 1){
			int flag = 0;
			if(choice == 0){
				pst = con.prepareStatement("select * from ts_broadcast b where b.demand_fk ="+demandid+" "+"and b.trainee_fk NOT IN (select t.traineeId from ts_trainee_round t,ts_selection_round s where s.id = t.selection_round and s.drive_fk ="+driveid+")");
				System.out.println(pst);
			}else{
				pst = con.prepareStatement("select * from ts_broadcast b where b.demand_fk ="+demandid+" "+"and b.trainee_fk IN (select t.traineeId from ts_trainee_round t,ts_selection_round s where s.id = t.selection_round and s.drive_fk ="+driveid+")");
				System.out.println(pst);
			}
		
			rs2 = pst.executeQuery();
			while(rs2.next()){
				BroadcastPojo demand = new BroadcastPojo(rs2.getInt(1),rs2.getBoolean(2),rs2.getString(3),rs2.getString(4),
				rs2.getBoolean(5),rs2.getString(6),rs2.getString(7),rs2.getString(8),rs2.getInt(9)
				,rs2.getString(10),rs2.getBoolean(11));
				dd.add(demand);
				pst = con.prepareStatement("select name,batch,traineeId,mobile from ts_trainee where traineeId=?");
				pst.setString(1, rs2.getString(10));
				rs = pst.executeQuery();
				while(rs.next()) {
					String name = rs.getString(1);
					String batch = rs.getString(2);
					String traineeId = rs.getString(3);
					String mobile = rs.getString(4);
					String reason = "none";
					while(rs4.next()){
						String i = rs4.getString(1);
						String j = rs2.getString(10);
						if( i.equals( j)){
							reason = rs4.getString(2);
							break;
						}
					}
					 TraineeBean bean = new TraineeBean(1,name,batch,traineeId,"null","null","null",mobile,"null",
	    			"null","null",0,0,0,0,0,0,0,"null","null","null","null","null","null",true,reason,"null","null","null");
	    	        tbeanList.add(bean);
				}
		
			}
		return tbeanList;
	}
	else{
		System.out.println("entered into else case");
		int round = roundid - 1;
		int flag = 0;
		if(choice == 0){
			pst = con.prepareStatement(" select DISTINCT traineeId from ts_trainee_round t where status = 'cleared' and selection_round IN(select id  from  ts_selection_round where roundNumber = "+round+" and drive_fk ="+ driveid+")");
			rs3 = pst.executeQuery();
			System.out.println(pst);
			while(rs3.next()){
				System.out.println(rs3.getString(1)+"out assssxdfcgvhjkl;;");
				flag = 0;
				while(rs4.next()){
					String i = rs3.getString(1);
					String j = rs4.getString(1);
					if(i.equals(j)){
						flag = 1;
						break;
					}
				}
				if(flag == 0){
					pst = con.prepareStatement("select name,batch,traineeId,mobile from ts_trainee where traineeId=?");
					pst.setString(1, rs3.getString(1));
					System.out.println("testing"+rs3.getString(1));
					rs = pst.executeQuery();
					while(rs.next()) {
						String name = rs.getString(1);
						String batch = rs.getString(2);
						String traineeId = rs.getString(3);
						String mobile = rs.getString(4);
						TraineeBean bean = new TraineeBean(1,name,batch,traineeId,"null","null","null",mobile,"null",
								"null","null",0,0,0,0,0,0,0,"null","null","null","null","null","null",true,"null","null","null","null"); 
						tbeanList.add(bean);
					}
				}
			}
		  return tbeanList;
		}
		else{
			System.out.println("entered into else of else");
			while(rs4.next()){
			pst = con.prepareStatement("select name,batch,traineeId,mobile,Reason from ts_trainee where traineeId=?");
			pst.setString(1, rs4.getString(1));
			
			rs = pst.executeQuery();
			while(rs.next()) {
				String name = rs.getString(1);
				String batch = rs.getString(2);
				String traineeId = rs.getString(3);
				String mobile = rs.getString(4);
				String reason = rs4.getString(2);
				TraineeBean bean = new TraineeBean(1,name,batch,traineeId,"null","null","null",mobile,"null",
						"null","null",0,0,0,0,0,0,0,"null","null","null","null","null","null",true,reason,"null","null","null"); 
				tbeanList.add(bean);
			}
		  }
		 return tbeanList;
		}
		}
	}
	
	
	
	
	
	public ArrayList<TraineeBean> displaySceduledTrainee(int driveid ,int roundid) throws SQLException{
		ArrayList<TraineeBean> tbeanList = new ArrayList<TraineeBean>();
		pst = con.prepareStatement(" select DISTINCT traineeId,status from ts_trainee_round t where status = 'cleared' and selection_round IN(select id  from  ts_selection_round where roundNumber = "+roundid +" and drive_fk ="+ driveid+")");
		rs1 = pst.executeQuery();
		while(rs1.next()){
			pst = con.prepareStatement("select name,batch,traineeId,mobile,Reason from ts_trainee where traineeId=?");
			pst.setString(1, rs1.getString(1));
			
			rs = pst.executeQuery();
			while(rs.next()) {
				String name = rs.getString(1);
				String batch = rs.getString(2);
				String traineeId = rs.getString(3);
				String mobile = rs.getString(4);
				String reason = rs1.getString(2);
				TraineeBean bean = new TraineeBean(1,name,batch,traineeId,"null","null","null",mobile,"null",
"null","null",0,0,0,0,0,0,0,"null","null","null","null","null","null",true,reason,"null","null","null"); 
				tbeanList.add(bean);
			}
		}
		
	
		return tbeanList;
	}
		
}
