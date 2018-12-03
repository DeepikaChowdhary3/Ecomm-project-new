package com.cosm.dao;

import java.util.List;

import com.cosm.model.Supplier;

public interface SupplierDAO {

	public boolean addSupplier(Supplier supplier);
	public boolean removeSupplier(Supplier supplier);
	public boolean updateSupplier(Supplier supplier);
	public List<Supplier> Supplierslist();
	public Supplier getSupplier(int supplierId);
}