package com.ts.demand.pojo;













public class ContactPojo {




	private long partner_fk;




	private long contact_id;




	private String Name;




	private String City;




	private String Email;




	private String Phone;




	private String Title;




	




	




	public ContactPojo() {




	}




	




	public ContactPojo(long contact_id,String Name,String Title,String Email,String Phone,String City,long partner_fk){




		super();




		this.contact_id = contact_id;




		this.Name = Name;




		this.Title = Title;




		this.Email = Email;




		this.Phone = Phone;




		this.City = City;




		this.partner_fk = partner_fk;




	}




	public ContactPojo(String Name){




		super();




		this.Name = Name;




	}




	public long getPartner_fk() {




		return partner_fk;




	}




	public long getContact_id() {




		return contact_id;




	}




	public String getName() {




		return Name;




	}




	




	public String getTitle() {




		return Title;




	}




	




	public String getCity() {




		return City;




	}




	




	public String getEmail() {




		return Email;




	}




	




	public String getPhone() {




		return Phone;




	}




}