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
<title>관리자 FAQ 등록</title>
</head>
<body>
	<h3>FAQ 등록</h3>
		<form action="FAQ_write.do" method="post">
			<table border="0">
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
					<td><input type="text" name="title" size="58"></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea cols="50" rows="10" name="content"></textarea></td>
				</tr>	
				<tr>
					<td colspan="2" align="center"><input type="submit" value="등록하기">&nbsp;&nbsp;&nbsp;<a href="write_FAQ.do">목록보기</a></td>
				</tr>							
			</table>
		</form>
</body>
</html>