<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--


List<Product> list= (List<Product>)request.getAttribute("list");
Page resultPage=(Page)request.getAttribute("resultPage");

Search search = (Search)request.getAttribute("search");
//==> null �� ""(nullString)���� ����
String searchCondition = CommonUtil.null2str(search.getSearchCondition());
String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
--%>






<html>
<head>
<title>��ǰ ����</title>

<meta charset="EUC-KR">
	
	<!-- ���� : http://getbootstrap.com/css/   ���� -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>

<link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
<link rel="stylesheet" href="/css/admin.css" type="text/css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
  
  <style>
	  body {
            padding-top : 50px;
        }
    </style>
<script type="text/javascript">

function fncGetProductList(currentPage){
	$("#currentPage").val(currentPage)
	$("form").attr("method", "POST").attr("action", "/product/listProduct?menu=manage").submit();
}

$(function() {
	$( "button.btn.btn-default").on("click", function(){
		fncGetProductList(${search.currentPage });
	});
	
	<c:forEach var="i" begin="0" end="${list.size()-1}">
	$(  "#${i+1}").on("click", function() {
		self.location ="/product/updateProduct?prodNo=${list.get(i).prodNo}"
	});
	</c:forEach>
	$( "td:nth-child(2)" ).css("color" , "red");
	$("h7").css("color" , "red");
	
	$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
});

	$(function(){
		let index = 0;
		$(window).scroll(function(){
			let $window = $(this);
			let scrollTop = $window.scrollTop();
			let windowHeight = $window.height();
			let documentHeight = $(document).height();
			
			if( scrollTop + windowHeight +1 >= documentHeight ){
				index++;
				setTimeout(fetchlist,200);
			}
			
		});
	});
	
	function fetchlist(){
		$.ajax({
			type: "post",
			url: "/product/json/listProduct",
			success : function(data) {
				for(var i=0; i<data.list.length; i++){
					let dat = data.list[i];
					console.log(dat);
					$(body).append();
				}
			} 
		})
	}

</script>
</head>

<body>
	<jsp:include page="/layout/toolbar.jsp" />



	<div class="container">
	
		<div class="page-header text-info">
							<h3>��ǰ ����</h3>
					</div>
				

		  <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		��ü  ${resultPage.totalCount } �Ǽ�, ���� ${resultPage.currentPage}  ������
		    	</p>
		    </div>

		 <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
			    <div class="form-group">
				    <select class="form-control" name="searchCondition" >
				    <option value="0"${search.searchCondition ==0 ? "selected" : "" }>��ǰ��ȣ</option>
				<option value="1"${search.searchCondition ==1 ? "selected" : "" }>��ǰ��</option>
				<option value="2"${search.searchCondition ==2 ? "selected" : "" }>��ǰ����</option>
				    </select>
				   </div>
				   
				   <div class="form-group">
				    <label class="sr-only" for="searchKeyword">�˻���</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="�˻���"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">�˻�</button>
				  
				  <!-- PageNavigation ���� ������ ���� ������ �κ� -->
				  <input type="hidden" id="currentPage" name="currentPage" value="${search.searchKeyword }"/>
				 </form>
				</div> 
				
			</div>	  

		<table class="table table-hover table-striped" >
			
			 <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >��ǰ��</th>
            <th align="left">����</th>
            <th align="left">�����</th>
            <th align="left">�������</th>
          </tr>
        </thead>
        
        <tbody>
        <c:set var="i" value="0" />
		<c:forEach var="prod" items="${list }">
		<c:set var="i" value="${ i+1 }" />
        <tr>
		<td align="center">${i }</td>
		<td align="left" id="${i }">${prod.prodName }</td>
		<td align="left">${prod.price }</td>
		<td align="left">${prod.regDate }</td>
		<c:choose>
		<c:when test="${empty prod.proTranCode }">
		<td align="left">
		<c:out value="�Ǹ���" />
		</td>	
		</c:when>
		<c:when test="${'1' == prod.proTranCode.trim() }">
		<td align="left">
		<c:out value="���ſϷ�" />
		<a href="/purchase/updateTranCodeByProd?prodNo=${prod.prodNo}&tranCode=2">����ϱ�</a>
		</td>	
		</c:when>
		<c:when test="${'2' == prod.proTranCode.trim() }">
		<td align="left">
		<c:out value="�����" />
		</td>	
		</c:when>
		<c:when test="${'3' == prod.proTranCode.trim() }">
		<td align="left">
		<c:out value="��ۿϷ�" />
		</td>	
		</c:when>
		</c:choose>
		
	</tr>
	</c:forEach>
        </tbody>
        
		</table>
	</div>

	<jsp:include page="../common/pageNavigatorProduct.jsp"/>
</body>

</html>


