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
#menu{
	text-align:center;
	width:1280px;
	margin:5px auto;
	}
#content{
	margin:5px auto;
	width:1280px;
	}
</style>

<meta charset="UTF-8">
<title>관리자 페이지 - 유저리스트</title>
</head>
<body>

<div id="top">
	<%@ include file="/WEB-INF/views/CustomerService/Top.jsp"%>
</div>

	<div id="menu">
		<%@ include file="/WEB-INF/views/AdminPage/AdminMenu.jsp"%>
	</div>
	
	<div id="content">
		<%@ include file="/WEB-INF/views/AdminPage/UserList.jsp"%>
	</div>
	

</body>
</html>