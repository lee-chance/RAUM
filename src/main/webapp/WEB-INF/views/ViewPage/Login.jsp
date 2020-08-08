<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style type="text/css">

#top{
	position:relative; 
	width:1280px; 
	margin:5px auto; 
	padding-bottom:30px;
	}
	
#wrapper
{
	width:500px;
	margin:0 auto;
}
</style>

<script type="text/javascript">
function checkEmpty() {
	if(login.id.value=="") {
		alert("아이디를 입력하세요");
		return false;
	}
	else if(login.password.value=="") {
		alert("비밀번호를 입력하세요");
		return false;
	}
	else
		return true;
}
</script>

</head>
<body>

<div id="top">
	<%@ include file="/WEB-INF/views/CustomerService/Top.jsp"%>
</div>

<div id="wrapper">
	<c:choose>
		<c:when test="${LOGIN_ERROR == '-1'}">
			<script type="text/javascript">
				alert("아이디가 존재하지 않습니다.")
			</script>
		</c:when>
		<c:when test="${LOGIN_ERROR == '0'}">
			<script type="text/javascript">
				alert("비밀번호가 틀렸습니다.")
			</script>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${RESULT == '1'}">
			<script type="text/javascript">
				alert("연락처로 아이디 정보를 발송했습니다.")
			</script>
		</c:when>
	</c:choose>
	<c:choose>
		<c:when test="${RESULT_PW == '1'}">
			<script type="text/javascript">
				alert("이메일로 비밀번호 정보를 발송했습니다.\n이메일을 확인해주세요.")
			</script>
		</c:when>
	</c:choose>
	<form name="login" action="actionLogin.do" method="post" onSubmit="return checkEmpty();">
	<table border="0" align="center" style="text-align:center">
		<tr>
			<td colspan="3"><img alt="login logo" src="http://www.ddaengshop.com/common/img/tit_login.gif" width="100"><br><br></td>
		</tr>
		<tr>
			<th width="120">회원아이디</th>
			<td><input type="text" name="id" style="width:200px"></td>
			<td rowspan="2" colspan="2" width="50"><input type="submit" value="로그인"></td>
		</tr>
		
		<tr>
			<th >비 밀 번 호</th>
			<td width="240"><input type="password" name="password" style="width:200px"></td>
		</tr>
		<tr><td colspan="3"><br></td></tr>
	</table>
	<table border="0" align="center" style="text-align:center">
		<tr>
			<td colspan="3" align="left">회원은 로그인 이후 마이페이지에서 반납송장등록 해주시면 됩니다. <br/>
				회원이 되시면 적립금/할인쿠폰 및 다양한 이벤트 할인혜택을 받으실수 있습니다.</td>
		</tr>
		<tr><td colspan="3"><br></td></tr>
		<tr>
			<td colspan="3" align="right"><a href="ViewPage/FindId.jsp">ID찾기 </a><a href="ViewPage/Findpw.jsp">비밀번호찾기 </a>
			<a href="/ProjectShare/signup.do">회원가입</a></td>
		</tr>
	</table>		
	</form>
</div>

</body>
</html>