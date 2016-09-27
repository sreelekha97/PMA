package com.ts.demand.partner.dao;

import java.io.IOException;




import java.sql.Connection;

import java.sql.PreparedStatement;

import java.sql.ResultSet;

import java.sql.SQLException;

import java.util.ArrayList;




import com.ts.demand.pojo.ContactPojo;

import com.ts.demand.pojo.PartnerPojo;




public class ContactDAO {

	Connection con;

	ConnectionDAO cdao;

	PreparedStatement pst;

	ResultSet rs;

	

	public ContactDAO() throws ClassNotFoundException, SQLException {

		cdao = new ConnectionDAO();

		con = cdao.getConnection();

	}

	public boolean addContact(ContactPojo cp) throws SQLException, ClassNotFoundException, IOException{

		boolean result = false;

		try {

		    pst =  con.prepareStatement("insert into ts_contact(contact_id,Name,Title,Email,Phone,City,partner_fk) values("+cp.getContact_id()+",'"+cp.getName()+"','"+cp.getTitle()+"','"+cp.getEmail()+"','"+cp.getPhone()+"','"+cp.getCity()+"',"+cp.getPartner_fk()+")");

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

	

	public ArrayList<ContactPojo> getAllContacts(long partner_id) throws SQLException, ClassNotFoundException, IOException{

		ArrayList<ContactPojo>  cc = new ArrayList<ContactPojo>();

		ContactPojo cp;

		try {

			pst =  con.prepareStatement("select * from ts_contact where partner_fk = '"+partner_id+"'");

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

	

	public ArrayList<ContactPojo> getUpdateDetails(long cid) throws SQLException, ClassNotFoundException, IOException{

		ArrayList<ContactPojo>  cc = new ArrayList<ContactPojo>();

		ContactPojo cp;

		

		

		try {

			pst =  con.prepareStatement("select * from ts_contact where contact_id = '"+cid+"' ");

			rs=pst.executeQuery();

					

			} catch (SQLException e) {

			

			    e.printStackTrace();

		   }

		if(rs.next()){

			long contact_id = rs.getLong(1);

			 String Name = rs.getString("Name");

   			String Title = rs.getString("Title");

   			String Email = rs.getString("Email");

   			String Phone = rs.getString("Phone");

   			String City = rs.getString("city");

   			long partner_id = rs.getLong(7);

   			

   			cp  = new ContactPojo(contact_id,Name,Title, Email, Phone,City,partner_id);

   			cc.add(cp);

		}

		return  cc;

	}

	

	public int updateContact(ContactPojo cp) throws SQLException {

		int result = 0;

		try {

			pst = con.prepareStatement("update ts_contact SET Name='"+cp.getName()+"',Title='"+cp.getTitle()+"',Email='"+cp.getEmail()+"',Phone='"+cp.getPhone()+"',City='"+cp.getCity()+"' where contact_id='"+cp.getContact_id()+"'");

			//pst.setInt(1, pp.getPartner_id());

			result = pst.executeUpdate();

			System.out.println(pst);




		} catch (SQLException e) {

			System.out.println("in exception");

			e.printStackTrace();

		}

		return result;

		

	} 

	public ArrayList<ContactPojo> getContacts() throws SQLException, ClassNotFoundException, IOException{

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




}