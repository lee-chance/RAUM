<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
#checkoutListTable, #checkoutListTable.tr, #checkoutListTable.td {	
	border: 1px solid black;
	border-collapse:collapse;	
	margin: auto;
	text-align: center;
}
h3, p {
	text-align: center;
}
td, tr{
	border: none;
}
#checkoutListTable {
    width: 800px;
   }
</style>

<meta charset="UTF-8">
<title>관리자 화면</title>
</head>
<body>

	<p/>
	
	<table id="checkoutListTable" border="1" class="order_table1" width="1280">
		<colgroup>
			<col width="5%"/>
			<col width="18%"/>
			<col width="15%"/>
			<col width="15%"/>
			<col width="10%"/>
			<col width="5%"/>
			<col width="*"/>
			<col width="13%"/>
		</colgroup>
		<thead>
			<tr>
				<th bgcolor="#F2F2F2">주문번호</th>
				<th bgcolor="#F2F2F2">주문자이메일</th>
				<th bgcolor="#F2F2F2">사용일</th>
				<th bgcolor="#F2F2F2">반납일</th>
				<th bgcolor="#F2F2F2">입금자성함</th>
				<th bgcolor="#F2F2F2">입금방법</th>
				<th bgcolor="#F2F2F2">제품이름</th>
				<th bgcolor="#F2F2F2">상태</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items = "${checkoutList}" var="dto">
			<tr>
				<td>${dto.order_num}</td>
				<td>${dto.user_email}</td>
				<td>${dto.start_date}</td>
				<td>${dto.end_date}</td>
				<td>${dto.depositor}</td>
				<td>${dto.payment_method}</td>
				<td>${dto.product_name}</td>
				<td><a href="/ProjectShare/adminCheckoutInfo.do?order_num=${dto.order_num}">${dto.status}</a></td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
</body>
</html>