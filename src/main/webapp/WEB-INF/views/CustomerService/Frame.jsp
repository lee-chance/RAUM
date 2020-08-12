<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
#top {
	position: relative;
	width: 1280px;
	margin: 5px auto;
	padding-bottom: 30px;
}

#container {
	position: relative;
	width: 1280px;
	height: 100%;
	margin: 5px auto;
}

#menu {
	text-align: center;
}

#content {
	float: right;
	width: 1010px;
}
#footer {
position: absolute;
bottom: 0;
width: 100%;

}
</style>

<meta charset="EUC-KR">
<title>고객센터</title>
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
			<%@ include file="Customer_main.jsp"%>
		</div>

	</div>

	<div id="footer">
		<%@ include file="/WEB-INF/views/CustomerService/footer.jsp"%>
	</div>

</body>
</html>