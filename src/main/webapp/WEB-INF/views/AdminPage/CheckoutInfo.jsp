<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://code.jquery.com/jquery.min.js"></script>
<style type="text/css">

	img { 
	display: block;
	margin: 0px auto;
	padding: 10px}
	
	#header{
	padding : 5px;
	font-size : xx-large;
	}
	
	#updateBtn{ 
	border: 1px solid #2E2E2E; 
	background-color: rgba(0,0,0,0); 
	color: #2E2E2E; 
	padding: 5px; 
	border-radius:5px;
	width: 50px;
	margin-left: 10px;
	margin-right: 10px;s
	}


	select {
	  width: 150px;
	  padding: .2em .2em;
	  font-family: inherit;
	  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;  
	  -webkit-appearance: none;
	     -moz-appearance: none;
	          appearance: none;
	  border: 1px solid #999;
	  border-radius: 0px;
	}
	
	select::-ms-expand { /* for IE 11 */
	    display: none;
	}
	
</style>

<meta charset="UTF-8">
<title>회원 주문정보</title>

<script type="text/javascript">
	setTimeout(function(){
		test();
		},0)
		function test(){
			var html = '';
			$('#selectStatus').val('${CHECKOUT_DATA.statusSeq }').trigger('change');
			html = $('#selectStatus').val();
		}
</script>

</head>
<body>

	<table border="1" width="800" align="center">
	<colgroup>
		<col width="30%">
		<col width="*">
	</colgroup>
	<tr><td><img src="/RAUM/resources/image/${CHECKOUT_DATA.image}" width="80" height="80"></td><td> ${CHECKOUT_DATA.productName}</td></tr>
	
	<tr><th colspan="2" id="header">주문정보</th></tr>
	<tr><th>주문번호</th><td> ${CHECKOUT_DATA.seq }</td></tr>
	<tr><th>사용일</th><td> ${CHECKOUT_DATA.startDate }</td></tr>
	<tr><th>반납일</th><td> ${CHECKOUT_DATA.endDate }</td></tr>
	<tr><th>상태</th><td> ${CHECKOUT_DATA.status }</td></tr>
	<tr><th>결제방법</th><td> ${CHECKOUT_DATA.paymentMethod }</td></tr>
	<tr><th>입금자성함</th><td> ${CHECKOUT_DATA.paymentAccountName }</td></tr>
	<tr><th>요구사항</th><td> ${CHECKOUT_DATA.optional }</td></tr>
	
	<tr><th colspan="2" id="header">배송정보</th></tr>
	<tr><th>배송방법</th><td> ${CHECKOUT_DATA.receiveMethod }</td></tr>
	<tr><th>수령인</th><td> ${CHECKOUT_DATA.paymentName }</td></tr>
	<tr><th>주소</th><td> ${CHECKOUT_DATA.address }</td></tr>
	
	<tr><th colspan="2" id="header">반납정보</th></tr>
	<tr><th>반납방법</th><td> ${CHECKOUT_DATA.returnMethod }</td></tr>
	<tr><th>보증금반환계좌</th><td> ${CHECKOUT_DATA.account }</td></tr>
	<tr><th>반환계좌성함</th><td> ${CHECKOUT_DATA.depositAccountName }</td></tr>
	
	</table>
	
	<br/>
	<br/>
	<br/>
	
	<form action="statusAction.do" method="post">
	<table align="center">
	<tr>
	<td>
	<input type="hidden" value="${CHECKOUT_DATA.seq }" name="seq" size="5" />
	</td>
	<td>

	<select name="status" id="selectStatus">
		<option value="1">결제전</option>
		<option value="2">결제완료</option>
	</select>

	
	</td>
	<td>
	<input type="submit" id="updateBtn" value="변경" />
	</td>
	<td>
	<a href="/RAUM/adminCheckoutList.do">목록보기</a>
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