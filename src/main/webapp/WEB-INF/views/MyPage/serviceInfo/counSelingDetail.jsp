<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 table.type03 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
  margin : 20px 10px;
}
table.type03 th {
    width: 120px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
table.type03 td {
    width: 200px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
  
table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
    text-align: center
}
table.type09 tbody th {
    width: 1000px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 150px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    text-align: center
}
</style>
</head>
<body>

<table class = "type03">
	<colgroup>
		<col width="15%"><col width="*">
		<col width="15%"><col width="15%">
	</colgroup>
	<tbody>
		<tr>
			<td colspan="4"><span><input type = "text" name = "name" value = "${list2.nickname}" size = 5 readonly = "readonly" style = "font-size:15px">고객님의 쇼핑함입니다. 보유 포인트를 확인하실 수 있습니다.</span> </td>
		</tr>
		<tr>
			<td>최초가입일</td>
			<td colspan="3"><span><input type = "text" name = "join_date" value = "${list2.createdate}" size = 50 readonly = "readonly" style = "font-size:15px"></span></td>
		</tr>
		<tr>
			<td>사용가능한 포인트</td>
			<td><span><input type = "text" name = "total_point" value = "${list2.point}" size = 10 readonly = "readonly" style = "font-size:15px"></span>Point</td>
		</tr>
	</tbody>
</table>

<br>
<h3>1:1 친절 상담</h3>
<br>

고객문의가 많아질 경우 답변이 지연될 수 있으니 양해 부탁드리며 더욱 빠른 처리를 위해 더욱 노력하겠습니다.

<br>
						<table class = "type09">
							<colgroup>
								<col width="20%"><col width="*">
							</colgroup>
							<thead>
								<tr>
									<th>항목</th>
									<th>내용</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items = "${list}" var = "dlist">
								<tr>
									<td>닉네임</td>
									<td>${dlist.nickname}</td> <!-- 신경환 -->
								</tr>
								<tr>
									<td>상담내용</td>
									<td>${dlist.category}</td> 
								</tr>
								<tr>
									<td>제목</td>
									<td>${dlist.title}</td>
								</tr>
								<tr>
									<td>고객 질문 사항</td>
									<td>${dlist.content}</td>
								</tr>
								<tr>
									<td>질문에 관한 답변 사항</td>
									<td>${dlist.answer}</td>
							</c:forEach>
							</tbody>
		</table>
</body>
</html>