package com.cosm.test;
import static org.junit.Assert.*;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.cosm.dao.ProductDAO;
import com.cosm.model.Product;

public class ProductDAOTestCase {

	static ProductDAO productDAO;

	@BeforeClass
	public static void executeFirst()
	{
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		
		context.scan("com.cosm");
		context.refresh();
		productDAO=(ProductDAO)context.getBean("productDAO");
	}
	@Ignore
	@Test
	public void addProductTest() {
		Product product=new Product();
		
		product.setProductName("Lakme Foundation");
		product.setProductDesc("Lakme Foundation gives an even look");
		product.setSupplierId(2002);
		product.setCategoryId(1002);
		product.setPrice(7000);
		product.setStock(15);
		product.setRating(4);
		assertTrue("Probem in Adding the Product",productDAO.addProduct(product));
	}
	@Ignore
	@Test
	public void removeProductTest() {
		Product product=productDAO.getProduct(3);
		assertTrue("Problem in deleting the product",productDAO.removeProduct(product));
	}
	@Ignore
	@Test
	public void updateProductTest() {
		Product product=productDAO.getProduct(4);
		product.setProductDesc("Get even skin from lakme foundation");
		assertTrue("Problem in updating the product",productDAO.updateProduct(product));
	}
	
	@Ignore
	@Test
	public void ProductsList() {
		List<Product> Productslist=productDAO.Productslist();
		assertTrue("Problem in listing the products",Productslist.size()>0);
		for(Product product:Productslist)
		{
			System.out.println("Product ID: "+product.getProductId());
			System.out.println("Product Name: "+product.getProductName());
			System.out.println("Product Description: "+product.getProductDesc());
			System.out.println("Product Rating: "+product.getRating());
			System.out.println("Product Price: "+product.getPrice());
			System.out.println("Product Stock availability: "+product.getStock());
			System.out.println("Product Supplier Id: "+product.getSupplierId());
			System.out.println("Product Category Id:"+product.getCategoryId());
			System.out.println();
		}
	}

}