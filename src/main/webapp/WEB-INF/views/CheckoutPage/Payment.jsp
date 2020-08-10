<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제창</title>
<script type="text/javascript">
	function formSubmit() {
		var rname = document.getElementById("rname");
	/* 	var r_email1 = document.getElementById("r_email1");
		var r_email2 = document.getElementById("r_email2"); */
		var name = document.getElementById("name");
		var r_hp1 = document.getElementById("r_hp1"); 
		var r_hp2 = document.getElementById("r_hp2");
		var r_hp3 = document.getElementById("r_hp3");
		var sample6_postcode = document.getElementById("sample6_postcode");
		var sample6_address = document.getElementById("sample6_address");
		var sample6_detailAddress = document.getElementById("sample6_detailAddress");
		var return_name = document.getElementById("return_name");
		var return_bankNumber = document.getElementById("return_bankNumber");
	 	
		
		if (nameCheck(rname) == 1 || 
			addressCheck(sample6_postcode) == 1 || addressCheck(sample6_address) == 1 || address1Check(sample6_detailAddress) == 1 || 
			phoneCheck(r_hp1) == 1 || phoneCheck(r_hp2) == 1 || phoneCheck(r_hp3) == 1 ||  
			return_nameCheck(return_name) == 1 ||  return_bankNumberCheck(return_bankNumber) == 1 || chk() )
			return false;

		return true;

	}

	function nameCheck(input) {
		if (input.value == "") {
			alert("이름을 입력해주세요.")
			input.focus();
			return 1;
		}
		return 0;
	}
	function addressCheck(input) {
		if (input.value == "") {
			alert("주소를 입력해주세요.")
			var address_button = document.getElementById("address_button");
			address_button.focus();
			return 1;
		}
		return 0;
	}
	
	function address1Check(input) {
		if (input.value == "") {
			alert("상세주소를 입력해주세요.")
			input.focus();
			return 1;
		}
		return 0;
	}

	function phoneCheck(input) {
		if (input.value == "") {
			alert("전화번호를 입력해주세요.")
			input.focus();
			return 1;
		}
		return 0;
	}
	
	function emailCheck(input) {
		if (input.value == "") {
			alert("이메일을 입력해주세요.")
			input.focus();
			return 1;
		}
		return 0;
	} 
	function return_nameCheck(input) {
		if (input.value == "") {
			alert("보증금을 반환받으실 예금주를 입력해주세요.")
			input.focus();
			return 1;
		}
		return 0;
	} 
	function return_bankNumberCheck(input) {
		if (input.value == "") {
			alert("보증금을 반환받으실 계좌번호를 입력해주세요.")
			input.focus();
			return 1;
		}
		return 0;
	} 
	
	
	
	function chk() {
		var guidCheck = document.getElementById("guidCheck").checked;
		var guidCheck22 = document.getElementById("guidCheck22").checked;
		if(guidCheck == false || guidCheck22 == false){
			alert("체크해주세요");
			return true;
		}
		return false;
	}
	
	
	
	

	

	function r_null() {
		var f1 = document.myform;
		f1.name.value = "";
		f1.tel1.value = "";
		f1.tel2.value = "";
		f1.tel3.value = "";
		f1.sample6_postcode.value = "";
		f1.sample6_address.value = "";
		f1.sample6_detailAddress.value = "";
	/* 	f1.r_email1.value = "";
		f1.r_email2.value = ""; */

	}

	function r_fill() {
		var f1 = document.myform;
		f1.rname.value = "${Payment.userName}";
		f1.tel1.value = "${phone1}";
		f1.tel2.value = "${phone2}";
		f1.tel3.value = "${phone3}";
		f1.sample6_postcode.value = "${sample6_postcode}";
		f1.sample6_address.value = "${sample6_address}";
		f1.sample6_detailAddress.value = "${sample6_detailAddress}";
		/* f1.r_email1.value = "${emailId}";
		f1.r_email2.value = "${emailAddress}"; */
	}

	function view_pay(met) {
		var f1 = document.w_frm;
		if (met == 'B') {
			layer_pay_1.style.display = "none";
			layer_pay_2.style.display = "block";
			//layer_pay_3.style.display		=	"none";
			f1.p_method.value = "계좌";
			$("#payType").val("");
			//			f1['p_method2'][1].checked	=	true;
		}
		if (met == 'C') {
			layer_pay_1.style.display = "block";
			layer_pay_2.style.display = "none";
			//layer_pay_3.style.display		=	"none";
			f1.p_method.value = "카드";
			$("#payType").val("Y");
			$("#typeTexts").text("신용카드");
			$("#typeTR").show();
			//			f1['p_method1'][0].checked	=	true;
		}
	}

	//이메일뒷부분 @뒤에 자동으로 뜨게만들기위한부분
	function getSelectValue(frm) {
		frm.email2.value = frm.emailchoice.options[frm.emailchoice.selectedIndex].text;
	}

	//핸드폰번호에 문자가 안들어가게하는것.
	function inNumber() {
		if (event.keyCode<48 || event.keyCode>57) {
			event.returnValue = false;
		}
	}
	
	function hange(obj){

	    obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');

	}
</script>

<script>
							function sample6_execDaumPostcode() {
								new daum.Postcode(
										{
											oncomplete : function(data) {
												// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

												// 각 주소의 노출 규칙에 따라 주소를 조합한다.
												// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
												var addr = ''; // 주소 변수
												var extraAddr = ''; // 참고항목 변수

												//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
												if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
													addr = data.roadAddress;
												} else { // 사용자가 지번 주소를 선택했을 경우(J)
													addr = data.jibunAddress;
												}

												// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
												if (data.userSelectedType === 'R') {
													// 법정동명이 있을 경우 추가한다. (법정리는 제외)
													// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
													if (data.bname !== ''
															&& /[동|로|가]$/g
																	.test(data.bname)) {
														extraAddr += data.bname;
													}
													// 건물명이 있고, 공동주택일 경우 추가한다.
													if (data.buildingName !== ''
															&& data.apartment === 'Y') {
														extraAddr += (extraAddr !== '' ? ', '
																+ data.buildingName
																: data.buildingName);
													}

												}

												// 우편번호와 주소 정보를 해당 필드에 넣는다.
												document
														.getElementById('sample6_postcode').value = data.zonecode;
												document
														.getElementById("sample6_address").value = addr;
												// 커서를 상세주소 필드로 이동한다.
												document
														.getElementById(
																"sample6_detailAddress")
														.focus();
											}
										}).open();
							}
						</script>

	<center>

</head>
<body>


	 <form action="write.do" name="myform" id="myform" method="post" onsubmit="return formSubmit();">
			<p>
				<img alt="Annati logo" src="http://www.ddaengshop.com/common/img/step02.png" width="900">
			</p>

			<h3 class="pointtitle2"> 주문하실상품 </h3>


			<table border="1" width="1000" height="20">
				<tr>
					<td>상품</td>
					<td>수량</td>
					<td>보증금</td>
					<td>대여 및 반납일자</td>
					<td>배송료</td>
					<td>금액</td>
				</tr>
				<c:forEach items="${Product}" var="dto">
					<tr>
						<td><img src="http://192.168.0.80:8080/RAUM/resources/images/${dto.image}" alt="${dto.image}" width="50" height="50"></td>
						<td>  ${dto.qty} </td>
						<td><input type="text" value="20000원" readonly="readonly"> </td>
						<td>  ${dto.startDate}<br>${dto.endDate} </td>
						<td> <input type="text" value="3000원" readonly="readonly"> </td>
						<td> ${(dto.price + (dto.rentDay * 1000)) * dto.qty + 23000} 원</td> 
					</tr>
				</c:forEach>

			</table>
			<br> <br>

			<!-- 복붙 -->

			<img alt="Annati logo"
				src="http://www.ddaengshop.com/common/img/tit_order_prd_receive.gif"
				width="100">
				
			<div class="order_write_table">
				<img src="/common/img/tit_order_prd_receive.gif" alt="" /> <input
					type="hidden" value="1" name="receive_count" id="receive_count">
				<table border="2" width="1000" height="20">
					<colgroup>
						<col width="20%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr class="selectbesong">
							<td>배송지 선택</td>
							<td><input type="radio" name="addryn_0" id="addryn_01" value="no" onclick="r_fill()" /><label for="addryn_01"> 주문고객과동일 주소</label> 
							<input type="radio" name="addryn_0" id="addryn_02" value="yes" onclick="r_null()" /><label for="addryn_02"> 새로운 주소 입력</label></td>
						</tr>
						<tr>
							<td>받으시는 분</td>
							<td><input type="text" class="" title="" value="" name="rname" id="rname" /></td>
							<!-- <td><input type="hidden" class="" title="" value="" name="busName" id="busName" /></td> -->
						</tr>
						<tr class="address">
						<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"> fu</script>
						<tr>
							<td>주소</td>
							<td><input type="text" id="sample6_postcode" name="sample6_postcode"
								placeholder="우편번호" readonly="readonly">
								 <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="address_button"><br>
								 <input type="text" id="sample6_address" placeholder="주소" readonly="readonly" name="sample6_address"> <br>
								 <input type="text" id="sample6_detailAddress" placeholder="상세 주소" name="sample6_detailAddress"></td>
						</tr>
						
						
						<tr>
							<td>휴대폰번호</td>
							<td><input type="text" class="" title="" value=""
								name="tel1" id="r_hp1" style="IME-MODE: disabled"
								onkeypress="inNumber();" onkeydown="hange(this);" maxlength="3" /> - <input type="text"
								class="" title="" value="" name="tel2" id="r_hp2"
								style="IME-MODE: disabled" onkeypress="inNumber();" onkeydown="hange(this);"
								maxlength="4" /> - <input type="text" class="" title="" value=""
								name="tel3" id="r_hp3" onkeypress="inNumber();" onkeydown="hange(this);" maxlength="4" />
							</td>
						</tr>
						<tr class="selectsuryeong">
							<td rowspan="2">수령방법 선택</td>
							<td>
								<div style="float: left;">
									<input type="radio" name="suryeong" class="suryeongs" id="receive_method"
										value="직접방문" onclick="" /><label for="">직접방문수령</label> <input
										type="radio" name="suryeong" class="suryeongs" id="receive_method"
										value="택배" onclick="" checked /><label for="">택배수령</label> <input
										type="radio" name="suryeong" class="suryeongs" value="오토퀵"
										id="receive_method" onclick="" /><label for="">오토바이퀵<font
										style="color: #ff0000">(주문전 전화필수)</font></label>
								</div>
							</td>
						</tr>
						<tr class="selectsuryeong">
							<!--<td >※수령방법 - 고속버스 선택하시분들은 상품검색창에 <font style="color:#ff0000">“버스”</font> 검색후  해당지역터미널 선택후  <font style="color:#F00;">대여제품과 같이 결제</font>부탁드립니다</td>-->
							</td>
						</tr>
						<tr class="selectbannab">
							<td rowspan="2">반납방법 선택</td>
							<td><input type="radio" name="bannab" class="bannabs" id="return_method"
								value="직접방문" onclick="" /><label for="">직접방문반납</label> <input
								type="radio" name="bannab" class="bannabs" id="return_method" value="택배"
								onclick="" checked /><label for="">직접 택배반납<font
									style="color: #ff0000">(착불금지 - 착불시 7,000원 차감)</font></label> <input
								type="radio" name="bannab" class="bannabs" value="오토퀵" id="return_method"
								onclick="" /><label for="">오토퀵(요금은 고객부담/당일도착)</label></td>
						</tr>
						<tr class="selectbannab">
							<!--<td>※반납방법 - 택배수거 선택하시분들은 상품검색창에 <font style="color:#ff0000">“반납”</font> 검색후  해당 박스수량 선택후 <font style="color:#F00;">대여제품과 같이 결제</font>부탁드립니다</td>-->
							<td><font size="2">※반납방법 - 택배수거시 가로세로높이 120cm 기준이며
									1박스 초과시 7,000원 보증금에서 차감후 진행하겠습니다.</font><font style="color: #ff0000" size="1"><br>
									(예 : 3박스 수거반납시 보증금에서 14,000원차감)</font><br> <font style="color: #ff0000" size="1">
									(대여마지막날이 토,일요일인경우 자동으로 월요일에 수거됩니다)</font></td>
						</tr>
<%-- 						 
						<tr class="address1">
								<td>이메일</td>
								<td><input type="text" class="" title="" value="${user_email }" readonly="readonly"
									name="user_email" id="r_email1" /><!-- @ <input type="text" class=""
									title="" value="" name="email2" id="r_email2" />  <select
									name="emailchoice" id="emailchoice"
									onchange="getSelectValue(this.form);">
										<option selected="" value="">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="hanmail.net">hanmail.net</option>
										<option value="nate.com">nate.com</option>
								</select> --></td>
						</tr>
--%>
						<tr class="memo">
							<td>배송시 요청사항</td>
							<td><span style="margin-left: 0;">학생일경우 비상연락처 적어주세요.</span><br>
								<textarea rows="4" cols="40" name="optional" id="Requests"
									style="resize: none;"></textarea> <!-- <input type="text" class="" title="" value="" name="detail" maxlength="100" style="margin-top:3px;"/> -->
								<font size="1">택배기사님께 전할 말씀을 남겨주세요. (한글 50자 이내)</font></td>
						</tr>
					</tbody>
				</table>
			</div>

			<br> <br>
			<table class="mt30" border="" width="1000" height="20">
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr class="halin">
						<td colspan="2">02 <span>결제수단 선택</span></td>
					</tr>
					<tr class="costttt">
						<td colspan="2"><input type="radio" value="계좌" name="p_method1" id="mu" onclick="view_pay('B')" checked />
							<label for="mu" class="mu">무통장입금</label>
							<img src="/_goods_img/2020-02/1_1_1581651203.jpg" alt="" class="imgpopup2" id="layer_moo" style="border: 1px solid #DDD;" />
							<input type="radio" value="카드" name="p_method1" id="sin" onclick="view_pay('C')" />
							<label for="sin" class="sin">신용카드</label>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="order_write_table mt20 sincard" id="layer_pay_1"
				style="display: none;">
				<table border="2" width="1000" height="20">
					<colgroup>
						<col width="20%" />
						<col width="*" />
					</colgroup>

					<tbody>
						<tr>
							<td colspan="2" id="typeTexts">신용카드</td>
						</tr>
						<tr class="coupon111">
							<td>결제금액</td>
							<input type="hidden" value="${dto.price * dto.qty}" name="money2">
							<td>
							
							<c:forEach items="${Product}" var="dto">
							<input type="text" class="" title="" name="money3"
								id="money3" value="${(dto.price + (dto.rentDay * 1000)) * dto.qty + 3000}" readonly />원
							</c:forEach>
							
							</td>
						</tr>
						<tr id="typeTR">
							<td style="background: none; border-right: none;"></td>
							<td style="border-left: none;">
								<p>신용카드를 통한 요금 결제를 위해서는 각 신용카드 사업자가 채택하고 있는 ISP안전결제, 혹은
									안심클릭결제에 등록이 되어 있어야 하며, 경우에 따라 공인인증서가 필요할 수도 있습니다.</p>
								<ul class="card_list">
									<li><a onclick="javascript:open_c(1)">공인인증서 이용안내</a></li>
									<li><a onclick="javascript:open_c(2)">안심클릭 이용안내</a></li>
									<li><a onclick="javascript:open_c(3)">안전결제(ISP) 이용안내</a></li>
								</ul>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<!-- 무통장입금 -->
			<div class="order_write_table mt20 mutong" id="layer_pay_2"
				style="display: block;">
				<table border="2" width="1000" height="20">
					<colgroup>
						<col width="20%" />
						<col width="*" />
					</colgroup>
					<tbody>
						<tr>
							<td colspan="2">무통장입금</td>
						</tr>
						<tr class="coupon111">
							<td>결제금액</td>
							<c:forEach items="${Product}" var="dto">
							<td><input type="text" class="" title="" readonly
								paymethod="majorPayMethodAmt" style="width: 80px;" id="money4"
								value="${(dto.price + (dto.rentDay * 1000)) * dto.qty }" id="money123" name="money4" readonly />원
								+ <span>보증금</span> 20000 원 + 배송비 3000 원 = <input type="text" class=""
								title="" onfocus="this.select()" readonly="readonly"  style="width: 80px;"
								id="ppbo_money" value="${(dto.price + (dto.rentDay * 1000)) * dto.qty + 23000}" id=""
								name="ppbo_money"  /></td>
							</c:forEach>
						</tr>
						<tr>
							<td>은행명</td>
							<td><select name="p_account" title="" style="width: 400px">
									<option value="" selected="selected">신한은행 110 - 414 -
										127334 문단비</option>
							</select></td>
						</tr>
						<tr>
							<td>입금예정자 성함</td>
							<td><input type="text" class="" title="" maxlength="10"
								value="${Payment.userName }" name="p_name" id="Depositor" /></td>
						</tr>
						<tr>
							<td>입금기한</td>
							<td>
								<!-- <select name="p_date_respect" title="" style="width:150px">
												<option value="20200612" selected="selected">2020년 06월 12일</option>
												<option value="20200613">2020년 06월 13일</option>
												<option value="20200614">2020년 06월 14일</option>
												<option value="20200615">2020년 06월 15일</option>
											</select> --> <!-- <p>입금은행을 선택하시고 고객님의 라움 계좌번호를 확인하세요. 주문 후 자정까지 입금이 확인되지 않으면 주문이 자동으로 취소 될 수 있습니다.</p> -->
								<p style="color: #FF0000; font-weight: 600; margin-left: 0;">
									<font size="2">무통장입금 주문은 다른 고객님들의 대여 가능여부에 영향이 있기에 당일입금이
										원칙입니다.</font>
								</p>
								<p>주문 당일인 오늘 밤 23:59 까지 입금이 안 되거나 입금된 후 입금예정자 성함과 일치하지 않아서
									입금확인이 안될 경우 자동으로 취소될 수 있습니다.</p>
							</td>
						</tr>

					</tbody>
				</table>
				<!-- <table cellpadding="0" cellspacing="0" class="" summary=""  id="layer_pay_3">
								<colgroup>
									<col width="20%"/><col width="*"/>
								</colgroup>
								<tbody>
									<tr>
										<td>현금영수증 발행</td>
										<td>마이페이지 메뉴의 <span class="fb" style="margin:0;">1:1 친절상담 게시판</span>에 등록해주세요</td>
									</tr>
									<tr>
										<td style="background:none; border-right:none;"></td>
										<td style="border-left:none;">
											<p>현금영수증과 세금계산서 중 하나만 발행이 가능합니다. </p>
										</td>
									</tr>
								</tbody>
							</table>		 -->
			</div>
			<br> <br>
			<table class="deposit mt30" border="1" width="1000" height="20">
				<colgroup>
					<col width="20%" />
					<col width="*" />
				</colgroup>
				<tbody>
					<tr class="halin">
						<td colspan="4">03 <span>보증금</span></td>
					</tr>
					<tr class="deposit_txt">
						<td>보증금(계약금)<i class="xi-help-o"></i>
							<div class="deposit_help" id="deposit_help">
								<div class="deposit_help_txt">
									<p>보증금 안내</p>
									<div class="help_exit" id="help_exit"></div>
								</div>
							</div>
						</td>
						<td colspan="3"><input type="hidden" id="bo_price"
							name="bo_price" value="20000"> <span class="deposit_cost"><font
								id="bo_font">20,000</font>원</span> <span class="deposit_info">신한은행
								110-414-127334 문단비</span> <span class="deposit_info">보증금 계좌는 문자로
								전송됩니다.</span> <span class="deposit_info">1분안에 보증금 입금안내문자를 못받으셨다면
								고객센터로 연락주세요.</span>
							<p>
								보증금은 무통장입금(계좌이체)만 가능합니다.<br> 보증금까지 입금이 완료되어야 정상예약완료 처리됩니다.<br>
								<span style="color: #FF0000; font-weight: 600; margin-left: 0;"><font
									size="2">보증금은 당일주문 예약 입금 후 당일 주문취소 하여도 전액 반환되지 않으니 신중하게
										주문 부탁드립니다.</font></span><br> 보증금은 라움에 제품도착 후 2일 뒤에 처리되며, 피크시즌(할로윈,
								크리스마스 등)에는 좀 더 지연될 수 있으니,<br> 이점 양해부탁드립니다.
							</p> 그밖에 보증금 관련내용은 대여가이드 보증금 관련규정을 참고바랍니다.</td>
					</tr>
					<tr>
						<td rowspan="3">보증금 반환계좌</td>
						<td>은행명</td>
						<td colspan="2">
							<!-- <input type="text" class="" title="" value="" name="" maxlength=""/> -->
							<select name="return_bank" id="return_bank" title="">
								<option value="케이뱅크">케이뱅크</option>
								<option value="카카오뱅크">카카오뱅크</option>
								<option value="국민은행">국민은행</option>
								<option value="신한은행">신한은행</option>
								<option value="우리은행">우리은행</option>
								<option value="하나은행">하나은행</option>
								<option value="외환은행">외환은행</option>
								<option value="농협">농협</option>
								<option value="기업은행">기업은행</option>
								<option value="산업">산업</option>
								<option value="SC은행">SC은행</option>
						</select>
						</td>
					</tr>
					<tr>
						<td>예금주</td>
						<td colspan="2"><input type="text" class="" title="" value=""
							name="return_name" id="return_name" maxlength="" /></td>
					</tr>
					<tr>
						<td>은행계좌</td>
						<td colspan="2"><input type="text" class="" title=""
							value="" name="return_bankNumber" id="return_bankNumber" onkeypress="inNumber();" onkeydown="hange(this);"
							maxlength="" />(숫자만 입력해주세요.)<br> 입력하신 은행계좌와 예금주가
							틀린경우 보증금 환급처리가 지연될 수 있습니다.</td>
					</tr>
					<!--<tr class="coupon111">
									<td>하고싶은말</td>
									<td colspan="3"><input type="text" class="" title="" value="" name="return_detail" maxlength="100" style="text-align:left;"/></td>
								</tr>-->
					<tr class="coupon111">
						<td>대여가이드확인</td>
						<td colspan="3">
							<p style="float: left; margin-right: 20px; line-height: 23px;">라움
								대여가이드 안내사항을 전부 확인하셨나요?</p>
							<p>
								<input style="float: left; width: unset;" type="checkbox"
									id="guidCheck" name="guidCheck" value="Y" > 네 확인 하였습니다
							</p>
							<div style="color: #F00; clear: both;">취소,환불규정등.. 대여가이드
								미확인으로 인한 문제발생은 라움에서 책임이 없음을 알려드립니다.</div>
						</td>
					</tr>
					<tr>
						<td>카드결제 접수누락</td>
						<td colspan="3">
							<p style="float: left; margin-right: 20px; line-height: 23px;">
								카드결제의 경우 저희라움 전산에 누락되는 경우가 있으니 <font style="color: #F00;">카드승인후에
									1분안에 보증금 입금안내문자</font>를 못받으셨다면 꼭 고객센터 ☎1833-7507 로 연락주시길 바랍니다.
							</p>
							<p>
								<input style="float: left; width: unset;" type="checkbox"
									id="guidCheck22" name="guidCheck22" > 네 확인하였습니다
							</p>

						</td>
					</tr>
				</tbody>
			</table>
			
			<br>

				<table>
					<tr>
						<td><input type="submit" value="결제" onclick="" style="WIDTH: 60pt; HEIGHT: 20pt" /></td>
						<td><input type="button" value="취소" onclick="javascript: form.action=location.href='/ProjectShare/home.do';" style="WIDTH: 60pt; HEIGHT: 20pt" /></td>
					</tr>
				</table>
		
		
		
			</form>
				
				
							
						<!-- <table>
							<tr>
								<td><input type="submit" value="결제" onclick="" style="WIDTH: 60pt; HEIGHT: 20pt" /></td>
								<td><input type="button" value="취소" onclick="location.href='http://192.168.0.70:8080/ProjectShare/Home.jsp" style="WIDTH: 60pt; HEIGHT: 20pt" /></td>
							</tr>
						</table> -->
				
				<br>
				<br>
				<br>
				
					
		</center>
</body>
</html>