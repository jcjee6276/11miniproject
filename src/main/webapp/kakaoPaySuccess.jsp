<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>

<title>Insert title here</title>
</head>
<body>
 
īī������ ������ ���������� �Ϸ�Ǿ����ϴ�.
 
�����Ͻ�:     [[${info.approved_at}]]<br/>
�ֹ���ȣ:    [[${info.partner_order_id}]]<br/>
��ǰ��:    [[${info.item_name}]]<br/>
��ǰ����:    [[${info.quantity}]]<br/>
�����ݾ�:    [[${info.amount.total}]]<br/>
�������:    [[${info.payment_method_type}]]<br/>
 
 
 
<h2>[[${info}]]</h2>
 
</body>
</html>