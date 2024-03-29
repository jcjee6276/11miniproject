package com.model2.mvc.service.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductService {
	public void addProduct(Product product) throws Exception;
	
	public Product findProduct(int productNo) throws Exception;
	
	public Product findNameProduct(String prodName) throws Exception;
	
	public Map<String, Object> getProductList(Search search) throws Exception;
	public Map<String, Object> getProductListAuto(Search search) throws Exception;
	
	public void updateProduct(Product product) throws Exception;
	
//	public Map<String, Object>autocomplete(Search search) throws Exception;
}
