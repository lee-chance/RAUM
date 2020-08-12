<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용 후기</title>
<style>
  table.type01 {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  table.type01 th, table.type01 td {
    border-bottom: 1px solid #444444;
    padding: 10px;
  }
  
table.type09 {
	width: 100%;
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
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>

<table class = "type01">
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
<h3>이용후기 관리</h3>
<p class="point_text">고객님이 등록하신 이용후기 입니다.</p>

			<table class="type09">
							<colgroup>
								<col width="*"><col width="30%"><col width="10%">							
							</colgroup>
							<thead>
								<tr>
									<th>제목</th>
									<th>등록일자</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items = "${list}" var = "dto">
								<tr>
									<td><a href = "reviewListDetail.do?seq=${dto.seq}">${dto.title}</a></td>
									<td>${dto.writedate}</td>			
									<td>${dto.views}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>
</body>
</html>