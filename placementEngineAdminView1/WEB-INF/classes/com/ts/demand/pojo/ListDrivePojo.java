package com.ts.demand.pojo;

public class ListDrivePojo{
	String ref_id;
	public String getRef_id() {
		return ref_id;
	}
	public String getPartner() {
		return partner;
	}
	String partner;
	public ListDrivePojo(String ref_id,String company){
		this.ref_id = ref_id;
		this.partner = company;
	}
}
