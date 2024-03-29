<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>






<html>
<head>
<title>구매 목록조회</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">


	function fncGetPurchaseList(currentPage){
		$("#currentPage").val(currentPage)
		$("form").attr("method", "POST").attr("action", "/purchase/listPurchase").submit();
		
	}
	
	
	$(function () {
		$( ".ct_list_pop td:nth-child(3)").on("click", function (){
			self.location = "/user/getUser?userId="+$(this).text().trim()
				
		});
		
		 <c:forEach var="i" begin="0" end="${list.size()-1}">
		$( "#get").on("click", function (){
			self.location = "/purchase/getPurchase?tranNo=${list.get(i).tranNo}";
		});
		</c:forEach> 
	});
	
	
</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" action="/listUser.do" method="post">

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">구매 목록조회</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11">전체 ${resultPage.totalCount } 건수, 현재  ${resultPage.currentPage } 페이지</td>
	</tr> 	
	<tr>
		<td class="ct_list_b" width="100">No</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원ID</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">회원명</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">전화번호</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">배송현황</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">정보수정</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>

	<%--
		int no = list.size();
		for(int i=0; i<list.size(); i++){
			Purchase vo = (Purchase)list.get(i);
	--%>
	 <c:set var="i" value="0" />
	<c:forEach var="pur" items="${list }">
	<c:set var="i" value="${ i+1 }" />
	<tr class="ct_list_pop">
		<td align="center" name="get" id="get">
		<input type="hidden" value=" ${pur.tranNo }">
			<c:out value="${ i}"/>
		</td> 
		<td></td>
		<td align="left">
			${pur.buyer.userId }
		</td>
		<td></td> 
		<td align="left">${pur.receiverName }</td>
		<td></td> 
		<td align="left">${pur.receiverPhone }</td>
		<td></td>  
		
		<c:choose>
		<c:when test="${empty pur.tranCode }">
		<td align="left">
		<c:out value="판매중" />
		</td>	
		</c:when>
		<c:when test="${'1' == pur.tranCode.trim() }">
		<td align="left">
		<c:out value="구매완료" />
		</td>	
		</c:when>
		<c:when test="${'2' == pur.tranCode.trim() }">
		<td align="left">
		<c:out value="배송중" />
		<a href="/purchase/updateTranCode?tranNo=${ pur.tranNo}&tranCode=3">물건도착</a>
		</td>	
		</c:when>
		<c:when test="${'3' ==pur.tranCode.trim() }">
		<td align="left">
		<c:out value="배송완료" />
		</td>	
		</c:when>
		</c:choose>
		
	</tr>
	</c:forEach>
	<tr>
		<td colspan="11" bgcolor="D6D7D6" height="1"></td>
	</tr>
	
	
	
	
	
	
	
	
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		 
			<input type="hidden" id="currentPage" name="currentPage" value="${resultPage.currentPage }"/>
				<jsp:include page="../common/pageNavigatorPurchase.jsp"/>	
		
		</td>
	</tr>
</table>

<!--  페이지 Navigator 끝 -->
</form>

</div>

</body>
</html>