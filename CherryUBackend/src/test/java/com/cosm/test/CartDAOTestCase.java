package com.cosm.test;

import static org.junit.Assert.*;


import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.cosm.dao.CartDAO;
import com.cosm.model.Cart;



public class CartDAOTestCase {

	static CartDAO cartDAO;
	@BeforeClass
	public static void executeFirst()
	{
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.cosm");
		context.refresh();
		cartDAO=(CartDAO)context.getBean("cartDAO");
	}
@Ignore
	@Test
	public void addOrderToCartTest()
	{
		Cart cart=new Cart();
		
		cart.setUsername("Deep");
		
		cart.setProductId(4);
		cart.setProductName("Skinn Celeste");
		cart.setQuantity(1);
		cart.setPrice(700);
		cart.setStatus("NotPaid");
		
		assertTrue("Problem in placing an order in cart",cartDAO.addOrderToCart(cart));
		
	}
	@Ignore
	@Test
	public void removeOrderTest()
	{
		Cart cart=cartDAO.getCartDetails(9001);
		assertTrue("Problem in deleting the order in cart",cartDAO.removeOrderFromCart(cart));
	}
	
	@Ignore
	@Test
	public void updateOrderTest()
	{
		Cart cart=cartDAO.getCartDetails(9001);
		cart.setQuantity(4);
		assertTrue("Problem in updating the order in cart",cartDAO.updateOrderInCart(cart));
	}
	
	@Ignore
	@Test
	public void listofOrdersTest()
	{
		List<Cart> Cartlist=cartDAO.Cartlist("Deep");
		assertTrue("Problem in Listing the Orders",Cartlist.size()>0);
		
		for(Cart cart:Cartlist)
		{
			System.out.println("Cart ID:"+cart.getCartId());
			System.out.println("User ID:"+cart.getUsername());
			System.out.println("Status: "+cart.getStatus());
			System.out.println("Product Id:"+cart.getProductId());
			System.out.println("Product name:"+cart.getProductName());
			System.out.println("Quantity:"+cart.getQuantity());
			System.out.println("Price:"+cart.getPrice());
			
		}
	
	}
	

}