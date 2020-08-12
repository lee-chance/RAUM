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
<title>관리자 FAQ 수정</title>
</head>
<body>
	<h3>FAQ 수정</h3>
		<form action="FAQ_update.do" method="post">
			<table id="noticeTable">
				<tr>
					<td>번호</td>
					<td><input type="text" name="seq" size="5" value="${FAQ_content_view.seq }"></td>
				</tr>
				<tr>
					<td>항목</td>
					<td><select name='type'>
						  <option value='선택' selected>선택</option>					
						  <option value='회원정보'>회원정보</option>
						  <option value='취소/환불'>취소/환불</option>
						  <option value='영수증'>영수증</option>
						  <option value='배송'>배송</option>
						  <option value='기타'>기타</option>						  
						</select></td>
				</tr>	
				<tr>
					<td>제목</td>
					<td><input type="text" name="title" size="56" value="${FAQ_content_view.title }"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><input type="text" name="content" style="width:400px; height:100px;" value="${FAQ_content_view.content }"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정하기">&nbsp;&nbsp;&nbsp;<a href="write_FAQ.do">목록보기</a></td>
				</tr>				
			</table>
		</form>
</body>
</html>