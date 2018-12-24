package com.cosm.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosm.dao.CartDAO;
import com.cosm.dao.OrderDetailsDAO;
import com.cosm.dao.UserDAO;
import com.cosm.model.Cart;
import com.cosm.model.OrderDetails;
import com.cosm.model.User;

@Controller
public class OrderController {
	
	@Autowired
	OrderDetailsDAO orderDetailsDAO;

	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	UserDAO userDAO;
	
	@RequestMapping(value="/payment")
	public String paymentProcess(@RequestParam("pmode")String pmode,@RequestParam("shippingAddress")String shippingAddress,HttpSession session,Model model)
	{
		String username=(String)session.getAttribute("username");
		List<Cart> Cartlist=cartDAO.Cartlist(username);
		OrderDetails orderDetails=new OrderDetails();
		orderDetails.setUsername(username);
		orderDetails.setOrderDate(new Date());
		orderDetails.setPmode(pmode);
		orderDetails.setShippingAddress(shippingAddress);
		orderDetails.setGrandAmount(this.calculateTotalAmount(Cartlist));
		if(orderDetailsDAO.updateCartItemStatus(username))
		{
			orderDetailsDAO.paymentProcess(orderDetails);
			model.addAttribute("Cartlist",Cartlist);
			model.addAttribute("orderDetails",orderDetails);
			User user=userDAO.getUser(username);
			model.addAttribute("user",user);
		}
		
		
		
		return "Receipt";
	}
	
	public int calculateTotalAmount(List<Cart> Cartlist)
	{
		int i=0;
		int totalAmount=0;
		while(i<Cartlist.size())
		{
			Cart cart=Cartlist.get(i);
			totalAmount = totalAmount + (cart.getQuantity()*cart.getPrice());
			i++;
		}
		return totalAmount;
		}
}
