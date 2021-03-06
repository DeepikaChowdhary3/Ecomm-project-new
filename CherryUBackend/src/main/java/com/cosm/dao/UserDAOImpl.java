package com.cosm.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cosm.model.User;

@Repository("userDAO")
@Transactional
public class UserDAOImpl implements UserDAO{

	@Autowired
	SessionFactory sessionFactory;
	@Override
	public boolean addUser(User user) {
		try
		{
			sessionFactory.getCurrentSession().saveOrUpdate(user);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}

	@Override
	public boolean updateUser(User user) {
		try
		{
			sessionFactory.getCurrentSession().update(user);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}

	@Override
	public List<User> listofUsers() {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from User");
		List<User> listofUsers=query.list();
		session.close();
		return listofUsers;
		
	}

	@Override
	public User getUser(String username) {
		Session session=sessionFactory.openSession();
		User user=session.get(User.class, username);
		session.close();
		return user;
	}

}