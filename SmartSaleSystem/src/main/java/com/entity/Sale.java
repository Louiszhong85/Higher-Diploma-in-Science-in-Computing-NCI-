package com.entity;
import java.util.*;
public class Sale {
	private int id=0;
	private String itemID="";
	private String itemName="";
	private String saleDate="";
	private String quantity="";
	private String price="";
	private String operator="";
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id=id;
	}
	public String getItemID() {
		return itemID;
	}
	public void setItemID(String itemID) {
		this.itemID=itemID;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName=itemName;
	}
	public String getSaleDate() {
		return saleDate;
	}
	public void setSaleDate(String saleDate) {
		this.saleDate=saleDate;
	}
	public String getQuantity() {
		return quantity;
	}
	public void setQuantity(String quantity) {
		this.quantity=quantity;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price=price;
	}
	public String getOperator() {
		return operator;
	}
	public void setOperator(String operator) {
		this.operator=operator;
	}
}
