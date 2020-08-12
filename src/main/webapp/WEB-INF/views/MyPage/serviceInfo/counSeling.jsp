<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 친절상담</title>
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

div.button {
   margin: auto;
   width: 25%;
}

div.button input {
   padding: 5px;
   width: 50%;
   font-size: 18px;
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
			<td colspan="4"><span><input type = "text" name = "name" value = "${list.nickname}" size = 5 readonly = "readonly" style = "font-size:15px">고객님의 쇼핑함입니다. 보유 포인트를 확인하실 수 있습니다.</span> </td>
		</tr>
		<tr>
			<td>최초가입일</td>
			<td colspan="3"><span><input type = "text" name = "join_date" value = "${list.createdate}" size = 50 readonly = "readonly" style = "font-size:15px"></span></td>
		</tr>
		<tr>
			<td>사용가능한 포인트</td>
			<td><span><input type = "text" name = "total_point" value = "${list.point}" size = 10 readonly = "readonly" style = "font-size:15px"></span>Point</td>
		</tr>
	</tbody>
</table>		

<h3>1:1 친절상담 내역</h3>
<p>고객문의가 많아질 경우 답변이 지연될 수 있으니 양해 부탁드리며 더욱 빠른 처리를 위해 더욱 노력하겠습니다.</p>
<table class="type09">
							<colgroup>
								<col width="15%">
								<col width="*">
								<col width="30%">
								<col width="15%">
							</colgroup>
							<thead>
								<tr>
									<th>유형</th>
									<th>제목</th>
									<th>등록일자</th>
									<th>처리상태</th>
								</tr>
							</thead>
							<tbody>
							<c:forEach items = "${Qnalist}" var = "Qnadto">
								<tr>
									<td>${Qnadto.category}</td>
									<td><a href = "counSelingDetail.do?seq=${Qnadto.seq}">${Qnadto.title}</a></td>
									<td>${Qnadto.date}</td>			
									<td>${Qnadto.status}</td>
								</tr>
							</c:forEach>
							</tbody>
						</table>	
						<br>
						<div class="button">
						<input type="button" value="상담신청하기" onclick="location.href='/RAUM/writeCounseling.do'"/><br/>
						</div>
						
						
</body>
</html>

