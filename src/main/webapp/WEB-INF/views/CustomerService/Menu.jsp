<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css"> 
#menuTable {
	padding:20px;
	position : absolute;
	border:3px solid black;
}
</style>
<meta charset="EUC-KR">
<title>MENU</title>
</head>
<body>
	<table id="menuTable">
		<tr>
			<td style="text-align: center;"><h3>고객센터</h3></td>
		</tr>
		<tr>
			<td style="text-align: center">고객님들의 작은 소리에도<br>개선을 위해 노력합니다.</td>
		</tr>
		<tr>
			<td></td>
		</tr>
		<tr>
			<td><hr style="border: #A4A4A4 1px dashed"></td>
		</tr>		
		<tr>
			<td></td>
		</tr>	
		<tr>
			<td><a href="/RAUM/customerService.do" style="color:blue;">고객센터 홈</a></td>
		</tr>
		<tr>
			<td><a href="/RAUM/noticeList.do">공지사항</a></td>
		</tr>
		<tr>
			<td><a href="/RAUM/qna.do">자주묻는 질문 [FAQ]</a></td>
		</tr>		
		<tr>
		<c:choose>
				<c:when test="${EMAIL != null}">
					<td><a href="/RAUM/writeCounseling.do">1:1 상담</a></td>
				</c:when>
				<c:when test="${EMAIL == null}">
					<td><a href="/RAUM/login.do">1:1 상담</a></td>
				</c:when>
		</c:choose>
		</tr>						
	</table>
</body>
</html>