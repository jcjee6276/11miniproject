package com.model2.mvc.web.product;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.model2.mvc.service.domain.KakaoPayApprovalVO;

import lombok.Setter;
import lombok.extern.java.Log;
 
@Log
@Controller
public class KakaoPayController {

	@Setter
	@Autowired
    private KakaoPay kakaopay;
	
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
	    public String kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, @ModelAttribute() Purchase purchase) {
	        System.out.println("pgtoken"+pg_token);
	        System.out.println("Ȯ��"+purchase);
	       
	        
	        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token, purchase));
	        
	        
	        return "forward:/purchase/addPurchaseKakao.jsp";
	    }
}
