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

#wrapper {
	width: 1280px;
	margin: 5px auto;
}
</style>

<meta charset="UTF-8">
<title>리뷰</title>
</head>
<body>

	<div id="top">
		<%@ include file="/WEB-INF/views/CustomerService/Top.jsp"%>
	</div>

	<div id="wrapper">
		<%@ include file="/WEB-INF/views/Review/review.jsp"%>
	</div>
	
	<div id="footer">
		<%@ include file="/WEB-INF/views/CustomerService/footer.jsp"%>
	</div>
	
</body>
</html>