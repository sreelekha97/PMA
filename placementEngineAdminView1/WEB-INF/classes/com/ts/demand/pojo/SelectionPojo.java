package com.ts.demand.pojo;

public class SelectionPojo {
	private int id;
	public int getId() {
		return id;
	}
	public String getContactDetails() {
		return contactDetails;
	}
	public String getDate() {
		return date;
	}
	public int getRoundNumber() {
		return roundNumber;
	}
	public String getTime() {
		return time;
	}
	public int getDrive_fk() {
		return drive_fk;
	}
	public SelectionPojo(int id,String contactDetails,String date,int roundNumber,String time,int drive_fk){
		this.id = id;
		this.contactDetails = contactDetails;
		this.date = date;
		this.roundNumber = roundNumber;
		this.time = time;
		this.drive_fk = drive_fk;
	}
	private String contactDetails;
	private String date;
	private int roundNumber;
	private String time;
	private int drive_fk;

}
