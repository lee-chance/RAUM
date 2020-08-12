<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
#userListTable, #userListTable.tr, #userListTable.td {	
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
#userListTable {
    width: 800px;
   }
</style>

<meta charset="UTF-8">
<title>관리자 화면</title>
</head>
<body>

	<p/>
	
	<table id="userListTable" border="1" class="order_table1" width="800" align="center">
		<colgroup>
			<col width="10%"/><col width="10%"/>
			<col width="*"/><col width="30%"/>
		</colgroup>
		<thead>
			<tr>
				<th bgcolor="#F2F2F2">이름</th>
				<th bgcolor="#F2F2F2">닉네임</th>
				<th bgcolor="#F2F2F2">이메일</th>
				<th bgcolor="#F2F2F2">전화번호</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items = "${userList}" var="dto">
			<tr>
				<td>${dto.name}</td>
				<td>${dto.nickname}</td>
				<td><a href="#">${dto.email}</a></td>
				<td>${dto.phone}</td>
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