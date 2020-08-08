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
<title>FAQ</title>
</head>
<body>
	<table id="noticeTable" border="1">
		<tr style="text-align: center">
			<th bgcolor="#F2F2F2">번호</th>
			<th bgcolor="#F2F2F2">항목</th>
			<th bgcolor="#F2F2F2">제목</th>
			<th bgcolor="#F2F2F2">수정</th>
			<th bgcolor="#F2F2F2">삭제</th>
		</tr>
		<c:forEach items = "${qna}" var="dto">
		<tr>
			<td style="text-align: center">${dto.qnaSeq}</td>
 			<td style="text-align: center">${dto.qnaType}</td> 
			<td style="text-align: left">${dto.qnaTitle}</td>
			<td><a href="FAQ_content_view.do?seq=${dto.qnaSeq}">수정</a></td>	
			<td><a href="FAQ_delete.do?seq=${dto.qnaSeq}">X</a></td>
		</tr>
		</c:forEach>		
		<tr>
			<td colspan="5" align="center" style="font-weight: bold;"><a href="FAQ_write_view.do">글작성</a></td>
		</tr>
	</table>
</body>
</html>