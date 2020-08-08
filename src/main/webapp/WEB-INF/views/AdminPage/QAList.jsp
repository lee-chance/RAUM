<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#noticeTable, #noticeTable.tr, #noticeTable.td {	
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
#noticeTable {
    width: 800px;
   }
</style>
<meta charset="UTF-8">
<title>관리자 1:1 상담</title>
</head>
<body>
	<table id="noticeTable" border="1">
		<tr style="text-align: center">
			<th bgcolor="#F2F2F2">번호</th>
			<th bgcolor="#F2F2F2">항목</th>
			<th bgcolor="#F2F2F2">제목</th>
			<th bgcolor="#F2F2F2">작성자</th>
			<th bgcolor="#F2F2F2">작성일</th>
			<th bgcolor="#F2F2F2">상태</th>	
			<th bgcolor="#F2F2F2">삭제</th>						
		</tr>
		<c:forEach items = "${admin_qna}" var="dto">
		<tr>
			<td style="text-align: center">${dto.seq}</td>
			<td style="text-align: center">${dto.category}</td>
			<td style="text-align: center">${dto.title}</td>
			<td style="text-align: center">${dto.nickname}</td>		
			<td style="text-align: center">${dto.date}</td>	
			<td style="text-align: center; font-weight: bold;"><a href="admin_qna_content.do?seq=${dto.seq}">${dto.status}</a></td>								
			<td><a href="admin_qna_delete.do?seq=${dto.seq}">X</a></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>