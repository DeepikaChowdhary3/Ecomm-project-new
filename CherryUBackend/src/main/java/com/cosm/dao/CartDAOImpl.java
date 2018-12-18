package com.cosm.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cosm.model.Cart;

@Repository("cartDAO")
@Transactional
public class CartDAOImpl implements CartDAO {

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public boolean addOrderToCart(Cart cart) {
		try
		{
			sessionFactory.getCurrentSession().save(cart);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}

	@Override
	public boolean removeOrderFromCart(Cart cart) {
		try
		{
			sessionFactory.getCurrentSession().delete(cart);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}
@Override
	public boolean updateOrderInCart(Cart cart) {
		try
		{
			sessionFactory.getCurrentSession().update(cart);
			return true;
		}
		catch(Exception e)
		{
			return false;
		}
	}
	@Override
	public Cart getCartDetails(int cartId) {
		Session session=sessionFactory.openSession();
		Cart cart=session.get(Cart.class,cartId);
		session.close();
		return cart;
	}

	@Override
	public List<Cart> Cartlist(String username) {
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Cart where username=:uname and status=:notPaid");
		query.setParameter("notPaid", "NotPaid");
		query.setParameter("uname", username);
		List<Cart> Cartlist=query.list();
		session.close();
		return Cartlist;
	}

}