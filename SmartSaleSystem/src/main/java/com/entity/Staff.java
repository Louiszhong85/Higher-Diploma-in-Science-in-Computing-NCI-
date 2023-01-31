package com.entity;
import java.util.*;
public class Staff {
	private int id=0;
	private String username="";
	private String pwd="";
	private String staffName="";
	private String sex="";
	private String age="";
	private String tel="";
	private String address="";
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id=id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username=username;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd=pwd;
	}
	public String getStaffName() {
		return staffName;
	}
	public void setStaffName(String staffName) {
		this.staffName=staffName;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex=sex;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age=age;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel=tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address=address;
	}
}
