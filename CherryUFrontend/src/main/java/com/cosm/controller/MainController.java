package com.cosm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping(value="/signin")
	public String showSignin()
	{
		return "Signin";
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
}
