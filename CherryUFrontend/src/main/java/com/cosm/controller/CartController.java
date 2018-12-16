package com.cosm.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosm.dao.CartDAO;
import com.cosm.dao.ProductDAO;
import com.cosm.model.Cart;
import com.cosm.model.Product;

@Controller
public class CartController {

	@Autowired
	CartDAO cartDAO;
	
	@Autowired
	ProductDAO productDAO;
	
	@RequestMapping(value="/cart")
	public String showCart(Model model)
	{
		String userId="Deep";
		List<Cart> Cartlist=cartDAO.Cartlist(userId);
		model.addAttribute("Cartlist",Cartlist);
		model.addAttribute("totalAmount",this.calculateTotalAmount(Cartlist));
		
		return "Cart";
	}
	
	@RequestMapping(value="/addtocart/{productId}")
	public String addToCart(@PathVariable("productId")int productId,@RequestParam("quantity")int quantity,Model model)
	{
		Cart cart=new Cart();
		String userId="Deep";
		Product product=productDAO.getProduct(productId);
		cart.setCartId(9005);
		cart.setUserId(userId);
		cart.setProductId(productId);
		cart.setProductName(product.getProductName());
		cart.setQuantity(quantity);
		cart.setPrice(product.getPrice());
		cart.setStatus("NotPaid");
		
		cartDAO.addOrderToCart(cart);
		
		List<Cart> Cartlist=cartDAO.Cartlist(userId);
		model.addAttribute("Cartlist",Cartlist);
		model.addAttribute("totalAmount",this.calculateTotalAmount(Cartlist));
		
		return "Cart";
		
	}
	
	@RequestMapping(value="/updateCart/{cartId}")
	public String updateCartDetails(@PathVariable("cartId")int cartId,@RequestParam("quantity")int quantity,HttpSession session,Model model)
	{
		String userId=(String)session.getAttribute("userId");
		Cart cart=cartDAO.getCartDetails(cartId);
		cart.setQuantity(quantity);
		cartDAO.updateOrderInCart(cart);
		
		List<Cart> Cartlist=cartDAO.Cartlist(userId);
		model.addAttribute("Cartlist",Cartlist);
		model.addAttribute("totalAmount",this.calculateTotalAmount(Cartlist));
		return "Cart";
	}
	
	@RequestMapping(value="/deleteCart/{cartId}")
	public String deleteCartDetails(@PathVariable("cartId")int cartId,@RequestParam("quantity")int quantity,HttpSession session,Model model)
	{
		String userId=(String)session.getAttribute("userId");
		Cart cart=cartDAO.getCartDetails(cartId);
		cartDAO.removeOrderFromCart(cart);
		
		List<Cart> Cartlist=cartDAO.Cartlist(userId);
		model.addAttribute("Cartlist",Cartlist);
		model.addAttribute("totalAmount",this.calculateTotalAmount(Cartlist));
		return "Cart";
		
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
