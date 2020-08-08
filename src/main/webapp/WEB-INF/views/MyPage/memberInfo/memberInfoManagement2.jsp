<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }

                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
function Check(){
	if((document.ElementById("phone2").value == "") || (event.keyCode<48 || event.keyCode>57)) {
		alert("공백은 사용할 수 없습니다. 휴대폰 가운데 4자리 입력부탁드립니다.");
		document.ElementById("phone2").focus();
		return false;
	} 
	if((document.ElementById("phone3").value == "") || (event.keyCode<48 || event.keyCode>57)) {
		alert("공백은 사용할 수 없습니다. 휴대폰 끝 4자리 입력부탁드립니다.");
		document.ElementById("phone3").focus();
		return false;
	} else {
		return true;
	}
 }
</script>	
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
	
<meta charset="UTF-8">
<title>회원 정보 관리</title>
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

<%
	request.setCharacterEncoding("utf-8");
%>

<table class = "type01">
	<colgroup>
		<col width="15%"><col width="*">
		<col width="15%"><col width="15%">
	</colgroup>
	<tbody>
		<tr>
			<td colspan="4"><span><input type = "text" name = "name" value = "${param.name}" size = 5 readonly = "readonly" style = "font-size:15px">고객님의 쇼핑함입니다. 보유 포인트를 확인하실 수 있습니다.</span> </td>
		</tr>
		<tr>
			<td>최초가입일</td>
			<td colspan="3"><span><input type = "text" name = "join_date" value = "${param.join_date}" size = 50 readonly = "readonly" style = "font-size:15px"></span></td>
		</tr>
		<tr>
			<td>사용가능한 포인트</td>
			<td><span><input type = "text" name = "total_point" value = "${param.total_point}" size = 10 readonly = "readonly" style = "font-size:15px"></span>Point</td>
		</tr>
	</tbody>
</table>
<br>
<h3>회원 정보 변경</h3>
<p>변경할 부분을 입력후 버튼을 눌러주세요 !</p>

		<form action = "/ProjectShare/memberInfoManagement.do" method = "post">
			<table class = "type09">
							<colgroup>
								<col width="15%"><col width="">
							</colgroup>
							<thead>
								<tr>
									<th>항목</th>
									<th>내용</th>
								</tr>
							</thead>
							<tbody><%-- 
								<tr>
									<td>아이디</td>
									<td><input type = "text" name = "email" readonly = "readonly" value = "${EMAIL}"></td> <!-- 신경환 -->
								</tr>
								<tr>
									<td>이름</td>
									<td><input type = "text" name = "name" readonly = "readonly" value = "${param.name}"></td> 
								</tr> --%>
								<tr>
									<td>핸드폰번호</td>
									<td>								
									<select name ="phone1">
									<option value = "010">010</option>
									<option value = "011">011</option>
									<option value = "016">016</option>
									<option value = "017">017</option>
									<option value = "019">019</option>
									</select>-									
									<input type = "text" name = "phone2" id = "phone2" maxlength = 4 value = "${param.phone2}" onKeypress="this.value=this.value.replace(/[^0-9]/g,'');" onkeydown="hange(this);"> -
									<input type = "text" name = "phone3" id = "phone3" maxlength = 4 value = "${param.phone3}" onKeypress="this.value=this.value.replace(/[^0-9]/g,'');" onkeydown="hange(this);">   
									</td>
								</tr>
								<tr>
									<td>닉네임</td>
									<td><input type = "text" name = "nickname" id="nickname" value = "${param.nickname}"></td>
								</tr>
								<tr>
									<td>변경을 원하는 주소</td>	
								<td><input type="text" id="sample6_postcode" name = "postcode1" placeholder="우편번호" readonly = "readonly"  value = "${param.postcode}">
									<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" id="address_button"><br>
									<input type="text" id="sample6_address" name = "partaddress2" placeholder="주소" readonly = "readonly" value = "${param.partaddress}"> <br>
									<input type="text" id="sample6_detailAddress" name = "detailaddress3" placeholder="상세 주소" value = "${param.detailaddress}"></td>
								</tr>
						
							</tbody>
		</table>

<br>


		<div class="button">
		<input type="submit" value="변경">
		<input type="button" value="취소" onClick="location.href='/ProjectShare/userInfo.do'" style="color:red;">
		</div>
		</form>
		
	
</body>
</html>