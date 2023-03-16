<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="com.model2.mvc.service.domain.*" %>

<%--
	Purchase purchase = (Purchase)request.getAttribute("pur");
	User user = (User)session.getAttribute("user");
--%>


<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 		body {
            padding-top : 50px;
        }
     </style>
<script type="text/javascript">

	$(function (){
		$("button").on("click", function (){
			self.location = "/purchase/updatePurchase?tranNo=${pur.tranNo}"
		});
	});
	
	$(function (){
		$("td.ct_btn01:contains('확인')").on("click", function (){
			self.location = "/purchase/listPurchase"
		});
	});

</script>

<html>
<head>

<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

</head>

<body>

	
	
	<div class="container">
	
	<div class="page-header">
	       <h3 class=" text-info">구매상세조회</h3>
	       <h5 class="text-muted">구매 정보를 <strong class="text-danger">확인</strong>해 주세요.</h5>
	    </div>
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>물품번호</strong></div>
			<div class="col-xs-8 col-md-4">${pur.purchaseProd.prodNo }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자아이디</strong></div>
			<div class="col-xs-8 col-md-4">${pur.buyer.userId }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매방법</strong></div>
			<div class="col-xs-8 col-md-4">현금구매</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자이름</strong></div>
			<div class="col-xs-8 col-md-4">${pur.receiverName }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자연락처</strong></div>
			<div class="col-xs-8 col-md-4">${pur.receiverPhone }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매자주소</strong></div>
			<div class="col-xs-8 col-md-4">${pur.divyAddr }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>구매요청사항</strong></div>
			<div class="col-xs-8 col-md-4">${pur.divyRequest }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>배송희망일</strong></div>
			<div class="col-xs-8 col-md-4">${pur.divyDate }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>주문일</strong></div>
			<div class="col-xs-8 col-md-4">${pur.orderDate }</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">구매정보수정</button>
	  		</div>
		</div>
		
		<br/>
	    
	    
	
	</div>
	
	



</body>
</html>