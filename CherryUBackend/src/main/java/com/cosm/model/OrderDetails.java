package com.cosm.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class OrderDetails {

	@Id
	@GeneratedValue
	int orderId;
	String username;
	Date orderDate;
	String shippingAddress;
	int grandAmount;
	String pmode;
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public String getShippingAddress() {
		return shippingAddress;
	}
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	public int getGrandAmount() {
		return grandAmount;
	}
	public void setGrandAmount(int grandAmount) {
		this.grandAmount = grandAmount;
	}
	public String getPmode() {
		return pmode;
	}
	public void setPmode(String pmode) {
		this.pmode = pmode;
	}
	
	
	
}
