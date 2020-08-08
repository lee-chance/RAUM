<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">

	img { 
	display: block;
	margin: 0px auto;
	padding: 10px}
	
	#header{
	padding : 5px;
	font-size : xx-large;
	}
	
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border="1" width="800" align="center">
	<colgroup>
		<col width="30%">
		<col width="*">
	</colgroup>
	<tr><td><img src="http://192.168.0.80:8080/ProjectShare/${CHECKOUT_DATA.product_image}" width="80" height="80"></td><td> ${CHECKOUT_DATA.product_name}</td></tr>
	
	<tr><th colspan="2" id="header">주문정보</th></tr>
	<tr><th>주문번호</th><td> ${CHECKOUT_DATA.order_num }</td></tr>
	<tr><th>주문자이메일</th><td> ${CHECKOUT_DATA.user_email }</td></tr>
	<tr><th>사용일</th><td> ${CHECKOUT_DATA.start_date }</td></tr>
	<tr><th>반납일</th><td> ${CHECKOUT_DATA.end_date }</td></tr>
	<tr><th>상태</th><td> ${CHECKOUT_DATA.status }</td></tr>
	<tr><th>결제방법</th><td> ${CHECKOUT_DATA.payment_method }</td></tr>
	<tr><th>입금자성함</th><td> ${CHECKOUT_DATA.depositor }</td></tr>
	<tr><th>요구사항</th><td> ${CHECKOUT_DATA.request1 }</td></tr>
	
	<tr><th colspan="2" id="header">배송정보</th></tr>
	<tr><th>배송방법</th><td> ${CHECKOUT_DATA.receive_method }</td></tr>
	<tr><th>수령인</th><td> ${CHECKOUT_DATA.checkout_name }</td></tr>
	<tr><th>주소</th><td> ${CHECKOUT_DATA.checkout_address }</td></tr>
	<tr><th>수령인이메일</th><td> ${CHECKOUT_DATA.checkout_email }</td></tr>
	
	<tr><th colspan="2" id="header">반납정보</th></tr>
	<tr><th>반납방법</th><td> ${CHECKOUT_DATA.return_method }</td></tr>
	<tr><th>보증금반환계좌</th><td> ${CHECKOUT_DATA.return_account }</td></tr>
	<tr><th>반환계좌성함</th><td> ${CHECKOUT_DATA.return_depositor }</td></tr>
	
	</table>
	
	<br/>
	<br/>
	<br/>
	
	<form action="statusAction.do" method="post">
	<table align="center">
	<tr>
	<td>
	<input type="text" value="${CHECKOUT_DATA.order_num }" name="order_num" readonly="readonly" size="5" />
	</td>
	<td>
	<select name="status">
		<option value="0">상태변경</option>
		<option value="1">결제전</option>
		<option value="2">배송준비중</option>
		<option value="3">배송중</option>
		<option value="4">배송완료</option>
		<option value="5">반납완료</option>
		<option value="6">보증금미확인</option>
		<option value="7">주문취소</option>
	</select>
	</td>
	<td>
	<input type="submit" value="변경" />
	</td>
	<td>
	<a href="/ProjectShare/adminCheckoutList.do">목록보기</a>
	</td>
	</tr>
	</table>
	</form>
	
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	
</body>
</html>