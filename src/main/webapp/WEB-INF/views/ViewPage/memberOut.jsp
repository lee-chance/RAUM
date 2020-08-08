<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
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
</style>


<meta charset="UTF-8">
<title>1:1 친절상담</title>
</head>
<body>

<div id="top">
	<%@ include file="/WEB-INF/views/CustomerService/Top.jsp"%>
</div>
	
<div id="container">

	<div id="menu">
		<%@ include file="/WEB-INF/views/MyPage/leftSide.jsp"%>
	</div>
	
	<div id="content">
		<%@ include file="/WEB-INF/views/MyPage/memberInfo/memberOut.jsp"%>
	</div>
	
</div>


</body>
</html>