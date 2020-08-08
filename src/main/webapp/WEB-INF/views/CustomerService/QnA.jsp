<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

#top{
	position:relative; 
	width:1280px; 
	margin:5px auto; 
	padding-bottom:30px;
	}
#container{
	position:relative;
	width:1280px;
	margin:5px auto;
	}
#menu{
	text-align:center;
	}
#content{
	float:right;
	width: 1010px;
	}

a { text-decoration:none; color:#000000}
a:hover{text-decoration:underline}
#qnaTable, #qnaTable.tr, #qnaTable.td {	
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
#qnaTable {
    width: 600px;
   }
</style>
<meta charset="EUC-KR">
<title>자주하는 질문 [FAQ]</title>
</head>
<body>

<div id="top">
	<%@ include file="Top.jsp"%>
</div>
	
<div id="container">

	<div id="menu">
		<%@ include file="Menu.jsp"%>
	</div>
	
	<div id="content">

	<h3>자주하는 질문 <span style="color:red;">[FAQ]</span></h3>
	<p>궁금하신 문의사항을 검색하세요!</p>
	
	<table id="qnaTable" border="1">
		<c:forEach items = "${qna}" var="dto">
		<tr>
			<td>Q</td>
			<td>${dto.type}</td>
			<td><a href="qna_content_view.do?seq=${dto.seq}">${dto.title}</a></td>			
		</tr>
		</c:forEach>
	</table>
	
	</div>
	
</div>
</body>
</html>