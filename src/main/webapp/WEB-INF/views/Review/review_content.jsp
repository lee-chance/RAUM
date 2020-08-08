<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#reviewContentTable.table, #reviewContentTable.tr, #reviewContentTable.td {	
	border: 1px solid #424242;
	border-collapse:collapse;	
	margin: auto;
}
h3, p {
	text-align: center;
}
td, tr{
	border: none;
}
#reviewContentTable.table {
    width: 700px;
   }
</style>
<meta charset="UTF-8">
<title>후기 내용</title>
</head>
<body>
	<h3><span style="color: red">대여후기</span></h3><br>
	
	
	<form action="/ProjectShare/reviewList.do" method="post">
		<table id="reviewContentTable" border="1" align="center">
			<tr>
				<td colspan="4" align="center" bgcolor="#F2F2F2"><span style="font-weight: bold;">${review_content_view.reviewTitle }</span></td><!--제목  -->
			</tr>
			<tr>
				<td align="left"><span style="font-weight: bold">상품명</span> ${review_content_view.productName }</td><!--상품명  -->
				<td align="left"><span style="font-weight: bold">작성자</span> ${review_content_view.userNickname }</td><!--작성자  -->
				<td align="right"><span style="font-weight: bold">작성일</span> ${review_content_view.reviewDate }</td><!--작성일  -->
				<td align="right"><span style="font-weight: bold">조회수</span> ${review_content_view.reviewCount }</td><!--조회수  -->
			</tr>
			<tr>
				<td colspan="4" align="center" height="200">${review_content_view.reviewContent }</td><!--내용 -->
			</tr>
			<tr >
				<td colspan="4" align="center"><input type="submit" value="목록으로" style="height:25px; width:100px;"></td><!--목록으로 -->
			</tr>		
		
		</table>
	</form>
</body>
</html>
