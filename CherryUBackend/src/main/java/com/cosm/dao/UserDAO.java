package com.cosm.dao;

import java.util.List;

import com.cosm.model.User;

public interface UserDAO {

	public boolean addUser(User user);
	public boolean updateUser(User user);
	public List<User> listofUsers();
	public User getUser(String mobileNo);
	
}
