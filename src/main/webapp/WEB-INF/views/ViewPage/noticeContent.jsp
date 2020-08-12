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
	margin: 5px auto;
}

#menu {
	text-align: center;
}

#content {
	float: right;
	width: 1010px;
}
</style>

<meta charset="UTF-8">
<title>공지사항</title>
</head>
<body>

	<div id="top">
		<%@ include file="/WEB-INF/views/CustomerService/Top.jsp"%>
	</div>

	<div id="container">

		<div id="menu">
			<%@ include file="/WEB-INF/views/CustomerService/Menu.jsp"%>
		</div>

		<div id="content">
			<%@ include file="/WEB-INF/views/CustomerService/notice_content.jsp"%>
		</div>

	</div>
	
	<div id="footer">
		<%@ include file="/WEB-INF/views/CustomerService/footer.jsp"%>
	</div>
	
</body>
</html>