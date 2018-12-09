package com.cosm.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosm.dao.SupplierDAO;
import com.cosm.model.Supplier;

@Controller
public class SupplierController {

	@Autowired
	SupplierDAO supplierDAO;
	
	@RequestMapping(value="/supplier")
	public String showSupplier(Model m)
	{
		List<Supplier> Supplierslist=supplierDAO.Supplierslist();
		m.addAttribute("Supplierslist",Supplierslist);
		return "Supplier";
	}
	
	@RequestMapping(value="/addSupplier",method = RequestMethod.POST)
	public String addSupplierDetail(@RequestParam("supplierId")int supplierId,@RequestParam("supplierName") String supplierName,
			@RequestParam("supplierAddr") String supplierAddr,Model m) {
	Supplier supplier=new Supplier();
	supplier.setSupplierId(supplierId);
	supplier.setSupplierName(supplierName);
	supplier.setSupplierAddr(supplierAddr);
	supplierDAO.addSupplier(supplier);
	List<Supplier> Supplierslist=supplierDAO.Supplierslist();
	m.addAttribute("Supplierslist",Supplierslist);
	return "Supplier";
	}
	
	@RequestMapping(value="/deleteSupplier/{supplierId}")
	public String deleteSupplier(@PathVariable("supplierId")int supplierId,Model m)
	{
		Supplier supplier=supplierDAO.getSupplier(supplierId);
		supplierDAO.removeSupplier(supplier);
		List<Supplier> Supplierslist=supplierDAO.Supplierslist();
		m.addAttribute("Supplierslist",Supplierslist);
		return "Supplier";
	}
	
	@RequestMapping(value="/editSupplier/{supplierId}")
	public String editSupplier(@PathVariable("supplierId")int supplierId,Model m)
	{
		Supplier supplier=supplierDAO.getSupplier(supplierId);
		m.addAttribute("supplier",supplier);
		return "UpdateSupplier";
	}
	@RequestMapping(value="/updateSupplier",method = RequestMethod.POST)
	public String updateCategory(@RequestParam("supplierId")int supplierId,@RequestParam("supplierName") String supplierName,
			@RequestParam("supplierAddr") String supplierAddr,Model m)
	{
		Supplier supplier=new Supplier();
		supplier.setSupplierId(supplierId);
		supplier.setSupplierName(supplierName);
		supplier.setSupplierAddr(supplierAddr);
		supplierDAO.updateSupplier(supplier);
		List<Supplier> Supplierslist=supplierDAO.Supplierslist();
		m.addAttribute("Supplierslist",Supplierslist);
		return "Supplier";
	}
}
