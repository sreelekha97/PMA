package com.ts.demand.partner.dao;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
public class AdminDAO {
	public static String username = null;
	Connection con;
	ConnectionDAO cdao;
	PreparedStatement pst;
	Statement st;
	public AdminDAO()
		throws ClassNotFoundException,SQLException{
		cdao = new ConnectionDAO();
		con = cdao.getConnection();
	}
	
	public boolean login(String user, String password)
			throws ClassNotFoundException,SQLException{
			boolean result = false;
			System.out.println("in admin dao");
			pst =  con.prepareStatement("Select * from ts_admin_login where login_id = '" + user + "'");
			//System.out.println(pst);
			ResultSet r  =  pst.executeQuery();
			if(r.next()){
				if(r.getString(2).equals(password)){
					result = true;
					AdminDAO.username = user ;
					System.out.println(username);
				}else{
					result = false;
				}
			}
			else{
				System.out.println("please enter correct login id/ password");
			}
			return result;
		}
	public boolean changePassword(String user,String password,String newpassword){
		boolean result = false;
		try {
			pst =  con.prepareStatement("update user set password ="+"'"+newpassword+"'"+"where username ="+"'"+user+"'");
		} catch (SQLException e) {
			System.out.println("error");
			e.printStackTrace();
		}
		try {
			int ans = pst.executeUpdate();
			if(ans>0){
				result = true;
			}
		} catch (SQLException e) {
			System.out.println("exxecute update");
			e.printStackTrace();
		}
		return result;
	}

	public boolean signup(String user, String role) throws SQLException {
		boolean result = false;
		String password = "changeme";
		String s = "insert into ts_admin_login(login_id,password) values ('"+user+"','"+password+"','"+role+"')";
		pst=con.prepareStatement(s);
		int a = pst.executeUpdate(s);
		if(a>0){
			st=con.createStatement();
			String stm = "select * from ts_admin_login";
			ResultSet rs = st.executeQuery(stm);
			if(rs.next()){
				if(rs.getString(1).equals(user)){
					result = false;
				}
				else{			
				    result = true;
			    }
		       
			}
	    }return result;
	    }
	public int ChangePassword(String user, String opassword, String npassword) throws SQLException {
		int result = 0;
		String s = "Update ts_admin_login set password = '"+npassword+"' where login_id = '"+user+"' and password = '"+npassword+"'";
		pst = con.prepareStatement(s);
		result = pst.executeUpdate();
		
		return result;
		
		
	}
}

