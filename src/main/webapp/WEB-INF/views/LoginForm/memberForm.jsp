<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 창</title>

	<script>
		function inNumber(){
		    if(event.keyCode<48 || event.keyCode>57){
		       event.returnValue=false;
		    }
		}
		
		function hange(obj){

		    obj.value = obj.value.replace(/[\ㄱ-ㅎㅏ-ㅣ가-힣]/g, '');

		}
	</script>	
	
</head>
<body>

	<script type="text/javascript">
		function emailCheck() {
			window.name = "parentForm"
			window.open("LoginForm/emailCheckForm.jsp", "emailwin",
					"width=400, height=350");
		}
	</script>


	<br>
	<br>
	<table width="1400" height="300" align="center">
		<tr>
			<td width="100%" height="10%"><span style="padding-left: 160px">
					<img src="http://www.ddaengshop.com/common/img/sign_tit_02.gif"
					alt="middle" />
			</span> <img src="http://www.ddaengshop.com/common/img/sign_step_02.gif"
				align="right" alt="" />
		<tr>
			<td width="40%" height="50%" align="center"><span
				style="padding-left: 160px"></span>

				<form action="/ProjectShare/actionSignup.do" name="form"
					method="post" onsubmit="return blankCheck(this)">
					<table border="2" width="1000" height="450" align="middle">


						<tr>
							<td>이메일 :</td>
							<td><input type="text" id="pInput" name="email" id="email"
								size="30" readonly="readonly">&nbsp;<input type="button"
								value="중복확인" onclick="emailCheck()">&nbsp;<span>중복확인을 눌러주세요</span></td>
						</tr>


						<tr>
							<td><div class="content_title">비밀번호</div>
								<div class="content_content"></td>
							<td><input type="password" name="password" id="pwd"
								size="25" maxlength="20" class="pw" placeholder="비밀번호">
								<span>8~15자리의 영문, 숫자, 특수문자의 입력이 가능합니다.</span>
								</div></td>
						</tr>

						<tr>
							<td><div class="content_title">비밀번호 확인</div>
								<div class="content_content"></td>
							<td><input type="password" name="password2" id="pwdcheck"
								size="25" maxlength="20" class="pw" placeholder="비밀번호 확인">
								<span id="alert-success" style="display: none;">비밀번호가
									일치합니다.</span> <span id="alert-danger"
								style="display: none; color: #d92742; font-weight: bold;">비밀번호가
									일치하지 않습니다.</span></td>
							</div>
						</tr>

						<tr>
							<td>닉네임</td>
							<td><input type="text" size="25" maxlength="12"
								name="nickname" id="nickname"></td>
						</tr>

						<tr>
							<td>이름</td>
							<td><input type="text" size="25" maxlength="12" name="name"
								id="name"></td>
						</tr>


						<tr>
							<td>휴대폰</td>
							<td><select name="ph1" id="ph1">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="019">019</option>


							</select>-<input type="text" name="ph2" id="ph2" size="7" onKeypress="this.value=this.value.replace(/[^0-9]/g,'');"  onkeydown="hange(this);" maxlength="4">
								- <input type="text" name="ph3" id="ph3" size="7" onKeypress="this.value=this.value.replace(/[^0-9]/g,'');" onkeydown="hange(this);" maxlength="4">
						</tr>

						<tr>
							<td>생년월일</td>
							<td><select name="birth1">
									<option value="2013">2013</option>
									<option value="2012">2012</option>
									<option value="2011">2011</option>
									<option value="2010">2010</option>
									<option value="2009">2009</option>
									<option value="2008">2008</option>
									<option value="2007">2007</option>
									<option value="2006">2006</option>
									<option value="2005">2005</option>
									<option value="2004">2004</option>
									<option value="2003">2003</option>
									<option value="2002">2002</option>
									<option value="2001">2001</option>
									<option value="2000">2000</option>
									<option value="2002">1999</option>
									<option value="2001">1998</option>
									<option value="2000">1997</option>
									<option value="2002">1996</option>
									<option value="2001">1995</option>
									<option value="2000">1994</option>
									<option value="2002">1993</option>
									<option value="2001">1992</option>
									<option value="2000">1991</option>
									<option value="2002">1990</option>
									<option value="2001">1989</option>
									<option value="2000">1988</option>
									<option value="2002">1987</option>
									<option value="2001">1986</option>
									<option value="2000">1985</option>
									<option value="2002">1984</option>
									<option value="2001">1983</option>
									<option value="2000">1982</option>
									<option value="2001">1981</option>
									<option value="2000">1980</option>


							</select>년&nbsp; <select name="birth2">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
							</select> <select name="birth3">
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
							</select>일</td>
						</tr>


						<tr>
							<td>주소</td>
							<td><input type="text" name="sample6_postcode"
								id="sample6_postcode" placeholder="우편번호" size="30"
								readonly="readonly"> <input type="button"
								onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>

								<input type="text" name="sample6_address" id="sample6_address"
								placeholder="주소" size="30" readonly="readonly"> <input
								type="text" name="sample6_detailAddress"
								id="sample6_detailAddress" size="30" placeholder="상세 주소"></td>
						</tr>


						<script
							src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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



						<script type="text/javascript">
							function blankCheck(f) {
								var email = f.email.value;
								email = email.trim();
								var pwd = f.pwd.value;
								pwd = pwd.trim();
								var pwdcheck = f.pwdcheck.value;
								pwdcheck = pwdcheck.trim();
								var name = f.name.value;
								name = name.trim();
								var nickname = f.nickname.value;
								nickname = nickname.trim();
								var ph2 = f.ph2.value;
								ph2 = ph2.trim();
								var ph3 = f.ph3.value;
								ph3 = ph3.trim();
								var sample6_postcode = f.sample6_postcode.value;
								sample6_postcode = sample6_postcode.trim();
								var sample6_detailAddress = f.sample6_detailAddress.value;
								sample6_detailAddress = sample6_detailAddress
										.trim();

								if (email.length == 0) {
									alert("이메일을 입력해주세요.");
									return false;
								} else if (pwd.length == 0) {
									alert("비밀번호를 입력해주세요.");
									return false;
								} else if (pwdcheck.length == 0) {
									alert("비밀번호 입력 확인해주세요.");
									return false;
								} else if (nickname.length == 0) {
									alert("닉네임을 입력해주세요.");
									return false;
								} else if (name.length == 0) {
									alert("이름을 입력해주세요.");
									return false;
								} else if (ph2.length == 0) {
									alert("휴대폰 번호 앞자리를 입력해주세요.");
									return false;
								} else if (ph3.length == 0) {
									alert("휴대폰 번호 뒷자리를 입력해주세요.");
									return false;
								} else if (sample6_postcode.length == 0) {
									alert("우편번호 찾기를 눌러주세요.");
									return false;
								} else if (sample6_detailAddress.length == 0) {
									alert("상세주소를 입력해주세요.");
									return false;
								}
								return true;

							}
						</script>

				<script src="http://code.jquery.com/jquery-latest.min.js"></script>
				
				
							<script>
							$('.pw').focusout(function() {
								var pwd1 = $("#pwd").val();
								var pwd2 = $("#pwdcheck").val();
				
								if (pwd1 != '' && pwd2 == '') {
									null;
								} else if (pwd1 != "" || pwd2 != "") {
									if (pwd1 == pwd2) {
										$("#alert-success").css('display', 'inline-block');
										$("#alert-danger").css('display', 'none');
									} else {
										alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
										$("#alert-success").css('display', 'none');
										$("#alert-danger").css('display', 'inline-block');
									}
								}
							});
						</script>



						<tr>
							<td colspan="2">※ 첫 회원가입 포인트 지급 : <input type="text"
								name="total_point" size="7" value=1000 readonly="readonly">점
							</td>
						</tr>

					</table>
					<table>
						<tr>
							<td><input type="submit" value="가입신청">&nbsp; <input
								type="reset" value="다시입력">&nbsp; <input type="button"
								value="취소"
								onClick="location.href='http://192.168.0.80:8080/ProjectShare/*.do'"></td>
						</tr>
						</form>
						</tr>
					</table>
	</table>

</body>
</html>