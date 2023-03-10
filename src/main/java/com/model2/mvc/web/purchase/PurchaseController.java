package com.model2.mvc.web.purchase;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.user.UserService;

@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public PurchaseController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="addPurchaseView")
	//@RequestMapping(value="addPurchase", method=RequestMethod)
	public ModelAndView addPurchaseView(@ModelAttribute("user") User user, Product product, Purchase purchase,HttpSession session) throws Exception {
		
		user = (User)session.getAttribute("user");
		user = userService.getUser(user.getUserId());
		
		product = productService.findProduct(product.getProdNo());
		
		purchase.setPurchaseProd(product);
		purchase.setBuyer(user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/addPurchaseView.jsp");
		modelAndView.addObject("proVO",product);
		modelAndView.addObject("purvo", purchase);
		
		return modelAndView;
	}
	
	@RequestMapping(value="addPurchase")
	public ModelAndView addPurchase(@ModelAttribute()User user, Product product, Purchase purchase,HttpSession session) throws Exception{
		product = productService.findProduct(product.getProdNo());
		user = (User)session.getAttribute("user");
		purchase.setBuyer(user);
		purchase.setPurchaseProd(product);
		purchase.setTranCode("1");
		
		purchaseService.addPurchase(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/addPurchase.jsp");
		modelAndView.addObject("purcVO",purchase);
		return modelAndView;
	}
	
	@RequestMapping(value="listPurchase")
	public ModelAndView listPurchase(@ModelAttribute("search") Search search) throws Exception {
		System.out.println("/listPurchase.do");
		if(search.getCurrentPage()==0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = purchaseService.getPurchaseList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/listPurchase.jsp");
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search",search);
		
		return modelAndView;
	}
	
	@RequestMapping(value="getPurchase")
	public ModelAndView getPurchase(@ModelAttribute("purchase") Purchase purchase, User user, Product product, HttpSession session) throws Exception{
		
		user = (User)session.getAttribute("user");
		purchase.setBuyer(user);
		System.out.println("�Ѿ�� tran No"+purchase.getTranNo());
		purchase = purchaseService.getPurchase(purchase.getTranNo());
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/getPurchase.jsp");
		modelAndView.addObject("pur",purchase);
		
		return modelAndView;
	}
	
	@RequestMapping(value="updatePurchase", method=RequestMethod.GET)
	public ModelAndView updatePurchase(@RequestParam("tranNo") int tranNo,User user, Purchase purchase, HttpSession session) throws Exception{
		//user = (User)session.getAttribute("user");
		//purchase.setBuyer(user);
		purchase = purchaseService.getPurchase(purchase.getTranNo());

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/purchase/updatePurchase.jsp");
		modelAndView.addObject("purchase",purchase);
		
		return modelAndView;
	}
	
	@RequestMapping(value="updatePurchase", method=RequestMethod.POST)
	public ModelAndView updatePurchase(@ModelAttribute() Purchase purchase) throws Exception{
		System.out.println("purchase Ȯ��"+purchase);
		purchaseService.updatePurchase(purchase);
		System.out.println("update purchase Ȯ��"+purchase);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/purchase/getPurchase?tranNo="+purchase.getTranNo());
		modelAndView.addObject("pur",purchase);
		
		return modelAndView;
	}
	
	@RequestMapping(value="updateTranCodeByProd")
	public ModelAndView updateTranCodeByProd(@ModelAttribute()Product product, Purchase purchase) throws Exception{
		System.out.println(product.getProdNo());
		purchase.setPurchaseProd(product); 

		purchaseService.updateTranCode(purchase);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/product/listProduct.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="updateTranCode")
	public ModelAndView updateTranCode(@ModelAttribute() Product product, Purchase purchase) throws Exception{
		product.setProTranCode(purchase.getTranCode());
		purchase  = purchaseService.getPurchase(purchase.getTranNo());
		purchase.setTranCode(product.getProTranCode());
		purchaseService.updateTranCode(purchase);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/purchase/listPurchase");
		//modelAndView.addObject(modelAndView);
		return modelAndView;
	}
	
}
