<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
table{	margin: auto;}
h1{text-align: center;}
</style>
<meta charset="UTF-8">
<title>결제완료창</title>
</head>
<body>
	
	<h1>결제가 완료되었습니다</h1>
	
	<table border="">
		<tr><th>사용자 email</th><td> ${CompletePayment.email }</td></tr> 
		<tr><th>사용자 이름</th><td>${CompletePayment.name } </td></tr>
		<tr><th>사용자 전화번호</th><td> ${CompletePayment.phone }</td></tr>
		<tr><th>주문번호</th><td>  ${CompletePayment.rent_seq }  </td></tr>
		<tr><th>결제금액</th><td> ${CompletePayment.payment }  </td></tr>
		<tr><th>결제일자</th><td>   ${CompletePayment.orderDate }  </td></tr> 
	<tr><td colspan="2" align="center"><a href="orderList.do">주문내역보기</a></td></tr>
	</table>
	
</body>
</html>