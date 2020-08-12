<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a { text-decoration:none; color:#000000}
a:hover{text-decoration:underline}
#faqTable, #faqTable.tr, #faqTable.td {	
	border: 1px solid black;
	border-collapse:collapse;	
	margin: auto;
}
h3, p {
	text-align: center;
}
td, tr{
	border-left: none;
	border-right: none;
}
#faqTable {
    width: 600px;
   }
</style>
<meta charset="EUC-KR">
<title>자주하는 질문 [FAQ] (BEST)</title>
</head>
<body>
	<h3>자주하는 질문 <span style="color:red;">(BEST)</span></h3>
	<table id="faqTable">
		<c:forEach items = "${qna_limit}" var="dto">
		<tr>
			<td>Q</td>
			<td>${dto.type}</td>			
			<td><a href="qna_content_view.do?seq=${dto.seq}">${dto.title}</a></td>
		</tr>
		</c:forEach>
	</table>
	
	<br/>
	<br/>
	<br/>
	
	<h3>Contact<span style="color:red;">[1대1 문의]</span></h3>
		<c:choose>
				<c:when test="${EMAIL != null}">
					<p><a href="/RAUM/writeCounseling.do">담당자에게 직접물어보세요 !</a></p><br><br>
				</c:when>
				<c:when test="${EMAIL == null}">
					<p><a href="/RAUM/login.do">담당자에게 직접물어보세요 !</a></p><br><br>
				</c:when>
		</c:choose>
	
</body>
</html>