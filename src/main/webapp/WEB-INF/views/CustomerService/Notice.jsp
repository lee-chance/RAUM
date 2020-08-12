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
#noticeTable, #noticeTable.tr, #noticeTable.td {	
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
#noticeTable {
    width: 600px;
   }
   #footer {
position: absolute;
bottom: 0;
width: 100%;

}
</style>
<meta charset="EUC-KR">
<title>공지사항</title>
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
	
	<h3>공지사항</h3>
	<table id="noticeTable" border="1">
		<tr style="text-align: center">
			<td bgcolor="#F2F2F2">번호</td>
			<td bgcolor="#F2F2F2">제목</td>
			<td bgcolor="#F2F2F2">등록일</td>
		</tr>
		<c:forEach items = "${list}" var="dto">
		<tr>
			<td style="text-align: center">${dto.seq}</td>
			<td><a href="content_view.do?seq=${dto.seq}">${dto.title}</a></td>
			<td style="text-align: center">${dto.write_Date}</td>
		</tr>
		</c:forEach>		
	</table>
	
	</div>
	
</div>

	<div id="footer">
		<%@ include file="/WEB-INF/views/CustomerService/footer.jsp"%>
	</div>

</body>
</html>