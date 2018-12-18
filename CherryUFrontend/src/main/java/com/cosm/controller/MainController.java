package com.cosm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("/login")
	public String showlogin()
	{
		return "Login";
	}
	@RequestMapping(value="/signup")
	public String showSignup()
	{
		return "Signup";
	}
	@RequestMapping(value="/aboutus")
	public String showAboutus()
	{
		return "Aboutus";
	}
	@RequestMapping(value="/home")
	public String showHome()
	{
		return "Home";
	}
}
