package com.ts.demand.pojo;

public class TraineeRoundPojo {
	private int sno;
	public int getSno() {
		return sno;
	}
	public int getTraineeId() {
		return traineeId;
	}
	public String getStatus() {
		return status;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public int getSelection_round() {
		return selection_round;
	}
	private int traineeId;
	private String status;
	private String updateBy;
	private int selection_round;
	public TraineeRoundPojo(int sno,int traineeId,String status,String updateBy,int selection_round){
		this.sno = sno;
		this.traineeId = traineeId;
		this.status = status;
		this.updateBy = updateBy;
		this.selection_round =  selection_round;
	
	}
}
