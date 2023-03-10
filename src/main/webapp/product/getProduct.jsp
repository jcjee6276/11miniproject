<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>

<%--
Product vo = (Product)request.getAttribute("vo");
--%>	

	
<html>
<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
		<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
		
		<link rel="stylesheet" href="/css/admin.css" type="text/css">
		<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
		
		<script src="/javascript/bootstrap-dropdownhover.min.js"></script>
		
		<style>
 		body {
            padding-top : 50px;
        }
     </style>

<title>Insert title here</title>

<script type="text/javascript">
	
	$(function() {
		$("button.btn.btn-primary").on("click", function(){
			self.location = "/purchase/addPurchaseView?prodNo=${prod.prodNo}"
		});
	});
	
	$(function() {
		$("button.btn.btn-secondary").on("click", function(){
			self.location="/product/listProduct?menu=search"
		});
	});
 

 </script>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />
	
	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">상품정보조회</h3>
	       <h5 class="text-muted">상품을 <strong class="text-danger">구매</strong>하시겠습니까?</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품번호</strong></div>
			<div class="col-xs-8 col-md-4">${prod.prodNo}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품명</strong></div>
			<div class="col-xs-8 col-md-4">${prod.prodName }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>상품상세정보</strong></div>
			<div class="col-xs-8 col-md-4">${prod.prodDetail}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>이미지</strong></div>
			<img src = "/images/NewUploadFiles/${prod.fileName }"/>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>제조일자</strong></div>
			<div class="col-xs-8 col-md-4">${prod.manuDate}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>가격</strong></div>
			<div class="col-xs-8 col-md-4">${prod.price}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>등록일자</strong></div>
			<div class="col-xs-8 col-md-4">${prod.regDate}</div>
		</div>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">구매</button>
	  			<button type="button" class="btn btn-secondary">확인</button>
	  		</div>
		</div>
	
	
	</div>



</body>
</html><html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>