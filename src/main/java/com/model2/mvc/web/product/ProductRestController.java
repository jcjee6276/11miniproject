package com.model2.mvc.web.product;

import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.Gson;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	public ProductRestController() {
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getProduct/{prodNo}", method=RequestMethod.GET)
	public Product getProduct(@PathVariable int prodNo) throws Exception {
		
		System.out.println("/product/json/getProduct");
		
		return productService.findProduct(prodNo);
	}
	
	@RequestMapping( value="json/listProduct" )
	public Map listProduct(@RequestBody Search search) throws Exception{
		
		Map<String, Object> map = productService.getProductList(search);
		
		return map;
	}
	
//	@RequestMapping( value="json/listProductAuto" )
//	public @ResponseBody Map<String, Object> listProductAuto(@RequestParam Map<String, Object> paramMap, Search search) throws Exception{
//		
//		Map<String,Object> resultList = productService.getProductListAuto(search);
//		paramMap.put("resultList", resultList);
//		System.out.println("Search"+search);
//		System.out.println("result"+resultList);
//		
//		return paramMap;
//	}
//	@RequestMapping( value="json/listProductAuto" )
//	@ResponseBody
//	public String listProductAuto(Locale locale, Model model) {    
//	    String[] array = {"ø±±‚∂±∫∫¿Ã", "Ω≈¿¸∂±∫∫¿Ã", "∞…¿€∂±∫∫¿Ã", "Ω≈¥Áµø∂±∫∫¿Ã"}; // πËø≠ ª˝º∫
//	    
//	        Gson gson = new Gson();
//
//	    return gson.toJson(array); // πËø≠ π›»Ø
//	}
}
