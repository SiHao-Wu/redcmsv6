package com.redcms.beans;

public class Admin {
  private int id;
  private String uname;
  private String upwd;
  
  private String upur;
  private byte active=1;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getUname() {
	return uname;
}
public void setUname(String uname) {
	this.uname = uname;
}
public String getUpwd() {
	return upwd;
}
public void setUpwd(String upwd) {
	this.upwd = upwd;
}
public String getUpur() {
	return upur;
}
public void setUpur(String upur) {
	this.upur = upur;
}
public byte getActive() {
	return active;
}
public void setActive(byte active) {
	this.active = active;
}


  
}
