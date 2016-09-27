package com.ts.demand.pojo;

public class DriveRoundsPojo {
	private int round_num;
	private String rounds;
	private int Drive_id;
	public DriveRoundsPojo(){}
	public DriveRoundsPojo(int Drive_id,String rounds,int round_num){
		this.Drive_id = Drive_id;
		this.round_num = round_num;
		this.rounds = rounds;
	}
	public int getRound_num() {
		return round_num;
	}
	public String getRounds() {
		return rounds;
	}
	public int getDrive_id() {
		return Drive_id;
	}
}