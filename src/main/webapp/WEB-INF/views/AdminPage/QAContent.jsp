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
<title>관리자 1:1 상담 답변 작성</title>
</head>
<body>
	<h3>1:1 상담 답변 작성 페이지</h3>
		<form action="admin_qna_update.do" method="post">
			<table id="noticeTable">
				<tr>
					<td><input type="hidden" name="seq" value="${admin_qna_content_view.seq }"></td>	
				</tr>
				<tr>
					<td style="font-size: 13px;">제목</td>			
					<td><input type="text" name="title" size="50" value="${admin_qna_content_view.title }" readonly="readonly"></td>
				</tr>
				<tr>
					<td style="font-size: 13px;">작성일</td>
					<td><input type="text" name="date" size="50" value="${admin_qna_content_view.date }" readonly="readonly"></td>
				</tr>	
				<tr>
					<td style="font-size: 13px;">상담 내용</td>
					<td colspan="2"><input type="text" name="content" style="width:355px; height:100px;" value="${admin_qna_content_view.content }" readonly="readonly"></td>
				</tr>
				<tr>
					<td></td>
					<td><hr></td>
				</tr>	
				<tr>
					<td style="font-size: 13px;">관리자 답변</td>
					<td colspan="2"><input type="text" name="answer" style="width:355px; height:100px;" value="${admin_qna_content_view.answer }" placeholder="답변을 작성해주세요."></td>
				</tr>		
				<tr>
					<td colspan="2"></td>
				</tr>					
				<tr>
					<td colspan="2" align="center"><input type="submit" value="답변 등록">&nbsp;&nbsp;&nbsp;<a href="/ProjectShare/adminQAList.do">목록보기</a></td>
				</tr>				
			</table>
		</form>
</body>
</html>