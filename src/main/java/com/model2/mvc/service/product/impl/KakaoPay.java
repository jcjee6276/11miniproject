package com.model2.mvc.service.product.impl;

import java.net.URI;
import java.net.URISyntaxException;

import org.apache.catalina.manager.util.SessionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import com.model2.mvc.service.domain.KakaoPayApprovalVO;
import com.model2.mvc.service.domain.KakaoPayReadyVO;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductDao;

@Service
public class KakaoPay {
 
	@Autowired
	@Qualifier("productDaoImpl")
	private ProductDao productDao;
	
	
	private static final String HOST = "https://kapi.kakao.com";
    
    private KakaoPayReadyVO kakaoPayReadyVO;
    private KakaoPayApprovalVO kakaoPayApprovalVO;
    Purchase purchase;
    //private Purchase purchase;
    
    
    public String kakaoPayReady(Purchase purchase, Product product) throws Exception {
    	
        RestTemplate restTemplate = new RestTemplate();
       
        product = productDao.findProduct(product.getProdNo());// 
        
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "55f6a8b92f448aa1405b371b3e6ca0f9"); //04012ee167a54fddf374766087a27fea
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", Integer.toString(product.getProdNo())); //Integer.toString(purchase.getPurchaseProd().getProdNo())
        params.add("partner_user_id", purchase.getReceiverName());
        params.add("item_name", product.getProdName()); //purchase.getPurchaseProd().getProdName()
        params.add("quantity", "1");
        params.add("total_amount", Integer.toString(product.getPrice()));  //Integer.toString(purchase.getPurchaseProd().getPrice())
        params.add("tax_free_amount", "100");
        params.add("approval_url", "http://localhost:8080/kakaoPaySuccess?prodNo="+product.getProdNo());
        params.add("cancel_url", "http://localhost:8080/kakaoPayCancel");
        params.add("fail_url", "http://localhost:8080/kakaoPaySuccessFail");
        
//        kakaoPayApprovalVO.setPartner_order_id(Integer.toString(product.getProdNo()));
       // kakaoPayApprovalVO.setPartner_user_id(purchase.getReceiverName());
//        kakaoPayApprovalVO.setItem_name(product.getProdName());
//        kakaoPayApprovalVO.setVat_amount(product.getPrice());
        
        
        System.out.println("prams 확인 : "+params);
        //System.out.println("넘어온 product확인 "+product);
        //System.out.println("넘어온 purchase확인 "+purchase);
        purchase.setPurchaseProd(product);
        
        //User user = (User)SessionUtils.getUsedTimeForSession(null)
        
         HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
 
        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayReadyVO.class);
            
            kakaoPayApprovalVO =  restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, KakaoPayApprovalVO.class);
            
            System.out.println("kakaoPayApprovalVO 확인 : "+kakaoPayApprovalVO);
            return kakaoPayReadyVO.getNext_redirect_pc_url();
 
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        return "/pay";
        
    }
    public KakaoPayApprovalVO kakaoPayInfo(String pg_token, int prodNo, User user,Product product) throws Exception {
    	 
    	product = productDao.findProduct(prodNo);
        
        RestTemplate restTemplate = new RestTemplate();
        System.out.println("유저확인"+user);
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "55f6a8b92f448aa1405b371b3e6ca0f9");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");
        //System.out.println("여긴 오는겨?222222"+kakaoPayApprovalVO.toString());
        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", Integer.toString(product.getProdNo()));
        params.add("partner_user_id", user.getUserName());
        params.add("pg_token", pg_token);
        params.add("total_amount", Integer.toString(product.getPrice()));
        
        System.out.println("오는가?"+params);
        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);
        
        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, KakaoPayApprovalVO.class);
            
          
            return kakaoPayApprovalVO;
        
        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            e.printStackTrace();
        }
        
        return null;
    }
    
}