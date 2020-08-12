<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a { text-decoration:none; color: black;}
h3 {
text-align:center;
}
table {
	margin:auto;
}
</style>
<meta charset="UTF-8">
<title>관리자 공지사항 등록</title>
</head>
<body>
	<h3>공지사항 등록</h3>
		<form action="notice_write.do" method="post">
			<table border="0">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" size="58"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea cols="50" rows="10" name="content"></textarea></td>
				</tr>	
				<tr>
					<td colspan="2" align="center"><input type="submit" value="등록하기">&nbsp;&nbsp;&nbsp;<a href="write_notice.do">목록보기</a></td>
				</tr>							
			</table>
		</form>
</body>
</html>