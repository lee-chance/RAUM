<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a { text-decoration:none; color:#000000}
a:hover{text-decoration:underline}
#reviewTable, #reviewTable.tr, #reviewTable.td {	
	border: 1px solid #424242;
	border-collapse:collapse;	
	margin: auto;
}
h3, p {
	text-align: center;
}
td, tr{
	border-bottom: none;
	border-left: none;
	border-right: none;

}
#reviewTable {
    width: 700px;

   }
</style>
<meta charset="UTF-8">
<title>대여후기</title>
</head>
<body>

<%
	String imagePath = request.getRealPath("");
%>

	<h3><span style="color: red">대여후기</span></h3>
	<table id="reviewTable" border = "1">
		<c:forEach items = "${reviewList}" var="dto">
		<tr>
			<td rowspan="3"><img src="/RAUM/resources/image/${dto.image}" width="80" height="80"/><br/></td>	 			

		</tr>	
		<tr height="50">
			<td width="200"><span style="font-weight: bold;">상품명 | ${dto.name}</span></td> <!-- 상품 이름 -->
			<td align="center">작성자 | ${dto.nickname}</td> <!-- 닉네임 -->
			<td align="right">작성일 | ${dto.writeDate}</td> <!-- 작성 일자 -->			 			
		</tr>
		<tr height="50">
			<td colspan="3"><a href="review_content_view.do?seq=${dto.seq}">${dto.title}</a></td> <!-- 제목 -->	 			
		</tr>		
		</c:forEach>
	
	</table>
</body>
</html>