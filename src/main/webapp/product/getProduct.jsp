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
	       <h3 class=" text-info">��ǰ������ȸ</h3>
	       <h5 class="text-muted">��ǰ�� <strong class="text-danger">����</strong>�Ͻðڽ��ϱ�?</h5>
	    </div>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��ȣ</strong></div>
			<div class="col-xs-8 col-md-4">${prod.prodNo}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ��</strong></div>
			<div class="col-xs-8 col-md-4">${prod.prodName }</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��ǰ������</strong></div>
			<div class="col-xs-8 col-md-4">${prod.prodDetail}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�̹���</strong></div>
			<img src = "/images/NewUploadFiles/${prod.fileName }"/>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>��������</strong></div>
			<div class="col-xs-8 col-md-4">${prod.manuDate}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>����</strong></div>
			<div class="col-xs-8 col-md-4">${prod.price}</div>
		</div>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>�������</strong></div>
			<div class="col-xs-8 col-md-4">${prod.regDate}</div>
		</div>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary">����</button>
	  			<button type="button" class="btn btn-secondary">Ȯ��</button>
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