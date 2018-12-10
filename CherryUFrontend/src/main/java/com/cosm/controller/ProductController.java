package com.cosm.controller;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cosm.dao.CategoryDAO;
import com.cosm.dao.ProductDAO;
import com.cosm.dao.SupplierDAO;
import com.cosm.model.Category;
import com.cosm.model.Product;
import com.cosm.model.Supplier;

@Controller
public class ProductController {

	@Autowired
	ProductDAO productDAO;
	
	@Autowired
	CategoryDAO categoryDAO;
	
	@Autowired
	SupplierDAO supplierDAO;
	
	@RequestMapping(value="/product")
	public String showProduct(Model model)
	{
		Product product1=new Product();
		model.addAttribute("product",product1);
		model.addAttribute("Categorieslist",this.getCategorieslist(categoryDAO.Categorieslist()));
		model.addAttribute("Supplierslist",this.getSupplierslist(supplierDAO.Supplierslist()));
		model.addAttribute("RatingsList",this.getRatingsList());
		
		List<Product> Productslist=productDAO.Productslist();
		model.addAttribute("Productslist", Productslist);
		return "Product";
	}
	
	@RequestMapping(value="/addProduct",method=RequestMethod.POST)
	public String addProductDetails(@ModelAttribute("product")Product product,Model model)
	{
		productDAO.addProduct(product);
		Product product2=new Product();
		model.addAttribute("product", product2);
		model.addAttribute("Categorieslist",this.getCategorieslist(categoryDAO.Categorieslist()));
		model.addAttribute("Supplierslist",this.getSupplierslist(supplierDAO.Supplierslist()));
		model.addAttribute("RatingsList",this.getRatingsList());
		
		List<Product> Productslist=productDAO.Productslist();
		model.addAttribute("Productslist",Productslist);
		return "Product";
	}
	
	@RequestMapping(value="/editProduct/{productId}")
	public String editProductDeatils(@PathVariable("productId")int productId,Model model)
	{
		Product product=productDAO.getProduct(productId);
		model.addAttribute("product",product);
		model.addAttribute("Categorieslist",this.getCategorieslist(categoryDAO.Categorieslist()));
		model.addAttribute("Supplierslist",this.getSupplierslist(supplierDAO.Supplierslist()));
		model.addAttribute("RatingsList",this.getRatingsList());
		
		return "Product";
	}
	
	@RequestMapping(value="/deleteProduct/{productId}")
	public String deleteProductDeatils(@PathVariable("productId")int productId,Model model)
	{
		Product product=productDAO.getProduct(productId);
		productDAO.removeProduct(product);
		Product product3=new Product();
		model.addAttribute("product",product3);
		model.addAttribute("Categorieslist",this.getCategorieslist(categoryDAO.Categorieslist()));
		model.addAttribute("Supplierslist",this.getSupplierslist(supplierDAO.Supplierslist()));
		model.addAttribute("RatingsList",this.getRatingsList());
		
		List<Product> Productslist=productDAO.Productslist();
		model.addAttribute("Productslist",Productslist);
		return "Product";
	}
	
	public LinkedHashMap<Integer,String> getCategorieslist(List<Category> Categorieslist)
	{
		LinkedHashMap<Integer,String> Categorylist=new LinkedHashMap<Integer,String>();
		for(Category category:Categorieslist)
		{
			Categorylist.put(category.getCategoryId(),category.getCategoryName());
		}
		return Categorylist;
	}
	
	public LinkedHashMap<Integer,String> getSupplierslist(List<Supplier> Supplierslist)
	{
		LinkedHashMap<Integer,String> listSupplier=new LinkedHashMap<Integer,String>();
		for(Supplier supplier:Supplierslist)
		{
			listSupplier.put(supplier.getSupplierId(),supplier.getSupplierName());
		}
		return listSupplier;
	}
	
	public List<Integer> getRatingsList() {
	      List<Integer> RatingsList = new ArrayList<Integer>();
	      RatingsList.add(1);
	      RatingsList.add(2);
	      RatingsList.add(3);
	      RatingsList.add(4);
	      RatingsList.add(5);
	      return RatingsList;
	   }
	
}
