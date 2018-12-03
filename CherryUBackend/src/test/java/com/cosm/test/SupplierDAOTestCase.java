package com.cosm.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.cosm.dao.SupplierDAO;
import com.cosm.model.Supplier;

public class SupplierDAOTestCase 
{
	
	static SupplierDAO supplierDAO;

	@BeforeClass
	public static void executeFirst()
	{
		AnnotationConfigApplicationContext context=new AnnotationConfigApplicationContext();
		
		context.scan("com.cosm");
		context.refresh();
		
		supplierDAO=(SupplierDAO)context.getBean("supplierDAO");
	}
	
	@Test
	public void addSupplierTest()
	{
		Supplier supplier=new Supplier();
		supplier.setSupplierId(2001);
		supplier.setSupplierName("GNU Exports");
		supplier.setSupplierAddr("Mysore,Karnataka");
		
		assertTrue("Probem in Adding the Supplier",supplierDAO.addSupplier(supplier));
	}

	@Test
	public void updateSupplierTest()
	{	
		Supplier supplier=supplierDAO.getSupplier(2001);
		supplier.setSupplierAddr("Coimbatore,TamilNadu");	
		assertTrue("Problem in Updating the Supplier",supplierDAO.updateSupplier(supplier));
	}
	
	@Test
	public void removeSupplierTest()
	{
		Supplier supplier=supplierDAO.getSupplier(2002);
		assertTrue("Problem in deleting the Supplier",supplierDAO.removeSupplier(supplier));
	}
	
	@Test
	public void listSuppliersTest()
	{
		List<Supplier> Supplierslist=supplierDAO.Supplierslist();
		
		assertTrue("Problem in Listing the Suppliers",Supplierslist.size()>0);
		
		for(Supplier supplier:Supplierslist)
		{
			System.out.println("Supplier ID:"+supplier.getSupplierId());
			System.out.println("Supplier Name:"+supplier.getSupplierName());
			System.out.println("Supplier Desc:"+supplier.getSupplierAddr());
		}
	}
	
}


