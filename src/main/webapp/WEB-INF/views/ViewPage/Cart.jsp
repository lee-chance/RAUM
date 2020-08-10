<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style type="text/css">

#top{
	position:relative; 
	width:1280px; 
	margin:5px auto; 
	padding-bottom:30px;
	}

#wrapper
{
	width:1280px;
	margin:5px auto;
}
#images
img{
	vertical-align:middle;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function fnCheckAll(){	//전체선택 체크박스
	    $("input:checkbox[name=chk]").prop("checked",$("#checkAll").prop("checked"));
	}

	function deleteCart(i) {
		var conf = confirm('장바구니에서 삭제하시겠습니까?');
		if(conf == true) {
			location.href='deleteFromCart.do?sequences=' + i;
		}
		else if(conf == false) {
			return false;
		}
	}
	function deleteSelected() {	//선택상품 삭제
		var chked = document.getElementsByName("chk");
		var checkedLists = "";
		var count = 0;
		
		for(var i = 0; i < chked.length; i++) {
			if(chked[i].checked) {
				checkedLists += (i + 1) + ",";
				count++;
			}
		}		
		if(count == 0)
			return false;
		var conf = confirm('장바구니에서 삭제하시겠습니까?');
		if(conf == false) {
			return false;
		}
		else {
			location.href='deleteFromCart.do?sequences=' + checkedLists;
		}		
	}
	function rentChecked() {	//선택상품 대여
		var chked = document.getElementsByName("chk");
		var checkedLists = "";
		var dateArray = new Array();
		var count = 0;
		for(var i = 0; i < chked.length; i++) {
			if(chked[i].checked) {
				//대여일 저장
				var tr = chked[i].parentElement.parentElement;	
				var colDate = tr.cells[4].innerText;
				
				dateArray[count] = colDate;
				count++;
			
				//체크한 row 넘김
				var temp = (i + 1).toString();
				checkedLists += temp + ",";
			}
		}
		if(count == 0) {
			alert('선택된 상품이 없습니다.');
			return false;
		}
		else {
			var str = dateArray[0];
			for(var i = 0; i < count; i++) {	//대여일 비교	
				if(str != dateArray[i]) {
					alert("선택하신 상품의 대여일이 전부 같을 때에만 한 번에 대여하실 수 있습니다.\n대여일을 확인해주세요.");
					return false;
				}
				str = dateArray[i];
			}
		}
		location.href='cartToOrder.do?checkedLists=' + checkedLists; 		
	}
	function rentAll() {
		var chked = document.getElementsByName("chk");
		var checkedLists = "";
		var dateArray = new Array();
		for(var i = 0; i < chked.length; i++) {
			var tr = chked[i].parentElement.parentElement;
			var colDate = tr.cells[4].innerText;
			
			dateArray[i] = colDate;
			
			var temp = (i + 1).toString();
			checkedLists += temp + ",";
		}
		if(chked.length == 0)
			return false;
		else {
			var str = dateArray[0];
			for(var i = 0; i < chked.length; i++) {
				if(str != dateArray[i]) {
					alert("선택하신 상품의 대여일이 전부 같을 때에만 한 번에 대여하실 수 있습니다.\n대여일을 확인해주세요.");
					return false;
				}
				str = dateArray[i];
			}
		}
		location.href='cartToOrder.do?checkedLists=' + checkedLists;
	}
	function rentThisProduct(i) {	//바로대여		
		location.href='rentThis.do?sequence=' + i;
	}
</script>
</head>
<body>

<div id="top">
	<%@ include file="/WEB-INF/views/CustomerService/Top.jsp"%>
</div>
	
<div id="wrapper">
	<img alt="사진로딩실패" src = "http://www.ddaengshop.com/common/img/step01.png" width="100%">
	<h3>장바구니(${cartList.size()}개)</h3>
	<table border="1" width="100%" style="border-collapse:collapse">
		<tr style="text-align:center;">
			<td><input type="checkbox" name="checkAll" id="checkAll" onClick="fnCheckAll();"></td>
			<td colspan="2">상품명/선택사항</td>
			<td>수량</td>
			<td>대여 및 사용일자</td>
			<td>배송비</td>
			<td>대여금액</td>
			<td>대여</td>
		</tr>
		<c:set var="sum" value="0"/>
		<c:forEach items="${cartList}" var="dto" varStatus="status">
			<tr>
				<td style="text-align:center"><input type="checkbox" name="chk"></td>
				<c:forEach items="${productInfo}" var="dtoProduct" begin="${status.index}" end="${status.index}" varStatus="pStatus">
					<td style="border-right:none"><img src="http://192.168.0.80:8080/RAUM/resources/images/${dtoProduct.image}" width="60" height="60"></td>
					<td width="340" style="border-left:none"><a href="/ProjectShare/MainProductDetail.do?product_num=${dtoProduct.product_num}">${dtoProduct.name}</a>
					<br>${dto.size}</td>			
				</c:forEach>
				<td style="text-align:center">${dto.qty}개</td>
				<td><%-- 사용일 ${dto.startDate}~${dto.endDate}<br> --%>대여일 ${dto.startDate}~${dto.endDate}</td>
				<c:if test="${status.index eq 0}">
					<td rowspan="${cartList.size()}" style="text-align:center">3,000원</td>
				</c:if>				
				<c:forEach items="${productInfo}" var="dtoProduct" begin="${status.index}" end="${status.index}" varStatus="pStatus">
					<td style="text-align:center">${(dtoProduct.price + (dto.rentDay - 1) * 1000)*(dto.qty)}원</td>
					<c:set var="sum" value="${sum + (dtoProduct.price + (dto.rentDay - 1) * 1000)*(dto.qty)}"/>		
				</c:forEach>						
				<td style="text-align:center"><input type="button" value="바로대여" 
					onClick="rentThisProduct(${dto.seq});">
					<br><input type="button" value="삭제" onClick="deleteCart(${dto.seq});"></td>
			</tr>
		</c:forEach>
		<tr style="text-align:right">
			<td colspan="8">총 대여금액 <c:out value="${sum}"/>원 + 배송비 3,000원 = 총 결제금액 : ${sum + 3000}원</td>		
		</tr>
	</table>
	<input type="button" value="선택상품 삭제" onClick="deleteSelected();">
	<div style="float: right;">
	<input type="button" value="쇼핑계속하기" onClick="location.href='MainProductList.do'">
	<input type="button" value="선택상품 대여" name="btnRentChecked" id="btnRentChecked" onClick="rentChecked();">
	<input type="button" value="전체상품 대여" name="btnRentAll" onClick="rentAll();">
	</div><br><br><br><br>
	<img src="http://www.ddaengshop.com/common/img/tit_basket_take.gif" alt="장바구니"/>

	<table border="1" style="border-collapse:collapse;" width="100%">
		<colgroup>
			<col width="20%"/><col width="*"/>
		</colgroup>
		<tbody>
			<tr>
				<td style="padding:4px;">한상품 주문</td>
				<td style="padding:4px;">한 상품만 주문하시려면 아래 [바로대여] 버튼을 눌러 주세요.</td>
			</tr>
			<tr>
				<td style="padding:4px;">개별상품 주문</td>
				<td style="padding:4px;">원하시는 제품 좌측에 체크박스 선택 후 하단에 [선택상품대여] 버튼을 눌러 주세요.</td>
			</tr>
			<tr>
				<td style="padding:4px;">결제방법 및 할인</td>
				<td style="padding:4px;">신용카드, 실시간계좌이체, 무통장입금, 쿠폰할인, 보유 적립금 할인</td>
			</tr>
			<tr>
				<td style="padding:4px;">배송비</td>
				<td style="padding:4px;">안전하고 빠른 우체국택배로 기본배송비는 3,000원으로 모든 제품이 묶음 상품입니다.(묶음불가상품은 따로 표기 됩니다.)</td>
			</tr>
			<tr>
				<td style="padding:4px;">계속쇼핑</td>
				<td style="padding:4px;"><span class="fb">[쇼핑계속하기]</span> 버튼을 누르면 상품 화면으로 돌아갑니다.</td>
			</tr>
		</tbody>
	</table><br>
</div>

</body>
</html>