<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
Product vo=(Product)request.getAttribute("productVO");
--%>

<html>
<head>
<title>��ǰ��������</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>

<script type="text/javascript">

function fncAddProduct(){
	//Form ��ȿ�� ����
 	var name=$("input[name='prodName']").val();
	var detail=$("input[name='prodDetail']").val();
	var manuDate=$("input[name='manuDate']").val();
	var price=$("input[name='price']").val();

	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
		
	$("form").attr("method" , "POST").attr("action" , "/product/updateProduct").submit();
}

$(function(){
	$("input[name='manuDate']").datepicker({altField:"input[name='manuDate']",altFormat:"yymmdd"}); 
});

	$(function () {
		$("button.btn.btn-primary").on("click", function() {
			fncAddProduct();
		});
	});
	
	$(function() {
		$("button.btn.btn-secondary").on("click", function() {
			self.location = "/product/listProduct?menu=manage"
		});
	});

</script>
</head>

<body>


	<jsp:include page="/layout/toolbar.jsp" />

<input type="hidden" name="prodNo" value="${productVO.prodNo }"/>

	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-info">��ǰ��������</h3>
	       <h5 class="text-muted">��ǰ ������ <strong class="text-danger">����</strong>�մϴ�.</h5>
	    </div>
	    
	    <form class="form-horizontal">
	    
	    
	    
	    <div class="form-group">
	    <label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ ��</label>
	    	<div class="col-sm-4">
	    	<input type="text" class="form-control" id="prodName" name="prodName" value="${prod.prodName }">
	    	</div>
	    </div>
	    
	    
	    <div class="form-group">
	    <label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
	    	<div class="col-sm-4">
	    	<input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${prod.prodDetail }">
	    	</div>
	    </div>
	    
	    <div class="form-group">
	    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
	    	<div class="col-sm-4">
	    	<input type="text" class="form-control" id="manuDate" name="manuDate" value="${prod.manuDate }" readonly>
	    	</div>
	    </div>
	    
	    <div class="form-group">
	    <label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
	    	<div class="col-sm-4">
	    	<input type="text" class="form-control" id="price" name="price" value="${prod.price }">
	    	</div>
	    </div>
	    
	    <div class="form-group">
		<label for="file" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
		<div class="col-sm-4">
		      <input type="file" class="form-control" id="customFile" name="file" >
		    </div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
			<button type="button" class="btn btn-primary"  >���</button>
			<button type="button" class="btn btn-secondary"  >���</button>
		</div>
	    
	 </div>

</body>
</html>