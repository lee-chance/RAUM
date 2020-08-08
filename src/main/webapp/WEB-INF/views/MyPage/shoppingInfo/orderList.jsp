<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 내역 조회</title>
<style>
  table.type01 {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
  }
  table.type01.th, type01.td {
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
</head>
<body>
<table class = "type01">
	<colgroup>
		<col width="15%"><col width="*">
		<col width="15%"><col width="15%">
	</colgroup>
	<tbody>
		<tr>
			<td colspan="4"><span><input type = "text" name = "name" value = "${memberInfoManagement.name}" size = 5 readonly = "readonly" style = "font-size:15px">고객님의 쇼핑함입니다. 보유 포인트를 확인하실 수 있습니다.</span> </td>
		</tr>
		<tr>
			<td>최초가입일</td>
			<td colspan="3"><span><input type = "text" name = "join_date" value = "${memberInfoManagement.join_date}" size = 50 readonly = "readonly" style = "font-size:15px"></span></td>
		</tr>
		<tr>
			<td>사용가능한 포인트</td>
			<td><span><input type = "text" name = "total_point" value = "${memberInfoManagement.total_point}" size = 10 readonly = "readonly" style = "font-size:15px"></span>Point</td>
		</tr>
	</tbody>
</table>
		
<form name="chasefm" action="http://www.hdexp.co.kr/parcel/order_status_t.asp" method="post" style="margin:0px;">
<input name="INVOICE_NO" type="hidden" value="">
</form>
<hr>
<p>주문내역 조회</p>
<hr>
						<table class = "type09">
							<colgroup>
								<col width="20%">
								<col width="15%">
								<col width="*">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
								<col width="10%">
							</colgroup>
							<thead>
								<tr>
									<th bgcolor="#F2F2F2">주문일/주문번호</th>
									<th colspan="2" bgcolor="#F2F2F2">주문정보</th>
									<th bgcolor="#F2F2F2">금액</th>
									<th bgcolor="#F2F2F2">보증금</th>
									<th bgcolor="#F2F2F2">배송비</th>
									<th bgcolor="#F2F2F2">결제액/상태</th>
									<th bgcolor="#F2F2F2">후기작성</th>
								</tr>
										<c:forEach items = "${orderList}" var="dto">
								<tr>
									<td>${dto.order_time}</td>
									<td rowspan="2"><img src="http://192.168.0.80:8080/ProjectShare/${dto.productImage}" width="80" height="80"></td>
									<td>${dto.productName}</td>
									<td >${dto.productPrice}</td>
									<td >${dto.deposit}</td>
									<td >3000</td>
									<td>${dto.totalPrice}</td>
									<td ><a href="review_write.do?order_num=${dto.order_num}"><span style="color: #036; font-weight: bold;">${dto.write_review}</span></a></td>
								</tr>
								<tr>
									<td>${dto.order_num}</td>
									<td>${dto.productSize}사이즈&nbsp;/&nbsp;${dto.productQuantity}개</td>
									<td></td>
									<td></td>
									<td></td>
									<td><span style="font-weight: bold;">${dto.status}</span></td>
									<td></td>
								</tr>
								</c:forEach>
							</table>
					
</body>
</html>