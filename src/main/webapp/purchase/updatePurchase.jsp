<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="com.model2.mvc.service.domain.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
	Purchase vo = (Purchase)request.getAttribute("purchase");
	
--%>

<head>
<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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

	
	$(function() {
		$("a[href='#']").on("click", function(){
			self.location ="/purchase/listPurchase"
		});
	});
	
	$(function(){
		$("button.btn.btn-primary").on("click", function(){
			$("#purchase").attr("action", "/purchase/updatePurchase?tranNo=${purchase.tranNo}").submit();
		});
	});


</script>

</head>

<body>
	
	<div class="container">
	
	<div class="page-header text-center">
	       <h3 class=" text-info">구매정보수정</h3>
	       <h5 class="text-muted">구매 정보를 <strong class="text-danger">수정</strong>해 주세요.</h5>
	    </div>
	    
	  	<form class="form-horizontal" id="purchase" method="post"	action="/purchase/updatePurchase?tranNo=${purchase.tranNo }">  
	    
	    <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${purchase.buyer.userId }" placeholder="중복확인하세요"  readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">아이디는 수정불가</strong>
		      </span>
		    </div>
		  </div>
		  
		  <div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">구매방법</label>
		<div class="col-sm-4">
		<select class="form-control" name="paymentOption" id="paymentOption">
				  	<option value="1" >현금구매</option>
					<option value="2" >신용구매</option>
					<option value="3" >카카오페이</option>
				</select>
			</div>
			</div>
			
		<div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자이름</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverName" name="receiverName" value="${purchase.receiverName }" placeholder="변경회원이름">
		    </div>
		  </div>
			
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자연락처</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverPhone" name="receiverPhone" value="${purchase.receiverPhone }" placeholder="변경회원이름">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매자주소</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyAddr" name="divyAddr" value="${purchase.divyAddr }" placeholder="변경회원이름">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">구매요청사항</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="receiverRequest" name="receiverRequest" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="userName" class="col-sm-offset-1 col-sm-3 control-label">배송희망일자</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="divyDate" name="divyDate" >
		    </div>
		  </div>
	    
	    <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
	    
	    
		</form>
	
	</div>
	



</body>
</html>