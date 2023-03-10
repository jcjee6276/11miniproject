<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--


List<Product> list= (List<Product>)request.getAttribute("list");
Page resultPage=(Page)request.getAttribute("resultPage");

Search search = (Search)request.getAttribute("search");
//==> null 을 ""(nullString)으로 변경
String searchCondition = CommonUtil.null2str(search.getSearchCondition());
String searchKeyword = CommonUtil.null2str(search.getSearchKeyword());
--%>






<html>
<head>
<title>상품 관리</title>

<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
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
							<h3>상품 관리</h3>
					</div>
				

		  <div class="row">
	    
		    <div class="col-md-6 text-left">
		    	<p class="text-primary">
		    		전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
		    	</p>
		    </div>

		 <div class="col-md-6 text-right">
			    <form class="form-inline" name="detailForm">
			    
			    <div class="form-group">
				    <select class="form-control" name="searchCondition" >
				    <option value="0"${search.searchCondition ==0 ? "selected" : "" }>상품번호</option>
				<option value="1"${search.searchCondition ==1 ? "selected" : "" }>상품명</option>
				<option value="2"${search.searchCondition ==2 ? "selected" : "" }>상품가격</option>
				    </select>
				   </div>
				   
				   <div class="form-group">
				    <label class="sr-only" for="searchKeyword">검색어</label>
				    <input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어"
				    			 value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
				  </div>
				  
				  <button type="button" class="btn btn-default">검색</button>
				  
				  <!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
				  <input type="hidden" id="currentPage" name="currentPage" value="${search.searchKeyword }"/>
				 </form>
				</div> 
				
			</div>	  

		<table class="table table-hover table-striped" >
			
			 <thead>
          <tr>
            <th align="center">No</th>
            <th align="left" >상품명</th>
            <th align="left">가격</th>
            <th align="left">등록일</th>
            <th align="left">현재상태</th>
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
		<c:out value="판매중" />
		</td>	
		</c:when>
		<c:when test="${'1' == prod.proTranCode.trim() }">
		<td align="left">
		<c:out value="구매완료" />
		<a href="/purchase/updateTranCodeByProd?prodNo=${prod.prodNo}&tranCode=2">배송하기</a>
		</td>	
		</c:when>
		<c:when test="${'2' == prod.proTranCode.trim() }">
		<td align="left">
		<c:out value="배송중" />
		</td>	
		</c:when>
		<c:when test="${'3' == prod.proTranCode.trim() }">
		<td align="left">
		<c:out value="배송완료" />
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


