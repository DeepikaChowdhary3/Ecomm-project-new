package com.cosm.dao;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import org.springframework.transaction.annotation.Transactional;

import com.cosm.model.Category;

@Repository("categoryDAO")
@Transactional
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	SessionFactory sessionFactory;

	public boolean addCategory(Category category) {
		try {
			sessionFactory.getCurrentSession().save(category);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	
	public boolean removeCategory(Category category) {
		try {
			sessionFactory.getCurrentSession().delete(category);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public boolean updateCategory(Category category) {
		try {
			sessionFactory.getCurrentSession().update(category);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public List<Category> Categorieslist() {
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Category");
		List<Category> Categorieslist = query.list();
		session.close();
		return Categorieslist;
	}

	@Override
	public Category getCategory(int categoryId) {
		Session session = sessionFactory.openSession();
		Category category = session.get(Category.class, categoryId);
		session.close();
		return category;
	}
}