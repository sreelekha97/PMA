package com.ts.demand.pojo;

public class DrivePojo {
	private int drive_id;
	private String name;
	private Long demand_fk;
public DrivePojo(){}
public DrivePojo(int drive_id, String name, Long demand_fk){
    	this.drive_id = drive_id;
    	this.name = name;
    	this.demand_fk = demand_fk;
    }
    public long getDrive_id() {
		return drive_id;
	}
	public String getName() {
		return name;
	}
	public long getDemand_fk() {
		return demand_fk;
	}
}