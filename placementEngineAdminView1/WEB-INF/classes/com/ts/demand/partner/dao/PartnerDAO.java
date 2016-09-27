package com.ts.demand.partner.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.ts.demand.pojo.PartnerPojo;
import java.sql.PreparedStatement;
//import com.bvrit.partner.;
//import com.mysql.jdbc.PreparedStatement;
public class PartnerDAO {

	Connection con;
	ConnectionDAO cdao;
	PreparedStatement pst;
	PreparedStatement pst2;
	ResultSet rs;
	ResultSet rs2;

	public PartnerDAO() throws ClassNotFoundException, SQLException {
		cdao = new ConnectionDAO();
		con = cdao.getConnection();
	}

	public int addPartner(PartnerPojo pp) throws SQLException, ClassNotFoundException, IOException{
		int result = 0;
		try {
			System.out.println("pp.getName()"+pp.getName());
			pst =  con.prepareStatement("insert into ts_partner(partner_id,Name,Website,City,Address,Description) values('"+pp.getPartner_id()+"','"+pp.getName()+"','"+pp.getWebsite()+"','"+pp.getCity()+"','"+pp.getAddress()+"','"+pp.getDescription()+"')");
			pst2 =  con.prepareStatement("select partner_id from ts_partner where Name = "+"'"+pp.getName()+"'");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("error");
			e.printStackTrace();
		}
		try {
			int ans = pst.executeUpdate();
			if(ans > 0) {
				System.out.println("inserted");
			}
		} catch (SQLException e) {
			System.out.println("execute update");
			e.printStackTrace();
			return result;
		}
		try {
			rs2 = pst2.executeQuery();
			System.out.println("execute query");
		} catch (SQLException e) {
			System.out.println("execute query");
			e.printStackTrace();
		}
		System.out.println(result);
		while(rs2.next()){
			result = Integer.parseInt( rs2.getString(1));}
			System.out.println(result);
			return result; 
	}

	public int updatePartner(PartnerPojo pp) throws SQLException {
		int result = 0;
		try {
			pst = con.prepareStatement("update ts_partner SET Name='"+pp.getName()+"',Website='"+pp.getWebsite()+"',city='"+pp.getCity()+"',Address='"+pp.getAddress()+"',Description='"+pp.getDescription()+"' where partner_id='"+pp.getPartner_id()+"'");
			//pst.setInt(1, pp.getPartner_id());
			result = pst.executeUpdate();
			System.out.println(pst);
		} catch (SQLException e) {
			System.out.println("in exception");
			e.printStackTrace();
			return result;
		}
		return result;
	} 

	public ArrayList<PartnerPojo> getAllPartners() throws SQLException, ClassNotFoundException, IOException{
		ArrayList<PartnerPojo>  cc = new ArrayList<PartnerPojo>();
		PartnerPojo pp;
		try {
			pst =  con.prepareStatement("select * from ts_partner");
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

	public ArrayList<PartnerPojo> getUpdateDetails(long Id) throws SQLException, ClassNotFoundException, IOException{
		ArrayList<PartnerPojo>  cc = new ArrayList<PartnerPojo>();
		PartnerPojo pp;
		try {
			pst =  con.prepareStatement("select * from ts_partner where partner_id = '"+Id+"' ");
			rs=pst.executeQuery();
		} catch (SQLException e) {
		    e.printStackTrace();
		}
		if(rs.next()){
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
	
	public ArrayList<PartnerPojo> getPartnerName(long partner_id) throws SQLException, ClassNotFoundException, IOException{
		ArrayList<PartnerPojo>  cc = new ArrayList<PartnerPojo>();
		PartnerPojo pp;
		try {
			pst =  con.prepareStatement("select * from ts_partner where partner_id = '"+partner_id+"'");
			rs=pst.executeQuery();
		} catch (SQLException e) {
    	    e.printStackTrace();
  	    }
		while(rs.next()){
			partner_id = rs.getLong(1);
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