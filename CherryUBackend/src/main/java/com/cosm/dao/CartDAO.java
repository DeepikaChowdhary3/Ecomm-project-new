package com.cosm.dao;

import java.util.List;

import com.cosm.model.Cart;

public interface CartDAO {

	public boolean addOrderToCart(Cart cart);
	public boolean removeOrderFromCart(Cart cart);
	public boolean updateOrderInCart(Cart cart);
	public Cart getCartDetails(int cartId);
	public List<Cart> Cartlist(String username);
	
}