package com.cosm.controller;

import java.util.Collection;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosm.dao.UserDAO;
import com.cosm.model.Product;
import com.cosm.model.User;


@Controller
public class UserController {
	@Autowired
	UserDAO userDAO;


	@RequestMapping("/login_success")
	public String LoginSuccessfull(HttpSession session,Model m)
	{
		String page="";
		boolean loggedIn=false;
		
		SecurityContext securityContext=SecurityContextHolder.getContext();
		Authentication authentication=securityContext.getAuthentication();
		
		
		String username=authentication.getName();
		
		
		Collection<GrantedAuthority> roles=(Collection<GrantedAuthority>)authentication.getAuthorities();
		
		for(GrantedAuthority role:roles)
		{
		
			session.setAttribute("role",role.getAuthority());
			
			if(role.getAuthority().equals("ROLE_ADMIN"))
			{
				loggedIn=true;
				page="HomeAdmin";
				session.setAttribute("loggedIn",loggedIn);
				session.setAttribute("username",username);
				
			}
			else
			{
				loggedIn=true;
				page="HomeUser";
				session.setAttribute("loggedIn",loggedIn);
				session.setAttribute("username",username);
				
			}
		}
		return page;
	}
	
	@RequestMapping(value="/HomeAdmin")
	public String showHomeAdmin() {
		return "HomeAdmin";
	}
	
	@RequestMapping(value="/HomeUser")
	public String showHomeUser() {
		return "HomeUser";
	}
	
	@RequestMapping(value="/user")
	public String showUser(Model model)
	{
		User user=new User();
		model.addAttribute("user",user);
		return "Home";
	}
	
	@RequestMapping(value="/addUser",method=RequestMethod.POST)
	public String addUserDetail(@RequestParam("username")String username,@RequestParam("password")String password,
			@RequestParam("customerName")String customerName,@RequestParam("address")String address,
			@RequestParam("mobileNo")String mobileNo,@RequestParam("emailId")String emailId,
			@RequestParam("role")String role,Model model) {
		
		User user=new User();
		user.setUsername(username);
		user.setPassword(password);
		user.setCustomerName(customerName);
		user.setAddress(address);
		user.setMobileNo(mobileNo);
		user.setEmailId(emailId);
		user.setRole(role);
		user.setEnabled(true);
		userDAO.addUser(user);
		return "Login";
	}
}
	