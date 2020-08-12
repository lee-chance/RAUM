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
<title>관리자 공지사항 수정</title>
</head>
<body>
	<h3>공지사항 수정</h3>
		<form action="notice_update.do" method="post">
			<table id="noticeTable">
				<tr>
					<td>번호</td>
					<td><input type="text" name="seq" size="5" value="${notice_content_view.seq }"></td>
				</tr>
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" size="50" value="${notice_content_view.title }"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" name="content" style="width:355px; height:100px;" value="${notice_content_view.content }"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정하기">&nbsp;&nbsp;&nbsp;<a href="write_notice.do">목록보기</a></td>
				</tr>				
			</table>
		</form>
</body>
</html>