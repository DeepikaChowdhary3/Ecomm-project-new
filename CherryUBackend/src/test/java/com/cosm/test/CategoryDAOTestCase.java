package com.cosm.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.cosm.dao.CategoryDAO;
import com.cosm.model.Category;

public class CategoryDAOTestCase 
{
	
	static CategoryDAO categoryDAO;

	@BeforeClass
	public static void executeFirst()
	{
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		context.scan("com.cosm");
		context.refresh();
		categoryDAO=(CategoryDAO)context.getBean("categoryDAO");
	}
@Ignore
	@Test
	public void addCategoryTest()
	{
		Category category=new Category();
		
		category.setCategoryName("Face-Makeup");
		category.setCategoryDesc("Go gorgeous with bold looks");
		category.setCategoryId(1001);
		assertTrue("Probem in Adding the Category",categoryDAO.addCategory(category));
	}
	
	@Ignore
	@Test
	public void removeCategoryTest()
	{
		Category category=categoryDAO.getCategory(1002);
		assertTrue("Problem in Deleting the Category",categoryDAO.removeCategory(category));
	}
	
	@Ignore
	@Test
	public void updateCategoryTest()
	{	
		Category category=categoryDAO.getCategory(1001);
		category.setCategoryDesc("Go bold with gorgeous makeup");
		assertTrue("Problem in Updating the Category",categoryDAO.updateCategory(category));
	}

	@Ignore
	@Test
	public void listCategoriesTest()
	{
		List<Category> Categorieslist=categoryDAO.Categorieslist();
		
		assertTrue("Problem in Listing the Categories",Categorieslist.size()>0);
		
		for(Category category:Categorieslist)
		{
			System.out.print("Category ID:"+category.getCategoryId());
			System.out.print("Category Name:"+category.getCategoryName());
			System.out.println("Category Desc:"+category.getCategoryDesc());
		}
	}
	
}
