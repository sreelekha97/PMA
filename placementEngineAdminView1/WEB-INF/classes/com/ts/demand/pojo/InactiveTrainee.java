package com.ts.demand.pojo;

public class InactiveTrainee {
	private String name;
	private String traineeId;
	private String Reason;
	
	
	public String getName() {
		return name;
	}
	public String getTraineeId() {
		return traineeId;
	}
	public String getReason() {
		return Reason;
	}
	public InactiveTrainee(String name, String traineeId, String Reason){
		this.name = name;
		this.traineeId = traineeId;
		this.Reason = Reason;
	}
	public InactiveTrainee(){};
	
}