<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>상품등록</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<script type="text/javascript">

function fncAddProduct(){
	//Form 유효성 검증
 	//var name = document.detailForm.prodName.value;
	
	
	//var detail = document.detailForm.prodDetail.value;
	//var manuDate = document.detailForm.manuDate.value;
	//var price = document.detailForm.price.value;
	var name=$("input[name='prodName']").val();
	var detail=$("input[name='prodDetail']").val();
	var manuDate=$("input[name='manuDate']").val();
	var price=$("input[name='price']").val();

	if(name == null || name.length<1){
		alert("상품명은 반드시 입력하여야 합니다.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("상품상세정보는 반드시 입력하여야 합니다.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("제조일자는 반드시 입력하셔야 합니다.");
		return;
	}
	if(price == null || price.length<1){
		alert("가격은 반드시 입력하셔야 합니다.");
		return;
	}
	
	
	$("form").attr("method" , "POST").attr("action" , "/product/addProduct").submit();
	
	
}
	$(function(){
		$("input[name='manuDate']").datepicker({altField:"input[name='manuDate']",altFormat:"yymmdd"}); 
	});
		
	$(function() {
		$("button.btn.btn-primary").on("click", function() {
			fncAddProduct();
		});
	});


	$(function() {
		$("button.btn.btn-secondary").on("click", function() {
			$("form")[0].reset();
		});
	});

</script>
<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style>
</head>

<body>

				<div class="navbar  navbar-default">
        	<div class="container">
					<a class="navbar-brand" href="/index.jsp">Model2 MVC Shop</a>
					</div>
   				</div>
				
		<div class="container">
	
		<h1 class="bg-primary text-center">상 품 등 록</h1>
		
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		  <div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">상품명</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="prodName" name="prodName" placeholder="상품명을 입력하세요." >
		 <span id="helpBlock" class="help-block">
		 </span>
		 </div>
		</div>
		
		<div class="form-group">
		<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">상품상세정보</label>
		<div class="col-sm-4">
		      <input type="prodDetail" class="form-control" id="prodDetail" name="prodDetail" placeholder="상품상세정보">
		    </div>
		</div>
		
		<div class="form-group">
		<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">제조일자</label>
		<div class="col-sm-4">
		      <input type="manuDate" class="form-control" id="manuDate" name="manuDate" readonly>
		    </div>
		</div>
		
		<div class="form-group">
		<label for="price" class="col-sm-offset-1 col-sm-3 control-label">가격</label>
		<div class="col-sm-4">
		      <input type="price" class="form-control" id="price" name="price" placeholder="가격을 입력하세요.">
		    </div>
		</div>
		
		<div class="form-group">
		<label for="file" class="col-sm-offset-1 col-sm-3 control-label">상품이미지</label>
		<div class="col-sm-4">
		      <input type="file" class="form-control" id="customFile" name="file" >
		    </div>
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-4  col-sm-4 text-center">
			<button type="button" class="btn btn-primary"  >등록</button>
			<button type="button" class="btn btn-secondary"  >취소</button>
		</div>
		
	</div>
	
			
</form>
</body>
</html>