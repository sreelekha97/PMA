package com.ts.demand.pojo;

import java.util.ArrayList;
import java.util.Date;

public class DemandPojo {
	private long demand_id;
	private String ref_id;
    private boolean active;
    private String bondDetails;
    private String bondDuration;
    private String certification;
    private String compensation;
    private Date createdDate;
    private Date endDate;
    private String gender;
    private String jobTitle;
	private int lastGradYear;
    private String location;
    private double marks10;
    private double marks12;
    private double marksPG;
    private double marksUG;
    private String name;
    private int numberOfPositions;
    private String specialConditions;
    private long contact_id;
    private long partner_id;
    private String constraintLocation;
    private String jobDescription;
    private ArrayList<String> skills;
    private ArrayList<String> degrees;
    private String partner_name;
    public DemandPojo() {
    	super();
    }
    
    public DemandPojo(long demand_id, String ref_id, boolean active, String bondDetails, String bondDuration,
			String certification, String compensation, Date createdDate, Date endDate, String gender,
			String jobTitle, int lastGradYear, String location, double marks10, double marks12, double marksPG,
			double marksUG, String name, int numberOfPositions, String specialConditions, long contact_id,
			long partner_id, String constraintLocation, String jobDescription, ArrayList<String> skills, ArrayList<String> degrees, String partner_name) {
		super();
		this.demand_id = demand_id;
		this.ref_id = ref_id;	
		this.active = active;
		this.bondDetails = bondDetails;
		this.bondDuration = bondDuration;
		this.certification = certification;
		this.compensation = compensation;
		this.createdDate = createdDate;
		this.endDate = endDate;
		this.gender = gender;
		this.jobTitle = jobTitle;
		this.lastGradYear = lastGradYear;
		this.location = location;
		this.marks10 = marks10;
		this.marks12 = marks12;
		this.marksPG = marksPG;
		this.marksUG = marksUG;
    	this.name = name;
		this.numberOfPositions = numberOfPositions;
		this.specialConditions = specialConditions;
		this.contact_id = contact_id;
		this.partner_id = partner_id;
		this.constraintLocation = constraintLocation;
		this.jobDescription = jobDescription;
		this.skills = skills;
		this.degrees = degrees;
		this.partner_name = partner_name;
	}
    
	public long getDemand_id() {
		return demand_id;
	}
	public String getRef_id() {
		return ref_id;
	}
	public boolean getActive() {
		return active;
	}
	public String getBondDetails() {
		return bondDetails;
	}
	public String getBondDuration() {
		return bondDuration;
	}
	public String getCertification() {
		return certification;
	}
	public String getCompensation() {
		return compensation;
	}
	public Date getCreatedDate() {
		return createdDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public String getGender() {
		return gender;
	}
	public String getJobTitle() {
		return jobTitle;
	}
	public int getLastGradYear() {
		return lastGradYear;
	}
	public String getLocation() {
		return location;
	}
	public double getMarks10() {
		return marks10;
	}
	public double getMarks12() {
		return marks12;
	}
	public double getMarksPG() {
		return marksPG;
	}
	public double getMarksUG() {
		return marksUG;
	}
	public String getName() {
		return name;
	}
	public int getNumberOfPositions() {
		return numberOfPositions;
	}
	public String getSpecialConditions() {
		return specialConditions;
	}
	public long getContact_id() {
		return contact_id;
	}
	public long getPartner_id() {
		return partner_id;
	}
	public String getConstraintLocation() {
		return constraintLocation;
	}
	public String getJobDescription() {
		return jobDescription;
	}
	public ArrayList<String> getSkills() {
		return skills;
	}
	public ArrayList<String> getDegrees() {
		return degrees;
	}
	public String getPartner_Name() {
		return partner_name;
	}
}
