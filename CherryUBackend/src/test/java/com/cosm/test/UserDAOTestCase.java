package com.cosm.test;
import static org.junit.Assert.*;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.cosm.dao.UserDAO;
import com.cosm.model.User;

public class UserDAOTestCase {

	static UserDAO userDAO;
	@BeforeClass
	public static void executeFirst()
	{
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.cosm");
		context.refresh();
		userDAO=(UserDAO)context.getBean("userDAO");
		
	}
	@Ignore
	@Test
	public void addUserTest() {
		User user=new User();
		user.setUsername("Deep");
		user.setPassword("typewriter");
		user.setEnabled(true);
		user.setRole("Supreme_User");
		user.setCustomerName("DeepakC");
		user.setMobileNo("9741522500");
		user.setEmailId("deepak@gmail.com");
		user.setAddress("Chennai,TamilNadu");
		assertTrue("Problem in registering the new user",userDAO.addUser(user));
		
	}
	
@Ignore
	@Test
	public void updateUserTest()
	{
		User user=userDAO.getUser("Deep");
		user.setAddress("Bangalore,Karnataka");
		assertTrue("Problem in udate the user details",userDAO.updateUser(user));
	}

@Ignore
	@Test
	public void ListOfUsersTest()
	{
		List<User> listofUsers=userDAO.listofUsers();
		assertTrue("Problem in listing the users",listofUsers.size()>0);
		
		for(User user:listofUsers)
		{
			System.out.println("Customer name: "+user.getCustomerName());
			System.out.println("User Id: "+user.getUsername());
			System.out.println("Password: "+user.getPassword());
			System.out.println("User Status: "+user.isEnabled());
			System.out.println("Mobile Number: "+user.getMobileNo());
			System.out.println("Email: "+user.getEmailId());
			System.out.println("Address: "+user.getAddress());
			System.out.println("Role of the user: "+user.getRole());
		}
		
	}
}