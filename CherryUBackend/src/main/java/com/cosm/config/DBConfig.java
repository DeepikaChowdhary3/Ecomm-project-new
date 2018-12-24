package com.cosm.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.cosm.dao.CartDAO;
import com.cosm.dao.CartDAOImpl;
import com.cosm.dao.CategoryDAO;
import com.cosm.dao.CategoryDAOImpl;
import com.cosm.dao.OrderDetailsDAO;
import com.cosm.dao.OrderDetailsDAOImpl;
import com.cosm.dao.ProductDAO;
import com.cosm.dao.ProductDAOImpl;
import com.cosm.dao.SupplierDAO;
import com.cosm.dao.SupplierDAOImpl;
import com.cosm.dao.UserDAO;
import com.cosm.dao.UserDAOImpl;
import com.cosm.model.Cart;
import com.cosm.model.Category;
import com.cosm.model.OrderDetails;
import com.cosm.model.Product;
import com.cosm.model.Supplier;
import com.cosm.model.User;

@Configuration
@EnableTransactionManagement
@ComponentScan("com.cosm")
public class DBConfig {
	
	@Bean(name="dataSource")
	public DataSource getH2DataSource()
	{
		DriverManagerDataSource dataSource=new DriverManagerDataSource();
		
		dataSource.setDriverClassName("org.h2.Driver");
		dataSource.setUrl("jdbc:h2:tcp://localhost/~/CherryU");
		dataSource.setUsername("h2");
		dataSource.setPassword("h2");
		System.out.println("---DataSource Object is Created----");
		return dataSource;
	}
	
	@Autowired
	@Bean(name="sessionFactory")
	public SessionFactory getSessionFactory()
	{
		Properties hibernateProp=new Properties();
		
		hibernateProp.put("hibernate.hbm2ddl.auto","update");
		hibernateProp.put("hibernate.dialect", "org.hibernate.dialect.H2Dialect");
		
		LocalSessionFactoryBuilder factory=new LocalSessionFactoryBuilder(getH2DataSource());
		factory.addProperties(hibernateProp);
		
		factory.addAnnotatedClass(Cart.class);
		factory.addAnnotatedClass(OrderDetails.class);
		factory.addAnnotatedClass(Category.class);
		factory.addAnnotatedClass(Product.class);
		factory.addAnnotatedClass(Supplier.class);
		factory.addAnnotatedClass(User.class);
		System.out.println("---SessionFactory Object  Created ----");
		return factory.buildSessionFactory();
	}
	
	@Autowired
	@Bean(name="txManager")
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory)
	{
		System.out.println("---Transaction Manager object Created--");
		return new HibernateTransactionManager(sessionFactory);
	}
	
	@Autowired(required = true)
	@Bean(name="cartDAO")
	public CartDAO getCartDAO() {
		return new CartDAOImpl();
	}
	
	@Autowired(required = true)
	@Bean(name="categoryDAO")
	public CategoryDAO getCategoryDAO()
	{
		return new CategoryDAOImpl();
	} 
	
	@Autowired(required = true)
	@Bean(name="productDAO")
	public ProductDAO getProductDAO()
	{
		return new ProductDAOImpl();
	}
	
	@Autowired(required = true)
	@Bean(name="supplierDAO")
	public SupplierDAO getSupplierDAO()
	{
		return new SupplierDAOImpl();
	}
	
	@Autowired(required = true)
	@Bean(name="userDAO")
	public UserDAO getUserDAO()
	{
		return new UserDAOImpl();
	}
	
	@Autowired(required = true)
	@Bean(name="orderDetailsDAO")
	public OrderDetailsDAO getOrderDetailsDAO()
	{
		return new OrderDetailsDAOImpl();
	}
	
}
