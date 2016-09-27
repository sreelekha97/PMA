package com.ts.demand.partner.dao;

public class Demand {
	public String ref_id;
	public String getRef_id() {
		return ref_id;
	}
	public String getName() {
		return Name;
	}
	public String getCreated() {
		return created;
	}
	public String Name;
	public String created;
	Demand (String ref_id,String Name,String created) {
		this.created = created;
		this.Name = Name;
		this.ref_id = ref_id;
	}
}