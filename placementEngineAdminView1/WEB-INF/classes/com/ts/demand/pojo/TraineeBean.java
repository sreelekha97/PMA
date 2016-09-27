package com.ts.demand.pojo;

import java.io.IOException;
import java.sql.SQLException;


public class TraineeBean{
	  String batch;
	 String certification;
	 String comgrade;
	 String email;
	 String name;
	 String gender;
     int sno;
	 String lgrad;
	 int marks10;
	 int marks12;
	 int markspg;
	 int marksug;
	 String mobile ;
	 String pgrade ;
	 String skill ;
	 String tgrade;
	 String traineeid;
	 String verify;
	 String agrade ;
	 String vfrom ;
	 String vto ;
	 String clocation ;
	 String cname ;
	 String dob ;
	 String reason ;
	 int ygrad ;
	 int yinter ;
	 int yssc ;
	 boolean active;
	 
	 
	public boolean isActive() {
		return active;
	}
	public void setActive(boolean active) {
		this.active = active;
	}
	public int getSno() {
			return sno;
		}
	 public void setSno(int sno) {
			this.sno = sno;
		}
	 public String getBatch(){
		 return batch;
	 }
	 public void setBatch(String batch){
		 this.batch =batch;
	 }
	 public String getCertification(){
		 return certification;
	 }
	 public void setCertification(String certification){
		 this.certification =certification;
	 }
	 public String getComgrade(){
		 return comgrade;
	 }
	 public void setComgrade(String comgrade){
		 this.comgrade =comgrade;
	 }
	 public String getReason(){
		 return reason;
	 }
	 public void setReason(String reason){
		 this.reason =reason;
	 }
	 public String getEmail(){
		 return email;
	 }
	 public void setEmail(String email){
		 this.email =email;
	 }
	 public String getName(){
		 return name;
	 }
	 public void setName(String batch){
		 this.name =name;
	 }
	 public String getGender(){
		 return gender;
	 }
	 public void setGender(String batch){
		 this.gender = gender;
	 }
	 
	 public String getLgrad(){
		 return lgrad;
	 }
	 public void setLgrad(String lgrad){
		 this.lgrad =lgrad;
	 }
	 
	 public int getMarks10(){
		 return marks10;
	 }
	 public void setMarks10(int marks10){
		 this.marks10 = marks10;
	 }
	 public int getMarks12(){
		 return marks12;
	 }
	 public void setMarks12(int batch){
		 this.marks12 =marks12;
	 }
	 public int getMarkspg(){
		 return markspg;
	 }
	 public void setMarkspg(int markspg){
		 this.markspg =markspg;
	 }
	 public int getMarksug(){
		 return marksug;
	 }
	 public void setMarksug(int marksug){
		 this.marksug =marksug;
	 }
	 public String getMobile(){
		 return mobile;
	 }
	 public void setMobile(String mobile){
		 this.mobile =mobile;
	 }
	 public String getPgrade(){
		 return pgrade;
	 }
	 public void setPgrade(String pgrade){
		 this.pgrade =pgrade;
	 }
	 
	 public String getSkill(){
		 return skill;
	 }
	 public void setSkill(String skill){
		 this.skill =skill;
	 }
	 public String getTgrade(){
		 return tgrade;
	 }
	 public void setTgrade(String tgrade){
		 this.tgrade =tgrade;
	 }
	 public String getTraineeid(){
		 return traineeid;
	 }
	 public void setTraineeid(String traineeid){
		 this.traineeid =traineeid;
	 }
	 public String getVerify(){
		 return verify;
	 }
	 public void setVerify(String verify){
		 this.verify = verify;
	 }
	 public String getAgrade(){
		 return agrade;
	 }
	 public void setAgrade(String agrade){
		 this.agrade =agrade;
	 }
	 public String getVfrom(){
		 return vfrom;
	 }
	 public void setVfrom(String vfrom){
		 this.vfrom = vfrom;
	 }
	 public String getVto(){
		 return vto;
	 }
	 public void setVto(String vto){
		 this.vto = vto;
   }
	 public String getClocation(){
		 return clocation;
	 }
	 public void setClocation(String clocation){
		 this.clocation =clocation;
	 }
	 public String getCname(){
		 return cname;
	 }
	 public void setCname(String cname){
		 this.cname =cname;
	 }
	 public String getDob(){
		 return dob;
	 }
	 public void setDob(String dob){
		 this.dob =dob;
	 }
	 public int getYgrad(){
		 return ygrad;
	 }
	 public void setYgrad( int ygrad){
		 this.ygrad = ygrad;
	 }
	 public int getYinter(){
		 return yinter;
	 }
	 public void setYinter(int yinter){
		 this.yinter = yinter;
	 }
	 public int getYssc(){
		 return yssc;
	 }
	 public void setYssc(int yssc){
		 this.yssc = yssc;
	 }
	
	 
	 public TraineeBean(int sno,String name,String batch, String traineeid,String gender, String email,String dob,String mobile,String cname,
			 String clocation, String lgrad,int ygrad,int yinter,int yssc,int markspg,int marksug,int marks12,int marks10,
			 String skill,String certification,String comgrade,String tgrade,String pgrade,String agrade,boolean active,String reason,String vfrom,
			 String vto,String verify) {
		 
		 
		
		  
		  this.sno = sno;
        this.name = name;	
        this.batch = batch;
        this.traineeid = traineeid;
        this.gender= gender;
        this.email = email;
        this.dob = dob;
        this.mobile = mobile;
        this.cname = cname;
        this.clocation = clocation;
        this.lgrad = lgrad;
        this.ygrad = ygrad;
        this.yinter = yinter;
        this.yssc = yssc;
        this.markspg = markspg;
        this.marksug = marksug;
        this.marks12 = marks12;
        this.marks10 = marks10;
        this.skill = skill;
        this.certification = certification;
        this.comgrade = comgrade;
        this.tgrade = tgrade;
        this.pgrade = pgrade;
        this.agrade = agrade;
        this.active=active;
        this.reason = reason;
        this.vfrom = vfrom;
        this.vto = vto;
        this.verify = verify;
        
	 }
	 public TraineeBean() {
		 super();
	 }
		 
	 }
