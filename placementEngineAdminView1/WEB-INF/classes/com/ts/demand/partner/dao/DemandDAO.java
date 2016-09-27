package com.ts.demand.partner.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.ts.demand.pojo.DemandPojo;
import com.ts.demand.pojo.PartnerPojo;
import com.ts.demand.pojo.TraineeBean;

public class DemandDAO {
	Connection con;
    ConnectionDAO cdao;
    PreparedStatement pst;
		    
    public DemandDAO() 
        throws SQLException, ClassNotFoundException {
        cdao = new ConnectionDAO();
        con = cdao.getConnection();
    }
    
    public ArrayList<TraineeBean> getBroadcastTraineesForDemand(long demand_id) throws SQLException {
        ArrayList<TraineeBean> 	trainees = new ArrayList<TraineeBean>();
        pst = con.prepareStatement("select distinct t.* from ts_trainee t, ts_demand d where t.skill in (select skills from ts_demand_skills where Demand_id = ?);");
        pst.setLong(1, demand_id);
        ResultSet rs = pst.executeQuery();
        TraineeBean tbean = null;
        while(rs.next()) {
       	    tbean = new TraineeBean(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),
                    rs.getString(9),rs.getString(10),rs.getString(11),rs.getInt(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16),rs.getInt(17),
                    rs.getInt(18),rs.getString(19),rs.getString(20),rs.getString(21),rs.getString(22),rs.getString(22),rs.getString(22),rs.getBoolean(23),
                    rs.getString(24),rs.getString(25),rs.getString(26),rs.getString(27));
            trainees.add(tbean);
        }
        return trainees;
    }

    public boolean appliedTrainee(String traineeId, long demand_id) throws SQLException {
    	boolean result = false;
    	pst = con.prepareStatement("update ts_broadcast b, ts_trainee t set b.applied=? where b.trainee_fk=? and demand_fk=?");
        pst.setBoolean(1, true);
        pst.setString(2, traineeId);
        pst.setLong(3, demand_id);
        int flag = pst.executeUpdate();
    	if(flag > 0) {
    		result = true;
    	}
        return result;	
    }
    
    public ArrayList<TraineeBean> getBroadcastDetails(long demand_id) throws SQLException {
    	ArrayList<TraineeBean> broadcastTrainees= new ArrayList<TraineeBean>();
    	pst = con.prepareStatement("select distinct t.* from ts_broadcast b, ts_trainee t where demand_fk=? and applied=? and t.traineeId = b.trainee_fk");
    	pst.setLong(1, demand_id);
    	pst.setBoolean(2, true);
    	ResultSet rs = pst.executeQuery();
    	TraineeBean tbean = null;
    	if(rs.next()) {
        	while(rs.next()) {
        	    tbean = new TraineeBean(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),
                        rs.getString(9),rs.getString(10),rs.getString(11),rs.getInt(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16),rs.getInt(17),
                        rs.getInt(18),rs.getString(19),rs.getString(20),rs.getString(21),rs.getString(22),rs.getString(22),rs.getString(22),rs.getBoolean(23),
                        rs.getString(24),rs.getString(25),rs.getString(26),rs.getString(27));
                broadcastTrainees.add(tbean);
        	}
    	}
    	return broadcastTrainees;
    	
    }
    public boolean addTraineeToDemand(String traineeId, long demand_id, boolean eligible) throws SQLException {
    	boolean result = false;
    	pst = con.prepareStatement("insert into ts_broadcast(broadcastId, created, eligible, expiryDate, demand_fk, trainee_fk, applied, emailSent) values(?,?,?,?,?,?,?,?)");
    	pst.setString(1, "B"+traineeId);
    	pst.setDate(2, new Date(new java.util.Date().getTime()));
    	pst.setBoolean(3, eligible);
    	pst.setDate(4, new Date(new java.util.Date().getTime() + 1 * 24 * 60 * 60 * 1000));
    	pst.setLong(5, demand_id);
    	pst.setString(6, traineeId);
    	pst.setBoolean(7, true);
    	pst.setBoolean(8, eligible);
    	int flag = pst.executeUpdate();
    	if(flag > 0) {
    		result = true;
    	}
    	return result;
    }
    
    public boolean insertBroadCastDetails(long demand_id, ArrayList<TraineeBean> etrainees) throws SQLException {
    	boolean result = false;
    	System.out.println("inside broadcast details");
    	int flag = 1;
    	for(TraineeBean etrainee:etrainees) {
            System.out.println("inside etrainees");
        	pst = con.prepareStatement("insert into ts_broadcast(broadcastId, created, eligible, expiryDate, demand_fk, trainee_fk, applied, emailSent) values(?,?,?,?,?,?,?,?)");
        	pst.setString(1, "B"+etrainee.getTraineeid()+demand_id);
        	pst.setDate(2, new Date(new java.util.Date().getTime()));
        	pst.setBoolean(3, true);
        	pst.setDate(4, new Date(new java.util.Date().getTime() + 1 * 24 * 60 * 60 * 1000));
        	pst.setLong(5, demand_id);
        	pst.setString(6, etrainee.getTraineeid());
        	pst.setBoolean(7, false);
        	pst.setBoolean(8, true);
        	System.out.println("before execute");
        	int res = pst.executeUpdate();
        	if(res <= 0) {
        	    flag = 0;
        	    break;
        	} 
    	}
    	if(flag == 1)
    		result = true;
    	return result;
    }
    
    public PartnerPojo getPartnerDetails(long partner_id) throws SQLException {
    	pst = con.prepareStatement("select * from ts_partner where partner_id=?");
    	pst.setLong(1, partner_id);
    	ResultSet rs = pst.executeQuery();
    	rs.next();
    	PartnerPojo ppojo = new PartnerPojo(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getString(4),
    			rs.getString(5), rs.getString(6));
    	return ppojo;
    }
    
    public boolean cancelDemand(long demand_id) throws SQLException {
    	boolean result = false;
    	pst = con.prepareStatement("update ts_demand d, ts_drive dr, ts_drive_rounds drd,"
    			+ " ts_selection_round sr set active=? where d.demand_id = ?"
                + " and (dr.demand_fk != d.demand_id or drd.Drive_id != dr.drive_id"
                + " or  sr.drive_fk = drd.Drive_id);");
    	pst.setBoolean(1, false);
    	pst.setLong(2, demand_id);
    	int flag = pst.executeUpdate();
    	if (flag > 0) 
    		result = true;
    	return result;
    }
    
    public ArrayList<TraineeBean> getEligibleTraineesForDemand(long demand_id) throws SQLException {
        //pst = con.prepareStatement("select t.* from ts_demand d, ts_trainee t where d.demand_id = ? and t.marks10 >= d.marks10 and t.marks12 >= d.marks12 and t.marksUG >= d.marksUG and (t.certification = d.certification or d.certification = 'Not Applicable') and (d.gender = 'Any' or t.gender = d.gender) and t.yearOfGrad >= d.lastGradYear and t.lastGraduation in (select degrees from ts_demand_degrees where demand_id = ?) and (t.lastGraduation LIKE 'B' or t.marksPG >= d.marksPG);");
        pst = con.prepareStatement("select t.* from ts_demand d, ts_trainee t where demand_id = ? and t.marks10 >= d.marks10 and t.marks12 >= d.marks12 and t.marksUG >= d.marksUG and (t.certification = d.certification or d.certification = 'Not Applicable') and (t.gender = d.gender or d.gender = 'Any') and t.yearOfGrad >= d.lastGradYear and (t.lastGraduation in (select degrees from ts_demand_degrees where demand_id = ?)) and (t.lastGraduation like 'B%' or t.marksPG >= d.marksPG);");
    	pst.setLong(1, demand_id);
        pst.setLong(2, demand_id);
        //pst.setBoolean(3, true);
        //pst.setLong(3, demand_id);
        ResultSet rs = pst.executeQuery();
        ArrayList<TraineeBean> etraineelist = new ArrayList<TraineeBean>();
        TraineeBean etBean; 
        while(rs.next()) {
            etBean = new TraineeBean(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getString(8),
                    rs.getString(9),rs.getString(10),rs.getString(11),rs.getInt(12),rs.getInt(13),rs.getInt(14),rs.getInt(15),rs.getInt(16),rs.getInt(17),
                    rs.getInt(18),rs.getString(19),rs.getString(20),rs.getString(21),rs.getString(22),rs.getString(22),rs.getString(22),rs.getBoolean(23),
                    rs.getString(24),rs.getString(25),rs.getString(26),rs.getString(27));
            etraineelist.add(etBean);
        }
        return etraineelist;
    }

    public boolean addDemandDegrees(ArrayList<String> degrees, long demand_id) throws SQLException {
        boolean result = false;
        pst = con.prepareStatement("insert into ts_demand_degrees values(?,?)");
        for(String degree:degrees) {
            pst.setLong(1, demand_id);
        	pst.setString(2, degree);
        	int flag = pst.executeUpdate();
            if(flag > 0)
                result = true;
        	}
        return result;
    }

    private boolean addDemandDegree(String degree, long demand_id) throws SQLException {
        pst = con.prepareStatement("insert into ts_demand_degrees values(?,?)");
        pst.setLong(1, demand_id);
        pst.setString(2, degree);
        int flag = pst.executeUpdate();
        if(flag > 0) {
          	return true;
        }
        return false;
    }

    public boolean deleteDemandDegree(String degree,long demand_id) throws SQLException {
        pst = con.prepareStatement("delete from ts_demand_degrees where Demand_id=? and degrees=?");
        pst.setLong(1, demand_id);
        pst.setString(2, degree);
        int flag = pst.executeUpdate();
        if(flag > 0) {
          	return true;
        }
        return false;
    }

    public boolean editDemand(DemandPojo dempojo) throws SQLException {
        boolean result = false;
        pst = con.prepareStatement("update ts_demand set bondDetails=?,bondDuration=?,certification=?,"
            		+ "compensation=?, gender=?,jobTitle=?,lastGradYear=?,location=?,marks10=?,marks12=?,"
            		+ "marksUG=?,marksPG=?,name=?,numberOfPositions=?,specialConditions=?,constraintLocation=?,"
            		+ "jobDescription=? where demand_id=?");
        pst.setString(1, dempojo.getBondDetails());
        pst.setString(2, dempojo.getBondDuration());
        pst.setString(3, dempojo.getCertification());
        pst.setString(4, dempojo.getCompensation());
        pst.setString(5, dempojo.getGender());
        pst.setString(6, dempojo.getJobTitle());
        pst.setInt(7, dempojo.getLastGradYear());
        pst.setString(8, dempojo.getLocation());
        pst.setDouble(9, dempojo.getMarks10());
        pst.setDouble(10, dempojo.getMarks12());
        pst.setDouble(11, dempojo.getMarksPG());
        pst.setDouble(12, dempojo.getMarksUG());
        pst.setString(13, dempojo.getName());
        pst.setInt(14, dempojo.getNumberOfPositions());
        pst.setString(15, dempojo.getSpecialConditions());
        pst.setString(16, dempojo.getConstraintLocation());
        pst.setString(17, dempojo.getJobDescription());
        pst.setLong(18, dempojo.getDemand_id());
        int flag = pst.executeUpdate();
        if(flag != 0) {
          	ArrayList<String> skills_new = dempojo.getSkills();
           	pst = con.prepareStatement("select * from ts_demand_skills where demand_id=?");
           	pst.setLong(1, dempojo.getDemand_id());
           	ResultSet rs1 = pst.executeQuery();
           	ArrayList<String> skills = new ArrayList<String>();
           	while(rs1.next()) {
                skills.add(rs1.getString(2));
            }
           	for(String skill:skills) {
           	    if(skills_new.contains(skill) == false) {
           		deleteDemandSkill(skill, dempojo.getDemand_id());
           	    }
           	}
           	for(String skill_new:skills_new) {
                if(skills.contains(skill_new) == false) {
           		addDemandSkill(skill_new,dempojo.getDemand_id());        
    	    }
           	}
            ArrayList<String> degrees_new = dempojo.getDegrees();
            pst = con.prepareStatement("select * from ts_demand_degrees where demand_id=?");
           	pst.setLong(1, dempojo.getDemand_id());
           	rs1 = pst.executeQuery();
           	ArrayList<String> degrees = new ArrayList<String>();
           	while(rs1.next()) {
                degrees.add(rs1.getString(2));
            }
           	for(String degree:degrees) {
           	    if(degrees_new.contains(degree) == false) {
             		deleteDemandDegree(degree, dempojo.getDemand_id());
           	    }
           	}
           	for(String degree_new:degrees_new) {
                if(degrees.contains(degree_new) == false) {
           		addDemandDegree(degree_new,dempojo.getDemand_id());        
    	    }
           	}
           	result = true;
        }
        return result;
    }	

    public boolean addDemand(DemandPojo dempojo) throws SQLException {
        boolean result = false;
        pst = con.prepareStatement("INSERT INTO ts_demand(ref_id, bondDetails, "
          		+ "bondDuration, certification, compensation, created, endDate,"
           		+ "gender, jobTitle, lastGradYear, location, marks10, marks12,"
           		+ " marksPG, marksUG, numberOfPositions, specialConditions,"
           		+ "constraintLocation,jobDescription,contactid_fk,partnerid_fk,"
           		+ "name, active) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,"
           		+ "?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
        pst.setString(1, dempojo.getRef_id());
        pst.setString(2, dempojo.getBondDetails());
        pst.setString(3, dempojo.getBondDuration());
        pst.setString(4, dempojo.getCertification());
        pst.setString(5, dempojo.getCompensation());
        pst.setDate(6, 	new java.sql.Date(dempojo.getCreatedDate().getTime()));
        pst.setDate(7, new java.sql.Date(dempojo.getEndDate().getTime()));
        pst.setString(8, dempojo.getGender());
        pst.setString(9, dempojo.getJobTitle());
        pst.setInt(10, dempojo.getLastGradYear());
        pst.setString(11, dempojo.getLocation());
        pst.setDouble(12, dempojo.getMarks10());
        pst.setDouble(13, dempojo.getMarks12());
        pst.setDouble(14, dempojo.getMarksPG());
        pst.setDouble(15, dempojo.getMarksUG());
        pst.setInt(16, dempojo.getNumberOfPositions());
        pst.setString(17, dempojo.getSpecialConditions());
        pst.setString(18, dempojo.getConstraintLocation());
        pst.setString(19,dempojo.getJobDescription());
        pst.setLong(20, dempojo.getContact_id());
        pst.setLong(21, dempojo.getPartner_id());
        pst.setString(22, dempojo.getName());
        pst.setBoolean(23, dempojo.getActive());
        int flag = pst.executeUpdate();
        if(flag > 0) {
            ResultSet rs = pst.getGeneratedKeys();
            long demand_id;
            rs.next();
           	demand_id = rs.getInt(1);
            boolean flag1 = addDemandSkills(dempojo.getSkills(), demand_id); 
            boolean flag2 = addDemandDegrees(dempojo.getDegrees(), demand_id);
            if (flag1 && flag2)
                result = true;
        }
        return result;
    }

    public ArrayList<DemandPojo> listAllDemands() throws SQLException {
        ArrayList<DemandPojo> demandList = new ArrayList<DemandPojo>();
    	pst = con.prepareStatement("select d.*,p.Name from ts_demand d, ts_partner p where d.partnerid_fk=p.partner_id;");
    	ResultSet rs = pst.executeQuery();
        while(rs.next()) {
        	pst = con.prepareStatement("select * from ts_demand_skills where demand_id=?");
        	pst.setInt(1, rs.getInt(1));
        	ResultSet rs1 = pst.executeQuery();
        	ArrayList<String> skills = new ArrayList<String>();
        	while(rs1.next())
        		skills.add(rs1.getString(2));
        	pst = con.prepareStatement("select * from ts_demand_degrees where demand_id=?");
        	pst.setInt(1, rs.getInt(1));
        	rs1 = pst.executeQuery();
        	ArrayList<String> degrees = new ArrayList<String>();
        	while(rs1.next())
        		degrees.add(rs1.getString(2));
        	DemandPojo dempojo = new DemandPojo(rs.getLong(1), rs.getString(2), 
       				rs.getBoolean(3), rs.getString(4), rs.getString(5), 
       				rs.getString(6), rs.getString(7), rs.getDate(8),
       				rs.getDate(9), rs.getString(10), rs.getString(11), 
       				rs.getInt(12), rs.getString(13), rs.getDouble(14), 
       				rs.getDouble(15), rs.getDouble(16), rs.getDouble(17), 
       				rs.getString(18), rs.getInt(19), rs.getString(20), 
       				rs.getLong(21), rs.getLong(22), rs.getString(23),
       				rs.getString(24),skills, degrees, rs.getString(25));
        	demandList.add(dempojo);
        }
        return demandList;
    }
    
    public boolean addDemandSkills(ArrayList<String> skills, long demand_id) throws SQLException {
    	boolean result = false;
    	pst = con.prepareStatement("insert into ts_demand_skills values(?,?)");
    	for(String skill:skills) {
    		pst.setLong(1, demand_id);
    		pst.setString(2, skill);
    		int flag = pst.executeUpdate();
            if(flag > 0)
                result = true;
    	}
    	return result;
    }
    
    public DemandPojo getDemandDetails(long demand_id) throws SQLException {
    	System.out.println("inside getDemand()");
    	System.out.println(demand_id);
    	pst = con.prepareStatement("select d.*,p.Name from ts_demand d, ts_partner p where demand_id=? and d.partnerid_fk = p.partner_id;");
    	pst.setLong(1, demand_id);
    	System.out.println("before execute");
    	ResultSet rs = pst.executeQuery();
    	System.out.println("after execute");
    	pst = con.prepareStatement("select * from ts_demand_skills where demand_id=?");
    	pst.setLong(1, demand_id);
    	System.out.println("before execute 2");
    	ResultSet rs1 = pst.executeQuery();
    	ArrayList<String> skills = new ArrayList<String>();
    	System.out.println("after execute 2");
    	while(rs1.next()) {
    		skills.add(rs1.getString(2));
    	}
    	System.out.println("before execute 3");
    	pst = con.prepareStatement("select * from ts_demand_degrees where demand_id=?");
    	pst.setLong(1, demand_id);
    	rs1 = pst.executeQuery();
    	System.out.println("after execute 3");
    	ArrayList<String> degrees = new ArrayList<String>();
    	while(rs1.next()) {
    		degrees.add(rs1.getString(2));
    	}
    	rs.next();
    	System.out.println("aaaaaaaa");
    	DemandPojo dempojo = new DemandPojo(demand_id ,rs.getString(2), rs.getBoolean(3),
    			rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7),
    			rs.getDate(8), rs.getDate(9), rs.getString(10), rs.getString(11),
    			rs.getInt(12), rs.getString(13), rs.getDouble(14), rs.getDouble(15),
    			rs.getDouble(16), rs.getDouble(17), rs.getString(18),
    			rs.getInt(19), rs.getString(20), rs.getLong(21), rs.getLong(22),
    			rs.getString(23), rs.getString(24), skills, degrees, rs.getString(25));
    	System.out.println("bbbbbbbbbb");
    	return dempojo;
    }
            
    private boolean addDemandSkill(String skill, long demand_id) throws SQLException {
        pst = con.prepareStatement("insert into ts_demand_skills values(?,?)");
        pst.setLong(1, demand_id);
        pst.setString(2, skill);
        int flag = pst.executeUpdate();
        if(flag > 0) {
        	return true;
        }
        return false;
	}

	public boolean deleteDemandSkill(String skill,long demand_id) throws SQLException {
		pst = con.prepareStatement("delete from ts_demand_skills where Demand_id=? and skills=?");
        pst.setLong(1, demand_id);
        pst.setString(2, skill);
        int flag = pst.executeUpdate();
        if(flag > 0) {
        	return true;
        }
    	return false;
    }
	
	public boolean deleteDemandSkills(long demand_id) throws SQLException {
		pst = con.prepareStatement("delete from ts_demand_skills where Demand_id=?");
        pst.setLong(1, demand_id);
        int flag = pst.executeUpdate();
        if(flag >= 0) {
        	return true;
        }
    	return false;
    }


	public boolean deleteDemand(long demand_id) throws SQLException {
		pst = con.prepareStatement("delete from ts_demand where demand_id=?");
		pst.setLong(1, demand_id);
		int flag = pst.executeUpdate();
		if(flag > 0) {
		    boolean result = deleteDemandSkills(demand_id);
		    if(result)
		    	return true;
		}
		return false;
	}
}
