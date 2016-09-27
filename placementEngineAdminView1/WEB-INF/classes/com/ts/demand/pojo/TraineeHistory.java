package com.ts.demand.pojo;


public class TraineeHistory {
	private String name;
	private String traineeId;
	private String status;
	private String selection_round;
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
	public String getselection_round() {
		return selection_round;
	}
	public String getdrive() {
		return drive;
	}
	public TraineeHistory(String name, String traineeId, String status,String selection_round,String drive){
		this.name = name;
		this.traineeId = traineeId;
		this.status = status;
		this.selection_round = selection_round;
		this.drive = drive;
	}
	public TraineeHistory(){};
	
}