package com.cosm.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	public String addProductDetails(@ModelAttribute("product")Product product,@RequestParam("pimage")MultipartFile prodImage,Model model)
	{
		productDAO.addProduct(product);
		
String path="C:\\chow\\CherryU\\CherryUFrontend\\src\\main\\webapp\\resources\\images\\";

		path=path+String.valueOf(product.getProductId())+".jpg";
		
		File imageFile=new File(path);
		
		if(!prodImage.isEmpty())
		{
			try
			{
				byte[] buffer=prodImage.getBytes();
				FileOutputStream fos=new FileOutputStream(imageFile);
				BufferedOutputStream bs=new BufferedOutputStream(fos);
				bs.write(buffer);
				bs.close();
			}
			catch(Exception e)
			{
				System.out.println(e);
				model.addAttribute("Error","Exception Occured during the Image Uploading"+e);	
			}
		}
		else
		{
			System.out.println("error occured");
			model.addAttribute("Error","Error Occured during the Image Uploading");
		}
		

		
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
		
		return "UpdateProduct";
	}
	
	@RequestMapping(value="/updateProduct",method=RequestMethod.POST)
	public String updateProduct(@PathVariable("productId")int productId,Model model,@ModelAttribute("product")Product product)
	{
		
		Product product1=productDAO.getProduct(productId);
		model.addAttribute("product",product1);
		model.addAttribute("Categorieslist",this.getCategorieslist(categoryDAO.Categorieslist()));
		model.addAttribute("Supplierslist",this.getSupplierslist(supplierDAO.Supplierslist()));
		model.addAttribute("RatingsList",this.getRatingsList());
		
		productDAO.updateProduct(product);
		
		List<Product> listProducts=productDAO.Productslist();
		model.addAttribute("productList",listProducts);
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
	
	@RequestMapping(value="/viewProducts")
	public String viewProducts(Model model)
	{
		List<Product> Productslist=productDAO.Productslist();
		model.addAttribute("Productslist",Productslist);
		model.addAttribute("Categorieslist",this.getCategorieslist(categoryDAO.Categorieslist()));
		return "ViewProducts";
	}
	
	@RequestMapping(value="/chosenproduct/{productId}")
	public String showChosenProduct(@PathVariable("productId")int productId,Model model)
	{
		Product product=productDAO.getProduct(productId);
		model.addAttribute("product", product);
		LinkedHashMap<Integer,Integer> quantityMap = new LinkedHashMap<Integer,Integer>();
		for(int i=1;i<=product.getStock();i++)
			quantityMap.put(i,i);
		model.addAttribute("quantityValues", quantityMap);
		
		return "ChosenProduct";
	}
}
