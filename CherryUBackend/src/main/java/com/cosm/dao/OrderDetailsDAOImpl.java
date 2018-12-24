package com.cosm.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.cosm.model.OrderDetails;

@Repository("orderDetailsDAO")
@Transactional
public class OrderDetailsDAOImpl implements OrderDetailsDAO{

	@Autowired
	SessionFactory sessionFactory;
	
	@Override
	public boolean paymentProcess(OrderDetails orderDetails) {
		try {
			sessionFactory.getCurrentSession().save(orderDetails);
			return true;
		}
		catch(Exception e){
			return false;
		}
		
	}

	@Override
	public boolean updateCartItemStatus(String username) {
		try 
		{
			Session session=sessionFactory.getCurrentSession();
			Query query=session.createQuery("update Cart set status='Paid' where username=:uname");
			query.setParameter("uname", username);
			int row_eff=query.executeUpdate();
			if(row_eff>0)
				return true;
			else
				return false;
		}
		catch(Exception e)
		{
			return false;
		}
		
	}

}
