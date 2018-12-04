package com.cosm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosm.dao.CategoryDAO;
import com.cosm.model.Category;

@Controller
public class CategoryController {

	@Autowired
	CategoryDAO categoryDAO;

	@RequestMapping(value="/category")
	public String showCategory(Model m) {
		List<Category> Categorieslist=categoryDAO.Categorieslist();
		m.addAttribute("Categorieslist",Categorieslist);
		return "Category";
	}

	@RequestMapping(value="/addCategory",method = RequestMethod.POST)
	public String addCategoryDetail(@RequestParam("categoryId")int categoryId,@RequestParam("categoryName") String categoryName,
			@RequestParam("categoryDesc") String categoryDesc,Model m) {
		Category category = new Category();
		category.setCategoryId(categoryId);
		category.setCategoryName(categoryName);
		category.setCategoryDesc(categoryDesc);
		categoryDAO.addCategory(category);
		List<Category> Categorieslist=categoryDAO.Categorieslist();
		m.addAttribute("Categorieslist",Categorieslist);
		return "Category";
	}
	
	@RequestMapping(value="/deleteCategory/{categoryId}")
	public String deleteCategory(@PathVariable("categoryId")int categoryId,Model m)
	{
		Category category=categoryDAO.getCategory(categoryId);
		categoryDAO.removeCategory(category);
		List<Category> Categorieslist=categoryDAO.Categorieslist();
		m.addAttribute("Categorieslist",Categorieslist);
		return "Category";
	}
	
	@RequestMapping(value="/editCategory/{categoryId}")
	public String editCategory(@PathVariable("categoryId")int categoryId,Model m)
	{
		Category category=categoryDAO.getCategory(categoryId);
		m.addAttribute("category",category);
		return "UpdateCategory";
	}
	
	@RequestMapping(value="/updateCategory",method = RequestMethod.POST)
	public String updateCategory(@RequestParam("categoryId")int categoryId,@RequestParam("categoryName")String categoryName,
			@RequestParam("categoryDesc")String categoryDesc,Model m)
	{
		Category category=categoryDAO.getCategory(categoryId);
		category.setCategoryId(categoryId);
		category.setCategoryName(categoryName);
		category.setCategoryDesc(categoryDesc);
		
		categoryDAO.updateCategory(category);
		List<Category> Categorieslist=categoryDAO.Categorieslist();
		m.addAttribute("Categorieslist",Categorieslist);
		return "Category";
	}
}
