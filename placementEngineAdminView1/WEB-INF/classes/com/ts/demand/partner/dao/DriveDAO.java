package com.ts.demand.partner.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ts.demand.partner.dao.ConnectionDAO;
import com.ts.demand.partner.dao.Demand;
import com.ts.demand.partner.dao.Drive;
import com.ts.demand.partner.dao.Round;
import com.ts.demand.pojo.DrivePojo;
import com.ts.demand.pojo.DriveRoundsPojo;

public class DriveDAO {
	Connection con;  
	ConnectionDAO cdao;
	PreparedStatement pst;
	PreparedStatement pst1;
	PreparedStatement pst2;
	ResultSet rs;
	ResultSet rs1;
	Statement st;
	
	public DriveDAO() throws ClassNotFoundException, SQLException{
		cdao = new ConnectionDAO();
		con = cdao.getConnection();
	}
	
	public boolean createDrive(DrivePojo dpojo, ArrayList<DriveRoundsPojo> rpojo) throws SQLException{
		boolean result = false;
		String q = "insert into ts_drive(name, demand_fk) values('" +dpojo.getName()+ "', " +dpojo.getDemand_fk()+")";
		pst = con.prepareStatement(q);
		System.out.println(dpojo.getDemand_fk());
	    int ans = pst.executeUpdate();  
		  int id = 0;
		  pst1 = con.prepareStatement("select drive_id from ts_drive where name = '"+dpojo.getName()+"'");
			rs =pst1.executeQuery();
		  while(rs.next()){
		   id =Integer.parseInt( rs.getString(1));
		  }
		  System.out.println("Id = " + id);
		  int j = 0;
		  System.out.println("before loop");
		  System.out.println("round.length");
		  for(DriveRoundsPojo r : rpojo){
		   st = con.createStatement();
		   System.out.println(r);
		   System.out.println("in loop");
		      j = st.executeUpdate("insert into ts_drive_rounds values ("+id+",'"+r.getRounds()+"',"+r.getRound_num()+")");
		   
		  }
		  System.out.println(ans+"   " + j); 
		  if(ans > 0 && j != 0 ){
		   result = true;
		  }
		  return result;
		 }
	public ArrayList<Drive> getAllDrives() throws SQLException{

		ArrayList<Drive> cc = new ArrayList<Drive>();

		try {
		pst = con.prepareStatement("select name from ts_drive");
		} catch (SQLException e) {
		System.out.println("error");
		e.printStackTrace();
		}
		try {
		rs =pst.executeQuery();
		} catch (SQLException e) {
		e.printStackTrace();
		}
		while(rs.next()){
		Drive driver = new Drive(rs.getString(1));
		cc.add(driver);
		}
		return cc;

		}
	
	public ArrayList<Demand> listAllDemands() throws SQLException{
		ArrayList<Demand> dd = new ArrayList<Demand>();
		pst = con.prepareStatement("select DISTINCT a.ref_id,c.Name,a.created from ts_demand a,ts_partner c where a.partnerid_fk = c.partner_id and NOT EXISTS(select b.demand_fk from ts_drive b where b.demand_fk = a.demand_id)");
		System.out.println(pst);
		rs = pst.executeQuery();
		System.out.println("query executed");
		while(rs.next()){
		Demand demand = new Demand(rs.getString(1),rs.getString(2),rs.getString(3));
		dd.add(demand);
		}
		return dd;
		}
	
	public ArrayList<DriveRoundsPojo> getAllRounds(String drivename) throws SQLException{
		ArrayList<DriveRoundsPojo> rr = new ArrayList<DriveRoundsPojo>();
		System.out.println("In getAllrounds()");
		pst1 = con.prepareStatement("Select drive_id from ts_drive Where name = '"+drivename+"'");
		rs1 = pst1.executeQuery();
		String id = "";
		while(rs1.next()){
			id = rs1.getString(1);
		}
		pst = con.prepareStatement("Select * from ts_drive_rounds where Drive_id = '"+id+"'");
		rs = pst.executeQuery();
		while(rs.next()){
			DriveRoundsPojo rpojo = new DriveRoundsPojo(rs.getInt(1), rs.getString(2), rs.getInt(3));
			rr.add(rpojo);
		}
		return rr;
	}
	public int addRound(String drivename, String round ,int freq) throws SQLException{
		int result = 0;
		if(freq == 2){
			return 1;
		}
		pst = con.prepareStatement("Select drive_id From ts_drive where name = '"+drivename+"'");
		rs = pst.executeQuery();
		int round_num = 0;
		int id = 0;
		while(rs.next()){
		id = Integer.parseInt(rs.getString(1));
		}
		System.out.println(id+"qeertyui");
		System.out.println("getting rounds");
		String query2 = "Select rounds from ts_drive_rounds where drive_id = "+id;
		pst1 = con.prepareStatement(query2);
		rs1 = pst1.executeQuery();
		System.out.println("checking duplicates");
		while(rs1.next()){
			if(round.equals(rs1.getString(1))){
				if(freq == 0){
					return 11;
				}
				else{
					round_num = round_num +1;
				}
			}else{
			round_num = round_num +1;
			}
		}
		System.out.println("completely checking duplicates");
		round_num = round_num +1;
		pst2 = con.prepareStatement("Insert into ts_drive_rounds values(?,?,?)");
		pst2.setInt(1, id);
		pst2.setString(2, round);
		pst2.setInt(3, round_num);
		int ans = pst2.executeUpdate();
		if(ans > 0){
			result = 1;
		}
		return result;
	}



public String getDriveName(String demand) throws SQLException{
		String drivename = "";
		pst1 = con.prepareStatement("Select partnerid_fk From ts_demand Where ref_id = '"+demand+"'");
		rs1 = pst1.executeQuery();
		Long partnerid = null;
		while(rs1.next()){
			partnerid = Long.parseLong(rs1.getString(1));
		}
		//System.out.println(partnerid);
		pst = con.prepareStatement("Select name From ts_partner where partner_id = ("+partnerid+")");
		rs = pst.executeQuery();
		String partner = null;
		while(rs.next()){
			partner = rs.getString(1);
		}
		System.out.println(partner);
		drivename = partner+"-"+demand;
		return drivename;

	}
public Long getDemandId(String ref_id) throws SQLException{
		Long id = null;
		pst1 = con.prepareStatement("Select demand_id From ts_demand Where ref_id = '"+ref_id+"'");
		rs1 = pst1.executeQuery();
		while(rs1.next()){
			id = Long.parseLong(rs1.getString(1));
		}
		return id;
	}

}