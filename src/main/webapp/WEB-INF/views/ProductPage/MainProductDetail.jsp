<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<!--  datePicker -->
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script>
    $(function () {
        $("#datepicker").datepicker({
            onSelect:function(d){
            	var newdate = new Date(d);
            	newdate.setDate(newdate.getDate() - 1);
            	var nd = new Date(newdate);
            	
            	/*날짜 구하기*/
                var year = nd.getFullYear();
                var month = nd.getMonth()+1
                var day = nd.getDate();
                if(month < 10){
                    month = "0"+month;
                }
                if(day < 10){
                    day = "0"+day;
                }
             
                var newDate = year+"-"+month+"-"+day;
            	

                $("#day1").text(newDate);
            },
            dateFormat:"yy-mm-dd"
        });
        $("#datepicker2").datepicker({
            onSelect:function(d){
            	var newdate = new Date(d);
            	newdate.setDate(newdate.getDate() + 1);
            	var nd = new Date(newdate);
            	
            	/*날짜 구하기*/
                var year = nd.getFullYear();
                var month = nd.getMonth()+1
                var day = nd.getDate();
                if(month < 10){
                    month = "0"+month;
                }
                if(day < 10){
                    day = "0"+day;
                }
             
                var newDate = year+"-"+month+"-"+day;

                $("#day2").text(newDate);
            },
            dateFormat:"yy-mm-dd"
        });
        
    });
    
    </script>

<script type="text/javascript">
	function addItem() {
	    var sdd = document.getElementById("datepicker").value;
	    var edd = document.getElementById("datepicker2").value;
	    var ar1 = sdd.split('-');
	    var ar2 = edd.split('-');
	    var da1 = new Date(ar1[0], ar1[1], ar1[2]);
	    var da2 = new Date(ar2[0], ar2[1], ar2[2]);
	    var dif = da2 - da1;
	    var cDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨

	    if(isNaN(parseInt(dif/cDay))){
	    	alert("대여일을 선택해주세요.");
	    	return;
	    }
	    
	    var productPrice = document.getElementById("product_price").value;
	    var qty = document.getElementById("qty").value;

	    document.getElementById("rental_days").value = parseInt(dif/cDay);
	    document.getElementById("resultSum").value = (parseInt(productPrice) + (parseInt(dif/cDay) * 1000)) * qty;
	}
</script>

<style type="text/css">
#day1, #day2{
	font-size: 20px;
}

li {
	margin-right: 5px;
	list-style: none;
	padding-auto: 0px;
} /* margin-left : 5px; */
ul {
	display: block;
}

table#MainProductDetail th, table#MainProductDetail td {
	padding: 10px;
	margin: 5px;
}

* {
	font-size: 16px;
	font-family: Consolas, sans-serif;
}
</style>
<meta charset="UTF-8">
<title>제품 상세 페이지(Form)</title>
</head>
<body>
	<div border="1" width="1240" hieght="3000" align="center">
	<form action="cartOrCheckout.jsp" method="get">
		<div align="center">
			<!-- <div name="detail" width="1240" hieght="792"> -->
			<!-- <ul>
							<li style="float:left;" border="1"  hieght="651.5" colspan="15" ><img src="http://www.ddaengshop.com/_goods_img/2019-01/119_2_1546921683.jpg"></li>
						</ul> -->
			<!-- width="435" -->
			<table id="MainProductDetail" width="1240" hieght="800">
				<tr>
					<td rowspan="16"><img
						src="http://192.168.0.80:8080/RAUM/resources/image/${productDetail.image }"
						width="450" height="600"></td>
				</tr>
				<tr>
					<td>상품번호</td>
					<td>${productDetail.seq }<input type="hidden" name="product_num" value="${productDetail.seq }"></td>
				</tr>

				<tr>
					<td>카테고리</td>
					<td>${productDetail.category }</td>
				</tr>

				<tr>
					<td>상품이름</td>
					<td>${productDetail.name }</td>
				</tr>

				<tr>
					<td>대여가격</td>
					<td>${productDetail.price }<input type="hidden" id="product_price" value="${productDetail.price }"></td>
				</tr><!-- 

				<tr>
					<td>포인트</td>
					<td>로그인 후 할인 쿠폰 조회가 가능합니다.</td>
				</tr> -->

				<tr>
					<td>대여혜택</td>
					<td>50p 적립(원)</td>
				</tr>

				<tr>
					<td>배송료</td>
					<td>3000원</td>
				</tr>

				<tr>
					<td colspan="3"><img
						src="http://www.ddaengshop.com/common/img/guide_01.jpg"></td>
				</tr>

				<tr>
					<td>사이즈</td>
					<td><select name="size" id="size">
							<c:forEach var="i" begin="230" end="300" step="5">
								<option value="${i}">${i}</option>
							</c:forEach>
					</select></td>
				</tr>

				<tr>
					<td>개수</td>
					<td><input id="qty" type="number" min="1" step="1" value="1" name="qty">
					</td>
				</tr>

				<tr>
					<td>행사일 선택</td>
					<td>   
					<input type="text" id="datepicker" name="start_date" placeholder="대여시작일"> ~ <input type="text" id="datepicker2" name="end_date" placeholder="대여종료일">
					<!-- <td><input type="date" name="datepicker1" id="dat1">  ~  <input type="date" name="datepicker2" id="dat2"></td> -->
				</tr>
<!-- 				<tr>
					<td>행사일 추가</td>
					<td><input type="number" min="1" step="1" value="1"
						name="rental_days"> <span>일</span></td>
					<input type="text" class="" title="" value="1" name="cnt_data" id="multiNum" onblur="multi_qty_change( 1,this.value);" readonly="" placeholder="1" maxlength="1/">
											<a href="javascript: up_cnt(1, '11000');" style="top:8px; left:66px;"><img src="http://ddaengshop.com/common/img/btn_up.gif"></a>
											<a href="javascript: up_cnt(2, '11000')" style="top:20px; left:66px;"><img src="http://ddaengshop.com/common/img/btn_down.gif"></a>
				</tr> -->

				<tr>
					<td>대여일</td>
					<td>
					<span id="day1">제품도착일</span>  ~  <span id="day2">반납처리일</span>
					<input type="hidden" id="day11" name="rent_start">
					<input type="hidden" id="day22" name="rent_end">
					</td>
				</tr>
				
				<tr>
					<td>총 대여금액</td>
					<td>
						<input type="button" id="addButton" onclick="addItem();" value="확인">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="text" id="resultSum" name="resultSum" value="금액" readonly="readonly">
						<input type="hidden" id="rental_days" name="rental_days"> 
					</td>
				</tr>
				
				<tr>
					<td colspan="2"><hr></td>
				</tr>

				<tr>
					<td></td>
					<td>
							<input type="submit" name="coc" value="장바구니">
							<input type="submit" name="coc" value="대여하기">
					</td>
				</tr>
			</table>
		</div>

		<div style="display: block;">
			<a href="#"><h1>상품추천</h1></a>
		</div>
		<!-- 리뷰 -->
		<div style="display: block;">
			<a href="#"><h1>리뷰가 들어갈 자리</h1></a>
		</div>

		<div class="button">
			<!-- 상품 상세 정보 -->
			<a href="#">제품상세정보 버튼</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">대여가이드
				버튼</a>
			<!-- 대여가이드 -->
		</div>

		<!-- 상품 상세 정보 -->
		<div style="display: block;">
			<td>
			<img src="http://192.168.0.80:8080/RAUM/resources/image/${productDetail.image }" width="675" height="900">
			</td>
		</div>
		<div style="display: block;">
			<td><p>${productDetail.information }<p></td>
		</div>

		<!-- 대여가이드 -->
		<div>
			<table width="1240" align="center">
				<p>상품 대여 가이드</p>
				<tr style="display: block;">
					<td><img
						src="http://www.ddaengshop.com/common/img/guide_img.png"></td>
				</tr>
				<tr>
					<td>접수 및 결제안내<br> 1. 홈페이지를 통한 회원전용 대여 서비스를 기본으로 합니다. 라움에서
						가능한 대금결제방법은 온라인 입금(무통장) 결제, 신용카드 결제, 적립금결제 입니다.<br> - 라움은
						선불결제를 원칙으로 합니다. 결제가 완료되어야 제품이 출고됩니다. (관공서, 학교는 관련서류를 제출해 주시면 후불결제
						가능)<br> - 결제에 필요한 서류를 원하는 단체(ex: 학교, 관공서 등)는 미리 서류발행을 요청하셔서
						의상수령에 번거로움이 없도록 해주세요.<br> - 의상비와 보증금 탁송비 (당일배송이나 고객사정으로 인한
						탁송을 원하실 경우 발생되는 금액)가 결제되시 않을시 제품발송은 이루어지지 않습니다.<br> - 결제는 수령일
						3~4일 전 입금되어야 하며 수령일 1~2일 전 입금은 배송준비시간 부족으로 인하여 배송지연될 수 있습니다. 고객의
						결제지연으로 발생하는 어떠한 책임도 라움에서 지지 않습니다.<br> - 계좌이체시 주문자와 입금자명이 달라
						주문자의 입금확인이 어려울경우 배송이 이루어지지 않으며, 이 경우 라움에 책임을 물을 수 없습니다.<br> -
						입금계좌는 사이트에 공지된 계좌를 이용해주셔야하며 그 외 계좌로 송금하셨을 경우 의상이 발송되지 않으며 이에 대한
						책임은 라움에서 책임지지 않습니다.<br> - 입금은 대여료와 보증금을 한꺼번에 입금해주셔야하며 카드결제의
						경우 보증금은 별도로 송금해주셔야 합니다. 보증금 미 입금시 의상 배송이 되지않습니다.<br> 2. 전화,
						문자, 이메일 팩스를 통한 주문 서비스는 제공하지 않습니다.<br> 3. 관공서 및 학교는
						필요서류(사업자등록증 or 고유번호증)라움 이메일(master@ddaengshop.com)로 제출시 면제 가능합니다.<br>
						4. 라움의상점의 모든 상품은 기본 2박3일 / 1회 대여가 기본입니다. 연장시 추가 사용료가 발생합니다.<br>
						- 주문시 연장요청을 한 경우 하루당 기본대여료의 20%가 추가됩니다.<br> - 주문후 연장요청을 한 경우
						하루당 기본대여료의 40%가 추가됩니다.<br> - 사용후 반납이 연체된 경우 하루당 기본대여료의 40%가
						추가됩니다.<br> - 근무시간외 반납이 된 경우 하루당 기본대여료의 40%가 추가됩니다.<br> -
						택배신청을 하였지만 택배기사가 수거를 안 한경우 또는 택배사가 신청을 늦게 처리하는 경우에도 하루당 기본 대여료의
						40%가 추가됩니다.<br> - 반납 독촉 전화를 별도로 드리지 않습니다. 연체가 된 경우 보증금에서 차감
						또는 추가금을 청구합니다.
					</td>
				</tr>
				<tr>
					<td>배송/반납안내<br> 1. 라움은 평일기준 오후3시 주문건까지 당일발송 해드립니다.(토,
						일요일은 택배발송이 안됩니다! )<br> - 새벽시간 또는 근무시간외에 급한 주문 및 결제후에 독촉하셔도
						토,일 휴무에는 택배발송 안되기에 이점 주의하시길 바랍니다.<br> 2. 모든상품은 묶음배송 택배로 발송
						처리해드리며 선불택배비 3,000원 발생됩니다. 반납은 직접 지불하셔야 합니다. 단, 퀵 이나 고속버스 화물로 받길
						원하시는 경우 추가 요금이 발생될 수 있습니다.<br> 3. 금요일 발송껀 즉 토요일 도착해야 하는 주문(일,
						월요일 사용하시는분)에 한에서는 문자로 알려드린 택배 운송장번호를 토요일 오전 9시전에 인터넷으로 배송조회하여 당일
						배송 가능 여부를 직접 확인하시길 바랍니다. 배송기사 연락처가 나온다면 토요일 배송 처리되며 배송기사 연락처가 없을 시
						당일 배달 안 할 가능성이 높기에 반드시 해당 택배영업소에 전화해서 확인하셔야 합니다.<br> 4. 직접/
						퀵서비스/ 화물 반납시 영업시간 내에 수령과 반납을 부탁 드립니다.<br> 5. 반납택배를 보내실 때에는
						가까운 우체국이나 일반택배회사에 직접 가셔서 발송해주셔야 하며 착불금지 입니다. 만약 착불로 보낼시 착불요금에 상관없이
						7,000원 보증금에서 차감처리됩니다.<br> (반납처리해야하는날이 휴일인 경우도 편의점택배로 접수가능하며
						힘드시다면 휴일다음인 평일에 꼭 우체국택배로 반납해주시면 연체료없이 처리됩니다.)<br> 6. 직접 택배발송이
						어려우신 경우 2~3일전에 미리 반납택배예약을 택배회사에 하셔서 보내주셔야 합니다. 택배회사의 사정으로 택배발송이 안된
						경우에도 연체료가 부가됩니다.<br> 7. 택배마감시간 전에 택배로 발송해주셔야 합니다.<br> 8.
						편의점택배로 발송해주실때 반값택배금지 입니다. 이를 어길시 연체료와 편의점으로 찾으러가는 비용 만원청구됩니다.<br>
						9. 택배수거 선택시 우체국 5호박스 기준이며 1박스 초과시 7,000원 보증금에서 차감 후 진행됩니다. (예 :
						3박스 수거반납시 보증금에서 14,000원차감) 택배수거는 대여 마지막날 택배기사님이 미리 전화로 연락드리고 방문수거
						하기 때문에 전화를 못 받을 경우 수거가 어려우니 통화가능한 연락처와 수거제품 보관장소를 배송 시 요청사항에 꼭
						남겨주셔야 합니다.(대여마지막날이 주말 및 공휴일인 경우 에는 돌아오는 평일에 수거됩니다.) 수거신청하였는데 통화가
						안되었거나 제품이 택배기사님께 정상인계가 되지 않아 수거신청이 취소되었을 경우 재신청이 안되므로 고객님께서 직접 가까운
						우체국 또는 편의점택배로 반납해주셔야 됩니다. 수거신청비용은 라움고객센터(☎1833-7507)로 문의주시면 보증금 환급
						시 환급처리해드립니다.<br> 반납 주소 : 충북 청주시 흥덕구 대신로 10번길 5-8 은하수빌딩 3층 라움<br>
						연 락 처 : ☎공칠공-5220-0044 ※번호주의 010 아닙니다!<br> ★ “가장중요”<br>
						반납처리후 꼭 마이페이지 택배사명과 운송장번호를 등록해주시길 바랍니다.<br> 반납처리하는날 23시 59분까지
						라움 홈페이지 마이페이지에서 등록 안할시<br> 반납처리 안한것으로 처리되어 보증금에서 차감처리 되오니 이점
						꼭 유의바랍니다!!!
					</td>
				</tr>
				<tr>
					<td>사용시 주의사항<br> 1. 본상품은 대여의상이므로 부분적인 오염이나 훼손된곳이 있을수
						있습니다.<br> - 각자의 컴퓨터 해상도의 차이로 인해 색상이 사진과 다소 차이가 있을수 있으며 이러한
						부분적인 오염, 의상의 사용된흔적(올이풀려있거나 작은구멍이나 생활기스등)과 색상으로 인한 환불과 반품요청은
						되지않습니다.<br> 2.대여상품은 수령 즉시 이상유무를 확인해 주세요. 문제가 발생시 상담센터로 연락
						바랍니다.<br> - 제품도착당일(운송장 조회) 제품이상유무에 대한 고객의 연락없을시 제품의 문제가 없는것으로
						판단하고 있습니다.<br> 3. 파손/ 분실/ 수선/ 세탁비 발생시 배상비용을 청구하오니 이점 반드시 유의
						해주시길 바랍니다.<br> 4. 테이프를 사용하지 마세요. 의상에 본드로 인한 끈적임이 남아 대여가
						불가능합니다.<br> 5. 임시로 고정하신 핀, 시침 등은 원상태로 제거해서 반납해주셔야 합니다.<br>
						6. 사용하다 단추, 소품 등은 부속품이 떨어진 경우 꼭 반납시 동봉 부탁드립니다.<br> - 코스프레
						소품같은경우 케릭터에 꼭 필요할수있기때문에 분실시 비용이 청구됩니다.<br> 7. 코스프레 가발등은 고대기,
						히팅기 사용 금지입니다.<br> 8. 그밖에 계란, 밀가루, 컬러스프레이, 피(혈액), 염색약, 컷트한
						짧은머리카락(미용실), 음식물 오염등등 원상복구 비용이 청구됩니다.
					</td>
				</tr>
				<tr>
					<td>취소 및 환불정책<br> 1. 모든 예약의 취소, 환불은 고객센터 ☎ 1833-7507를 통하여
						접수하실수있습니다.<br> 2. 대여상품의 특성상 단순 변심 또는 행사일 변경 취소에 대한 환불은 불가하오니
						신중한 주문 부탁드립니다.<br> 3. 상품이 발송된 경우 취소, 교환, 환불은 불가합니다.<br>
						4. 대여상품을 예약하시면 예약된 상품은 그 기간 내 다른 고객께서 예약주문을 하실 수 없게 됩니다.<br>
						또한 고객님의 행사에 차질이 없이 대여를 해드리기 위해 업무진행이 이루어졌기에 취소 시 규정에 따라 환불이
						이루어집니다.<br> 대여주문을 취소하실 경우는 아래와 같이 환불해 드립니다.<br> 보증금만
						입금하셨을 경우<br> - 보증금 0% 환불<br> 대여금액(보증금을 포함)을 전부 입금 하셨을 경우<br>
						- 행사일 10일 이전에 취소시: 보증금을 제외한 금액 100% 환불<br> - 행사일 9일~7일전에 취소시:
						보증금을 제외한 금액 80% 환불<br> - 행사일 6일~4일전에 취소시: 보증금을 제외한 금액 50% 환불<br>
						- 행사일 3일전~상품 발송시: 보증금을 제외한 금액 0% 환불 (보증금만 반환)<br> 보증금은 입금 후
						취소 시 전액 반환되지 않습니다.<br> 당일 주문 예약하여 입금 후 당일 주문취소 시에도 의상대여비용은 전액
						반환되지 않습니다.<br> 자연재해, 천재지변, 날씨로 인하여 상품 발송 후 행사가 취소될 경우에도 환불은
						되지 않습니다.
					</td>
				</tr>
				<tr>
					<td>버스 탁송 운임표<br> 1. 버스탁송은 당일 2~3시간안에 급하게 제품을 받아보시려는 분들에게
						꼭 필요한 서비스입니다.버스탁송 예약후 취소 및 변경은 전화(☎1833-7507)만 가능합니다.<br> 라움의
						제품은 충북 청주에서 배송되는관계로 배송거리가 있으신 분들은 버스탁송으로 받아보셔도 괜찮습니다.<br> 고객님
						집으로 배송되는것이 아니라 고객님의 지역에 위치한 시외버스터미널로 제품이 가는것이기에 도착예정시간에 맞춰서 제품을
						찾으러 가셔야 됩니다.<br> 각지역 버스터미널 소화물센터에서는 택배를 보관해주지 않습니다. 늦게 찾으러가셔서
						제품이 분실되는경우 고객님이 책임을 지셔야 되기때문에 이점 유의해주시길 바랍니다.<br> 2. 배송출발할때
						아래 이미지처럼 관련 정보를 보내드립니다. 버스도착 예정시간 5분전까지 미리 가셔서 손님내리는 하차장에서 버스에서
						직접화물 수령하시면 됩니다. 만약 시간안에 도착이 어렵다면 미리 해당터미널 수화물센터에 연락하셔서 제품수령 장소 및
						가능 시간을 확인하시기 바랍니다. 수화물센터 연락처는 해당 터미널 대표번호로 문의 부탁드리며 해당 시외, 고속 터미널
						연락처는 인터넷으로 확인하시면 됩니다.<br> <img
						src="http://www.ddaengshop.com/common/img/guide_1.jpg"
						align="left"></td>
				<tr>
					<td>3. 라움에서 출발가능한 버스탁송 운행노선 및 시간 확인하기 클릭
						(http://cjterminal.com) 라움은 당일발송 주문접수 오후 3시까지 마감이니 늦은시간은 버스탁송이
						불가합니다.<br> 4. 버스탁송이용료는 라움에서 청주터미널까지 퀵요금 6,000원 + 탁송요금(요금표참고)
						입니다. 탁송요금은 지역마다 차이가 있습니다. 아래 요금표를 참고하시면 됩니다.<br> 소화물 탁송 운임표<br>
						<img src="http://www.ddaengshop.com/common/img/guide_2.jpg"
						align="left">
					</td>
				</tr>
				<tr>
					<td>영수증 및 기타서류 발행안내<br> 1. 라움 홈페이지에 등록된 제품은 부가세 포함된
						가격입니다. 모든영수증은 PC버전에서만 출력가능합니다.<br> 2. 거래명세서 및 견적서가 필요하신 학교나
						기관은 우선 원하시는 제품을 장바구니에 담으신 후 상품대여 선택 후 주문서작성(STEP 02) 페이지에서 결제수단을
						임시로 무통장입금으로 해주신 후 결제하기를 눌러주시면 마이페이지에서 견적서를 출력하실 수 있습니다. 이후에 실제결제시
						계좌이체 또는 카드결제로 하시면 됩니다.<br> ※ 왕복배송 택배비까지 견적서에 포함시켜야 되시는 분들은
						반납방법에서 "우체국택배수거"를 선택해주시고 진행하시면 됩니다.<br> 3. 계좌이체 경우:
						세금계산서/현금영수증(소비자소득공제/사업자지출증빙) 중 한 종류만 발행 가능<br> 4. 카드결제 경우:
						세금계산서/현금영수증 발행불가.※신용카드 명세서(매출전표)는 마이페이지에서 출력가능(마우스 우클릭 인쇄)<br>
						5. 보증금 경우: 서류나 영수증을 발행해 드리지 않습니다.<br> 6. 전자세금계산서 발행은 라움
						e-메일(master@ddaengshop.com)으로 아래 예시 양식으로 신청해주셔야만 합니다.<br> <br>
					<br> 예시) 제목: 세금계산서 발급요청<br> 주문자 : 홍길동<br> 연락처 :
						010-0000-0000<br> 주문일시 :<br> 결제금액 :<br> ※고유번호증 꼭 첨부
						부탁드립니다.<br> <br>
					<br> 7. 사업자등록증, 통장사본은 "공지사항"에서 다운받으실수 있습니다.<br> - 그 외
						필요하신 서류는 고객센터로 연락을 주시면 발행에 도움을 드리도록 하겠습니다.<br> <br> 8.
						필요서류를 우편(등기)으로 받아보시길 원하시는 경우 별도의 비용이 청구됩니다.<br> 9. 영수증 발행기한이
						지나서 요청하신 경우 영수증 발행이 불가능하니 이점 양해 부탁 드립니다.
					</td>
				</tr>
				<tr>
					<td>보증금 관련규정<br> 1. 보증금은 계좌이체만 가능합니다.<br> 2. 주문서 작성시
						보증금 반환에 필요한 계좌정보를 기재해 주시기 바랍니다.<br> 3. 보증금은 학교나 기관결제 시에 담당자께서
						개인계좌로 입금해 주시고 행사 후 개인계좌로 돌려 받으시길 권합니다.<br> 4. 보증금은 처음에 계약금으로
						입금을 하시는 금액으로 행사취소 시 반환이 안됩니다.<br> 5. 보증금은 라움에 제품도착후 2일 뒤에
						처리되며, 피크시즌(할로윈, 크리스마스 등)에는 좀 더 걸릴수 있으니 이점 양해부탁드립니다.<br> 6.
						보증금은 반납하신 상품에 문제가 발생할 경우 문제해결이 된 후에 반환이 됩니다.<br> 7. 보증금에 대해서는
						일체에 서류나 영수증 발행이 안됩니다.<br> <br>
					<br> 전체 대여료 만원 미만 보증금 1만원<br> 전체 대여료 1만원 이상 ~ 3만원 미만 보증금
						2만원<br> 전체 대여료 3만원 이상 ~ 5만원 미만 보증금 3만원<br> 전체 대여료 5만원 이상
						~ 10만원 미만 보증금 4만원<br> 전체 대여료 10만원 이상 ~ 15만원 미만 보증금 5만원<br>
						전체 대여료 15만원 이상 ~ 20만원 미만 보증금 6만원<br> 전체 대여료 20만원 이상 ~ 30만원 미만
						보증금 7만원<br> ◎ 장기대여나 상품에 따라 보증금이 변동될수 있습니다.<br> ※ 대여료
						30만원이상의 보증금은 대여료의 30%비율로 발생합니다.
					</td>
				</tr>
			</table>
		</div>
		</form>
	</div>

</body>
</html>




<%!

public static String calcDate(String date1) {
	
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");	//날짜 포맷
	
	Calendar cal = Calendar.getInstance();
	
	Date date = null;
	try {
		date = format.parse(date1);
	} catch (ParseException e) {
		e.printStackTrace();
	}
	
	cal.setTime(date);
	
	cal.add(Calendar.DATE, 1);	//1일 더하기 (빼기는 -1)
	
	return format.format(cal.getTime());
}

public static void main(String[] args) {
	String date1 = "2020-08-31";
	
	System.out.println(date1 + "의 하루 뒤 : " + calcDate(date1));
}

%>