<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> -->
<style type="text/css">

#btn{ 
border: 1px solid #ffc107; 
background-color: rgba(0,0,0,0); 
color: #ffc107; 
padding: 5px;
border-radius: 5px;
font-size: 16px; }

#btn:hover{ 
color:white; 
background-color: #ffc107;
cursor: pointer; }



body {margin:0;}
.nav-container {
	display:flex;
	flex-direction: row;

	margin: 0;
	padding: 15px;
	background-color: #D8D8D8;
	list-style-type: none;
}
a {
	text-align: center;
	text-decoration: none;
	color: #1C1C1C;
}
a:hover {
	font-weight: bold;
}

input:focus {outline:none;}

#floatRight {float: right;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<nav>
		<ul class="nav-container">
			<c:choose>
				<c:when test="${EMAIL == null}">
					<li class="nav-item"><a href="/RAUM/customerService.do">고객센터</a>&nbsp;&nbsp;</li>
					<li class="nav-item"><a href="/RAUM/login.do">장바구니</a>&nbsp;&nbsp;</li>
					<li class="nav-item"><a href="/RAUM/login.do">마이페이지</a>&nbsp;&nbsp;</li>
					<li class="nav-item"><a href="/RAUM/login.do">로그인</a>&nbsp;&nbsp;</li>
					<li class="nav-item"><a href="/RAUM/signup.do">회원가입</a>&nbsp;&nbsp;</li>
				</c:when>
				<c:when test="${EMAIL eq 'test'}">
					<li class="nav-item"><a href="/RAUM/customerService.do">고객센터</a>&nbsp;&nbsp;</li>
					<li class="nav-item"><a href="/RAUM/cart.do">장바구니</a>&nbsp;&nbsp;</li>
					<li class="nav-item"><a href="/RAUM/myPage.do">마이페이지</a>&nbsp;&nbsp;</li>
					<li class="nav-item"><a href="/RAUM/logout.do">로그아웃</a>&nbsp;&nbsp;</li>
					<li class="nav-item"><a href="/RAUM/admin.do">관리자페이지</a>&nbsp;&nbsp;</li>
				</c:when>
				<c:when test="${EMAIL != null}">
					<li class="nav-item"><a href="/RAUM/customerService.do">고객센터</a>&nbsp;&nbsp;</li>
					<li class="nav-item"><a href="/RAUM/cart.do">장바구니</a>&nbsp;&nbsp;</li>
					<li class="nav-item"><a href="/RAUM/myPage.do">마이페이지</a>&nbsp;&nbsp;</li>
					<li class="nav-item"><a href="/RAUM/logout.do">로그아웃</a>&nbsp;&nbsp;</li>
					<li class="nav-item" align="right"><a href="/RAUM/myPage.do"><%=session.getAttribute("NICKNAME")%></a>&nbsp;&nbsp;</li>
				</c:when>
			</c:choose>
			<li class="nav-item"><a href="/RAUM/MainProductList.do"><span style="color:#036; font-weight: bold">상품 모아보기</span></a>&nbsp;&nbsp;</li>
			<li class="nav-item"><a href="/RAUM/reviewList.do"><span style="color: red; font-weight: bold">대여후기</span></a>&nbsp;&nbsp;</li>
		</ul>
	</nav>
	
	<br><br><br>
		<form action="searchProductList.do" method="post" style="float: center">
		<a href="/RAUM/home.do"><span style = " font-size:1.5em; font-weight: bold; color: #FACC2E;">RAUM</span></a>&emsp;
		<input type="text" name="search" placeholder="원하시는 대여 상품을 찾아보세요." style="height:33px; width:300px; border: 1px solid #2E2E2E; border-radius:5px;">&emsp;
		<input type="submit" id="btn" value="검색" style="width: 60px; height: 35px;">
		</form><br><br>

	<hr>
	
</body>
</html>