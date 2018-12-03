package com.cosm.dao;

import java.util.List;

import com.cosm.model.Category;

public interface CategoryDAO {

		public boolean addCategory(Category category);
		public boolean removeCategory(Category category);
		public boolean updateCategory(Category category);
		public List<Category> Categorieslist();
		public Category getCategory(int categoryId);
		
}

