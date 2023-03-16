package com.model2.mvc.web.product;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.impl.KakaoPay;
import com.model2.mvc.service.purchase.PurchaseService;
import com.model2.mvc.service.domain.KakaoPayApprovalVO;

import lombok.Setter;
import lombok.extern.java.Log;
 
@Log
@Controller
public class KakaoPayController {

	@Setter
	@Autowired
    private KakaoPay kakaopay;
	
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	
	private KakaoPayApprovalVO kakaoPayApprovalVO;
	
	
	@GetMapping("/kakaoPay")
    public void kakaoPayGet() {
    }
	
	@PostMapping("/kakaoPay")
    public String kakaoPay(@ModelAttribute() Purchase purchase, Product product, HttpSession session) throws Exception {
        session.getAttribute("purvo");
		session.getAttribute("user");
        return "redirect:" + kakaopay.kakaoPayReady(purchase, product);
        
    }
	
	
	
	 @GetMapping("/kakaoPaySuccess")
	    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token,
	    							  @RequestParam("prodNo") int prodNo, Model model, 
	    							  Product product,
	    							  Purchase purchase,
	    							  HttpSession session,
	    							  User user) throws Exception {
	        System.out.println("pgtoken"+pg_token);
	        user = (User)session.getAttribute("user");
	        purchase.setBuyer(user);
	        purchase.setPurchaseProd(product);
	        purchase.setTranCode("1");

	       
	        
	        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token, prodNo, user, product));
	        
	        purchaseService.addPurchase(purchase);
	        
	        return "forward:/purchase/addPurchaseKakao.jsp";
	    }
}
