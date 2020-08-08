<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a { text-decoration:none; color: black;}
h3, table {text-align: center;}
table {margin: auto;}
</style>
<script type="text/javascript">
function setParentText() {
	opener.document.getElementById("pInput").value = document.getElementById("cInput").value
}
</script>
<meta charset="UTF-8">
<title>이메일 중복체크 결과</title>
</head>
<body>
	<div style="text-align: center"></div>
	<h3>이메일 중복 확인 결과</h3>
	
		<table>
		<tr>
			<td colspan="2"><span style="color: red">${check_email.checkMsg}</span></td> 		 			
		</tr>	
		<tr>
			<td colspan="2"><input type="hidden" id="cInput" value="${check_email.email}"></td>
		</tr>
		<tr>
			<td ><a href="LoginForm/emailCheckForm.jsp">이메일 다시 입력</a>&nbsp;<input type="button" value="${check_email.useEmail}" onclick="setParentText(); window.close();"></td>
		</tr>	
	
	</table>
	
</body>
</html>