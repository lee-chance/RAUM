<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
  table.type01 {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  table.type01 th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
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
<title>포인트 / 사용내역</title>
</head>
<body>

<table class = "type01">
	<colgroup>
		<col width="15%"><col width="*">
		<col width="15%"><col width="15%">
	</colgroup>
	<tbody>
		<tr>
			<td colspan="4"><span>"접속한 고객의 이름"</span>고객님의 쇼핑함입니다. 보유 포인트를 확인하실 수 있습니다.</td>
		</tr>
		<tr>
			<td>최초가입일</td>
			<td colspan="3"><span>"최초 가입일 입력"</span></td>
		</tr>
		<tr>
			<td>사용가능한 포인트</td>
			<td><span>"해당 고객의 포인트 입력"</span>Point</td>
		</tr>
	</tbody>
</table>

<h3>포인트 / 사용내역</h3>
<p>고객님의 포인트적립 및 사용내역입니다.</p>
	`		<table class="type09">
							<colgroup>
								<col width="10%"><col width="*">
								<col width="15%"><col width="15%">
							</colgroup>
							<thead>
								<tr>
									<th>일자</th>
									<th>상세내역</th>
									<th>포인트적립</th>
									<th>사용포인트</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td colspan="4">사용가능한 포인트가 없습니다.</td>
								</tr>
							</tbody>
						</table>
</body>
</html>