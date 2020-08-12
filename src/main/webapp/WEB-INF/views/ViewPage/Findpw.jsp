<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호찾기</title>
<style type="text/css">
#top {
	position: relative;
	width: 1280px;
	margin: 5px auto;
	padding-bottom: 30px;
}

#wrapper {
	width: 500px;
	margin: 0 auto;
}
</style>
<script type="text/javascript">
	function numKeyCheck(event) {
		var keyValue = event.keyCode;
		if (((keyValue >= 48) && (keyValue <= 57)))
			return true;
		else
			return false;
	}
	function checkEmpty() {
		if (findId.name.value == "") {
			alert("성명을 입력하세요");
			return false;
		} else if (findId.tel.value == "") {
			alert("연락처를 입력하세요");
			return false;
		} else
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
			<c:when test="${RESULT_PW == '0'}">
				<script type="text/javascript">
					alert("회원정보가 존재하지 않습니다.")
				</script>
			</c:when>
		</c:choose>
		<form action="/ProjectShare/findPw.do" name="findPw" method="post"
			onSubmit="return checkEmpty();">
			<table border="0" align="center" style="text-align: center">
				<tr>
					<td colspan="3"><img alt="비밀번호 찾기"
						src="http://www.ddaengshop.com/common/img/title_pass_find.gif"
						width="120"></td>
				</tr>
				<tr>
					<th>아이디</th>
					<td><input type="text" name="email" style="width: 200px"></td>
					<td rowspan="3"><input type="submit" value="찾기"></td>
				</tr>
				<tr>
					<th>성 &nbsp;&nbsp;&nbsp;명</th>
					<td><input type="text" name="name" style="width: 200px"></td>
				</tr>

				<tr>
					<th>연락처</th>
					<td><input type="text" name="tel1" id="tel1"
						onKeyPress="return numKeyCheck(event);" style="width: 55px">
						- <input type="text" name="tel2" id="tel2"
						onKeyPress="return numKeyCheck(event);" style="width: 55px">
						- <input type="text" name="tel3" id="tel3"
						onKeyPress="return numKeyCheck(event);" style="width: 55px">
					</td>
				</tr>
				<tr>
					<td colspan="3"><br></td>
				</tr>
			</table>
		</form>
		<table border="0" align="center" style="text-align: center">
			<tr>
				<td>해당 정보를 입력하시면 회원가입시 등록하신 <br /> 이메일 주소로 비밀번호 정보를 안내해드립니다.
				</td>
			</tr>
		</table>
	</div>
	
	<div id="footer">
		<%@ include file="/WEB-INF/views/CustomerService/footer.jsp"%>
	</div>
	
</body>
</html>