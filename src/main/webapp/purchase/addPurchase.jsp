<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- --%>
<%--@ page import="com.model2.mvc.service.domain.*" --%>



<%--
	Purchase pvo = (Purchase)request.getAttribute("purcVO");
--%>



<html>
<head>
<title>Insert title here</title>
</head>

<body>

<form name="updatePurchase" action="/purchase/updatePurchaseView?tranNo=" method="post">

������ ���� ���Ű� �Ǿ����ϴ�.

<table border=1>
	<tr>
		<td>��ǰ��ȣ</td>
		<td>${purcVO.purchaseProd.prodNo }</td>
		<td></td>
	</tr> 
	<tr>
		<td>�����ھ��̵�</td>
		<td>${purcVO.buyer.userId }</td>
		<td></td>
	</tr> 
	<tr>
		<td>���Ź��</td>
		<td>
		
			${purcVO.paymentOption =='1' ? '���ݱ���' : '�ſ뱸��' }
		
		</td>
		<td></td>
	</tr>
	<tr>
		<td>�������̸�</td>
		<td>${purcVO.receiverName }</td>
		<td></td> 
	</tr>
	<tr>
		<td>�����ڿ���ó</td>
		<td>${purcVO.receiverPhone }</td>
		<td></td> 
	</tr>
	<tr>
		<td>�������ּ�</td>
		<td>${purcVO.divyAddr }</td>
		<td></td> 
	</tr>
		<tr>
		<td>���ſ�û����</td>
		<td>${purcVO.divyRequest }</td>
		<td></td> 
	</tr>
	<tr>
		<td>����������</td>
		<td>${purcVO.divyDate }</td>
		<td></td> 
	</tr>
</table>
</form>

</body>
</html>