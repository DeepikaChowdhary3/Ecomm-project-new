package com.cosm.dao;

import java.util.List;

import com.cosm.model.Cart;

public interface CartDAO {

	public boolean addOrder(Cart cart);
	public boolean removeOrder(Cart cart);
	public Cart getOrderDetails(int orderId);
	public List<Cart> listofOrders();
	
}