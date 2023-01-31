package com.entity;
import java.util.*;
public class IeAccount {
	private int id=0;
	private String ieDate="";
	private String ieType="";
	private String amount="";
	private String note="";
	private String operator="";
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id=id;
	}
	public String getIeDate() {
		return ieDate;
	}
	public void setIeDate(String ieDate) {
		this.ieDate=ieDate;
	}
	public String getIeType() {
		return ieType;
	}
	public void setIeType(String ieType) {
		this.ieType=ieType;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount=amount;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note=note;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator=operator;
	}
}
