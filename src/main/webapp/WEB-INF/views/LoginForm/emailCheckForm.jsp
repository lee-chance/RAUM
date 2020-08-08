<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이메일 중복체크</title>
</head>
<body>
	<div style="text-align: center">
	<h3>이메일 중복확인</h3>
	<form action="/ProjectShare/check.do" method="post" onsubmit="return blankCheck(this)">
	이메일 : <input type="text" name="email" maxlength="30" autofocus>
			<input type="submit" value="중복확인">
	</form>
	</div>
	
	<script type="text/javascript">
	function blankCheck(f){
		var email = f.email.value;
		email = email.trim();
		if(email.length == 0) {
				alert("이메일을 입력해주세요.");
			return false;
		}
		return true;
	}
	</script>

</body>
</html>