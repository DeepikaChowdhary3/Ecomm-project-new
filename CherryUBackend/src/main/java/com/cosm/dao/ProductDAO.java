package com.cosm.dao;

import java.util.List;

import com.cosm.model.Product;

public interface ProductDAO {

	public boolean addProduct(Product product);
	public boolean removeProduct(Product product);
	public boolean updateProduct(Product product);
	public List<Product> Productslist();
	public Product getProduct(int productId);
	
}