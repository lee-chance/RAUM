<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">

#top{
	position:relative; 
	width:1280px; 
	margin:5px auto; 
	padding-bottom:30px;
	}

#wrapper
{
	width:1280px;
	margin:5px auto;
}
#images
img{
	vertical-align:middle;
}
</style>
<script>
</script>
</head>
<body>

<div id="top">
	<%@ include file="/WEB-INF/views/CustomerService/Top.jsp"%>
</div>
	
<div id="wrapper">
	<%@ include file="/WEB-INF/views/CustomerService/SearchProduct.jsp"%>
</div>

</body>
</html>