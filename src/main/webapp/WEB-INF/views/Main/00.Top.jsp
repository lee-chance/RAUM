<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>신발대여 사이트(RAUM)</title>
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.13.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="<c:url value="/resources/css/styles.css" />"
	rel="stylesheet" />
</head>

<style>
navbarResponsive {
	position: absolute;
	right: 0;
	top: 0;
}
</style>

<meta charset="UTF-8">
<title>Top</title>

<body id="Top-page">

	<nav class="navbar navbar-light bg-light static-top"></nav>
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
		<div class="container" style="white-space: nowrap;">
			<a class="navbar-brand js-scroll-trigger" href="#page-top"></a> <a
				class="navbar-brand" href="index.jsp">RAUM</a>
			<!-- 로고/글자크기 지정해서 많이잡아먹지않도록 처리 -->
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				카테고리 <i class="fas fa-bars ml-1"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav text-uppercase ml-auto">
					<!--                         <li class="nav-item"><a class="nav-link js-scroll-trigger" href="01.jsp">구두 - 정장/행사</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="02.jsp">운동화/스니커즈</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="03.jsp">실내화/슬리퍼</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="04.jsp">고무신/꽃신/무도화</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="05.jsp">워커/부츠/장화</a></li> -->
					<c:choose>
						<c:when test="${EMAIL == null}">
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="MainProductList.do">상품</a>&nbsp;&nbsp;</li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="customerService.do">고객센터</a>&nbsp;&nbsp;</li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="login.do">장바구니</a>&nbsp;&nbsp;</li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="login.do">마이페이지</a>&nbsp;&nbsp;</li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="login.do">로그인</a>&nbsp;&nbsp;</li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="signup.do">회원가입</a>&nbsp;&nbsp;</li>
						</c:when>
						<c:when test="${EMAIL eq 'test'}">
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="MainProductList.do">상품</a>&nbsp;&nbsp;</li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="customerService.do">고객센터</a>&nbsp;&nbsp;</li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="cart.do">장바구니</a>&nbsp;&nbsp;</li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="myPage.do">마이페이지</a>&nbsp;&nbsp;</li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="logout.do">로그아웃</a>&nbsp;&nbsp;</li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="admin.do">관리자페이지</a>&nbsp;&nbsp;</li>
						</c:when>
						<c:when test="${EMAIL != null}">
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="MainProductList.do">상품</a>&nbsp;&nbsp;</li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="customerService.do">고객센터</a>&nbsp;&nbsp;</li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="cart.do">장바구니</a>&nbsp;&nbsp;</li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="myPage.do">마이페이지</a>&nbsp;&nbsp;</li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="logout.do">로그아웃</a>&nbsp;&nbsp;</li>
							<li class="nav-item"><a class="nav-link js-scroll-trigger"
								href="myPage.do"><%=session.getAttribute("NICKNAME")%></a></li>
						</c:when>
					</c:choose>
					<!--  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="06-1.SignUp.jsp">회원가입</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="07-1.Login.jsp">로그인</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="08-1.Basket.jsp">장바구니</a></li>
                        <li class="nav-item"><a class="nav-link js-scroll-trigger" href="09-1.cs.jsp">고객센터</a></li> -->
				</ul>
			</div>
		</div>
	</nav>

	<!-- Masthead-->
	<header class="masthead">
		<div class="container">
			<div class="masthead-subheading">
				Shoes Rental Service<br>
				<br>RAUM
			</div>
			<div class="masthead-heading text-uppercase"></div>
		</div>
	</header>


</body>
</html>