package com.cosm.test;

import static org.junit.Assert.*;

import java.util.Date;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.cosm.dao.OrderDetailsDAO;
import com.cosm.model.OrderDetails;

public class OrderDetailsDAOTestCase {

	static OrderDetailsDAO orderDetailsDAO;
	@BeforeClass
	public static void executeFirst()
	{
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.cosm");
		context.refresh();
		orderDetailsDAO=(OrderDetailsDAO)context.getBean("orderDetailsDAO");
	}
	@Ignore
	@Test
	public void paymentProcessTest()
	{
		OrderDetails orderDetails=new OrderDetails();
		orderDetails.setUsername("Chow");
		orderDetails.setOrderDate(new Date());
		orderDetails.setShippingAddress("Bangalore,Karnataka");
		orderDetails.setGrandAmount(5000);
		orderDetails.setPmode("Cash On Delivery");
		assertTrue("Problem in processing the payment",orderDetailsDAO.paymentProcess(orderDetails));
	}
	
	@Test
	public void updateCartItemStatusTest()
	{
		assertTrue("Problem in updating the cart status",orderDetailsDAO.updateCartItemStatus("Chow"));
	}

}
