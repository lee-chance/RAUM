<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<%
	String conPath = request.getContextPath();
	/* 패키지 */ 
	out.println("request.getContextPath() = " + conPath);
%>

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
	}
</style>

<meta charset="UTF-8">
<title>메인화면</title>
</head>
<body>
	
<div id="top">
	<jsp:include page="<%=conPath %>/CustomerService/Top.jsp"/>
</div>

<div id="container">
	<jsp:include page="<%=conPath %>/CustomerService/Customer_main.jsp"/>
</div>

</body>
</html>