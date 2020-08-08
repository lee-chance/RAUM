<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용 후기</title>
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
    width: 100px;
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
			<td colspan="4"><span><input type = "text" name = "name" value = "${list2.name}" size = 5 readonly = "readonly" style = "font-size:15px">고객님의 쇼핑함입니다. 보유 포인트를 확인하실 수 있습니다.</span> </td>
		</tr>
		<tr>
			<td>최초가입일</td>
			<td colspan="3"><span><input type = "text" name = "join_date" value = "${list2.join_date}" size = 50 readonly = "readonly" style = "font-size:15px"></span></td>
		</tr>
		<tr>
			<td>사용가능한 포인트</td>
			<td><span><input type = "text" name = "total_point" value = "${list2.total_point}" size = 10 readonly = "readonly" style = "font-size:15px"></span>Point</td>
		</tr>
	</tbody>
</table>
<h3>이용후기 관리</h3>
<p>고객님이 등록하신 이용후기 입니다.</p>
	
<br>

			<table class="type09">
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
									<td>${dlist.nickname}</td>
								</tr>
								<tr>
									<td>제목</td>
									<td>${dlist.title}</td> 
								</tr>
								<tr>
									<td>내용</td>
									<td>${dlist.content}</td>
								</tr>
								<tr>
									<td>조회수</td>
									<td>${dlist.view_count}</td>
								</tr>
								<tr>
									<td>등록된 시간</td>
									<td>${dlist.time}</td>
								</tr>
							</c:forEach>
							</tbody>							
						</table>
						
						
</body>
</html>