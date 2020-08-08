<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
a { text-decoration:none; color:#000000}
a:hover{text-decoration:underline}
#noticeTable, #noticeTable.tr, #noticeTable.td {	
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
#noticeTable {
    width: 600px;
   }
</style>
<meta charset="UTF-8">
<title>공지사항 내용</title>
</head>
<body>
	<h3>공지사항</h3>
		<form action="noticeList.do" method="post">
			<table id="noticeTable" border="1">
				<tr>
					<td bgcolor="#F2F2F2">${content_view.title }</td>
					<td bgcolor="#F2F2F2" style="text-align: right">${content_view.writeDate }</td>
				</tr>
				<tr>
					<td colspan="2" height="100" style="text-align: center">${content_view.content }</td>
				</tr>	
				<tr>
					<td colspan="2" align="center"><input type="submit" value="목록으로"></td>
				</tr>				
			</table>
		</form>
</body>
</html>