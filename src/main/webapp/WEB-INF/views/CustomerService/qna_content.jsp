<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a { text-decoration:none; color:#000000}
a:hover{text-decoration:underline}
#qnaTable, #qnaTable.tr, #qnaTable.td {	
	border: 1px solid black;
	border-collapse:collapse;	
	margin: auto;
}
h3, p {
	text-align: center;
}
td, tr{
	border-left: none;
	border-right: none;
}
#qnaTable {
    width: 600px;
   }
   #footer {
position: absolute;
bottom: 0;
width: 100%;

}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>FAQ 내용</h3>
		<form action="qna.do" method="post">
			<table id="qnaTable" border="1">
				<tr>
					<td bgcolor="#F2F2F2" style="text-align: center">${qna_content_view.title }</td>
				</tr>
				<tr>
					<td height="100" style="text-align: center">${qna_content_view.content }</td>
				</tr>	
				<tr>
					<td align="center"><input type="submit" value="목록으로"></td>
				</tr>				
			</table>
		</form>

</body>
</html>