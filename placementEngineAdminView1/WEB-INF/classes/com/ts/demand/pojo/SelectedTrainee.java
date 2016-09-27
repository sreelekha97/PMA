package com.ts.demand.pojo;


public class SelectedTrainee {
	private String name;
	private String traineeId;
	private String status;
	private String drive;
	
	
	public String getName() {
		return name;
	}
	public String getTraineeId() {
		return traineeId;
	}
	public String getstatus() {
		return status;
	}
	public String getdrive() {
		return drive;
	}
	public SelectedTrainee(String name, String traineeId, String status,String drive){
		this.name = name;
		this.traineeId = traineeId;
		this.status = status;
		this.drive = drive;
	}
	public SelectedTrainee(){};
	
}