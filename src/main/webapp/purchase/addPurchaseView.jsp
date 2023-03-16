<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<%@ page import="com.model2.mvc.service.domain.*" %>

<%--
	User vo = (User)session.getAttribute("user");
	Product proVO = (Product)request.getAttribute("proVO");
	Purchase purvo = (Purchase)request.getAttribute("purvo");
	
--%>


<html>
<head>

<link rel="stylesheet" href="/css/admin.css" type="text/css">

<title>Insert title here</title>

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script type="text/javascript">

function fncAddPurchase() {
	var receiverPhone=$("input[name='receiverPhone']").val();
	var divyAddr=$("input[name='divyAddr']").val();
	
	if(receiverPhone == null || receiverPhone.length<1){
		alert("������ ����ó�� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(divyAddr == null || divyAddr.length<1){
		alert("������ �ּҴ� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	//$("form").attr("method" , "POST").attr("action" , "/purchase/addPurchase").submit();
	
	//$("form").attr("method" , "POST").attr("action" , "/kakaoPay").submit().window.open();  //
}	
		
	

	$(function(){
	$("input[name='receiverDate']").datepicker({altField:"input[name='manuDate']",altFormat:"yymmdd"}); 
	});

	console.log($("#paymentOption").val());
	$(function() {
		$("button.btn.btn-primary").on("click", function(){
			fncAddPurchase();
			if($("#paymentOption").val()=='3'){
			$("#addPurchase").attr("action", "/kakaoPay");
			//window.open("","popup_window", "toolbar=no, location=no, width=745, height=705");
			$("#addPurchase").submit();
			}else{
			$("#addPurchase").attr("action", "/purchase/addPurchase").submit();
			}
			
			
		});
	});
	
	
	
	
	
	$(function() {
		$("a[href='#']").on("click", function() {
			self.location = "/product/listProduct?menu=search"
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
   		
   		<div class="container" >
   			<h1 class="bg-primary text-center">�� ǰ �� ��</h1>
   		
   			<form class="form-horizontal" id="addPurchase" method="post" action="/purchase/addPurchase">
   			
   			<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��ȣ</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="prodNo" name="prodNo" value="${proVO.prodNo }"readonly>
		 <span id="helpBlock" class="help-block">
		 </span>
			</div>
			</div>
   			
   			<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ��</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="prodName" name="prodName" value="${proVO.prodName }"readonly>
		 <span id="helpBlock" class="help-block">
		 </span>
			</div>
			</div>
			
			<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="prodDetail" name="prodDetail" value="${proVO.prodDetail }"readonly>
		 <span id="helpBlock" class="help-block">
		 </span>
			</div>
			</div>
			
			<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="manuDate" name="manuDate" value="${proVO.manuDate }"readonly>
		 <span id="helpBlock" class="help-block">
		 </span>
			</div>
			</div>
			
			<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">����</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="price" name="price" value="${proVO.price }"readonly>
		 <span id="helpBlock" class="help-block">
		 </span>
			</div>
			</div>
			
			<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�������</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="regDate" name="regDate" value="${proVO.regDate }"readonly>
		 <span id="helpBlock" class="help-block">
		 </span>
			</div>
			</div>
			
			<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�����ھ��̵�</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="buyerId" name="buyerId" value="${purvo.buyer.userName }"readonly>
		 <span id="helpBlock" class="help-block">
		 </span>
			</div>
			</div>
   			
   			<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">���Ź��</label>
		<div class="col-sm-4">
		<select class="form-control" name="paymentOption" id="paymentOption">
				  	<option value="1" >���ݱ���</option>
					<option value="2" >�ſ뱸��</option>
					<option value="3" >īī������</option>
				</select>
			</div>
			</div>
   			
   		<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�������̸�</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="receiverName" name="receiverName" value="${purvo.buyer.userName}" >
		 <span id="helpBlock" class="help-block">
		 </span>
			</div>
			</div>
			
			<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�����ڿ���ó</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="receiverPhone" name="receiverPhone" >
		 <span id="helpBlock" class="help-block">
		 </span>
			</div>
			</div>
			
			<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�������ּ�</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="divyAddr" name="divyAddr" >
		 <span id="helpBlock" class="help-block">
		 </span>
			</div>
			</div>
			
			<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">���ſ�û����</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="receiverRequest" name="receiverRequest" >
		 <span id="helpBlock" class="help-block">
		 </span>
			</div>
			</div>
			
			<div class="form-group">
		<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">����������</label>
		<div class="col-sm-4">
		<input type="text" class="form-control" id="receiverDate" name="receiverDate" value="">
		 <span id="helpBlock" class="help-block">
		 </span>
			</div>
			</div>
   			
   			<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>
   			
   			
   			</form>
   		
   		</div>




<%--request.setAttribute("pvo", proVO);--%>
</body>
</html>