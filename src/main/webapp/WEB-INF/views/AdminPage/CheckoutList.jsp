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
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
			<col width="10%"/>
		</colgroup>
		<thead>
			<tr>
				<th bgcolor="#F2F2F2">주문번호</th>
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
				<td>${dto.seq}</td>
				<td>${dto.startDate}</td>
				<td>${dto.endDate}</td>
				<td>${dto.name}</td>
				<td>${dto.paymentMethod}</td>
				<td>${dto.productName}</td>
				<td><a href="/RAUM/adminCheckoutInfo.do?seq=${dto.seq}">${dto.status}</a></td>
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