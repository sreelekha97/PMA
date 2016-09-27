package com.ts.demand.pojo;

public class BroadcastPojo {
	private int id;
	public int getId() {
		return id;
	}
	public boolean isApplied() {
		return applied;
	}
	public String getBroadcastId() {
		return broadcastId;
	}
	public String getCreated() {
		return created;
	}
	public boolean isEligible() {
		return eligible;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public String getOverriddenBy() {
		return overriddenBy;
	}
	public String getOverrideReason() {
		return overrideReason;
	}
	public int getDemand_fk() {
		return demand_fk;
	}
	public String getTrainee_fk() {
		return trainee_fk;
	}
	public boolean isEmailSent() {
		return emailSent;
	}
	public BroadcastPojo(int id,boolean applied,String broadcastId,String created,boolean eligible,String expiryDate,
			String overriddenBy,String overrideReason,int demand_fk	,String trainee_fk,boolean emailSent){
		this.id = id;
		this.applied = applied;
		this.broadcastId = broadcastId;
		this.created = created;
		this.eligible = eligible;
		this.expiryDate = expiryDate;
		this.overriddenBy=overriddenBy;
		this.overrideReason = overrideReason;
		this.demand_fk = demand_fk;
		this.trainee_fk = trainee_fk;
		this.emailSent = emailSent;
	}
	private boolean applied;
	private String broadcastId;
	private String created;
	private boolean eligible;
	private String expiryDate;
	private String overriddenBy;
	private String overrideReason;
	private int demand_fk;
	private String trainee_fk;
	private boolean emailSent;
}
