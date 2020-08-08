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
    width: 600px;
   }
</style>
<meta charset="UTF-8">
<title>공지사항 등록</title>
</head>
<body>
	<table id="noticeTable" border="1">
		<tr style="text-align: center">
			<th bgcolor="#F2F2F2">번호</th>
			<th bgcolor="#F2F2F2">제목</th>
			<th bgcolor="#F2F2F2">등록일</th>
			<th bgcolor="#F2F2F2">수정</th>
			<th bgcolor="#F2F2F2">삭제</th>
		</tr>
		<c:forEach items = "${list}" var="dto">
		<tr>
			<td style="text-align: center">${dto.seq}</td>
			<td style="text-align: center">${dto.title}</td>
			<td style="text-align: center">${dto.write_date}</td>
			<td><a href="notice_content_view.do?seq=${dto.seq}">수정</a></td>	
			<td><a href="notice_delete.do?seq=${dto.seq}">X</a></td>
		</tr>
		</c:forEach>		
		<tr>
			<td colspan="5" align="center" style="font-weight: bold;"><a href="notice_write_view.do">글작성</a></td>
		</tr>
	</table>
</body>
</html>