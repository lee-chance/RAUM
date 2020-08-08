<%@page import="com.MajorCompany.RAUM.dto.SSB.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
function formChk() {
	if(document.getElementById('password').value == ""){
        alert("비밀번호를 입력해주세요");
        document.getElementById('password').focus();
        return false;
    } 
	
    if((document.getElementById('password').value != "")&&(document.getElementById('password').value == document.getElementById('realpassword').value)) {
    	
	   	 if (confirm("정말 삭제하시겠습니까??") == true){    //확인
	     	alert("그동안 이용해주셔서 감사합니다. 다음에라도 다시 뵙기를 바랍니다.");	
	     	return true;
	   	 }else{   //취소
	   	     return false;
	   	 }
    	
    }  
    if((document.getElementById('password').value != "")&&(document.getElementById('password').value != document.getElementById('realpassword').value)) {
    	alert("비밀번호가 다르니 다시 한번 확인 부탁드립니다.");
        document.getElementById('password').focus();    	
    	return false;
    }
}

</script>
<meta charset="UTF-8">
<title>회원탈퇴</title>
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
</head>

<body>
	<table class = "type01">
	<colgroup>
		<col width="15%"><col width="*">
		<col width="15%"><col width="15%">
	</colgroup>
	<tbody>
		<tr>
			<td colspan="4"><span><input type = "text" name = "name" value = "${list.name}" size = 5 readonly = "readonly" style = "font-size:15px">고객님의 쇼핑함입니다. 보유 포인트를 확인하실 수 있습니다.</span> </td>
		</tr>
		<tr>
			<td>최초가입일</td>
			<td colspan="3"><span><input type = "text" name = "join_date" value = "${list.join_date}" size = 50 readonly = "readonly" style = "font-size:15px"></span></td>
		</tr>
		<tr>
			<td>사용가능한 포인트</td>
			<td><span><input type = "text" name = "total_point" value = "${list.total_point}" size = 10 readonly = "readonly" style = "font-size:15px"></span>Point</td>
		</tr>
	</tbody>
</table>
<br>
<h3>회원 탈퇴</h3>
<p>저희 라움 이용에 다시한번 진심으로 감사의 말씀을 드립니다.</p>

<p>서비스 이용에 불편하신 점이나 불만이 있으시다면 고객센터 (1833-0000)로 문의 주시면 신속히 해결해드리겠습니다.</p>

<p>항상 고객님께 보다 나은 서비스를 제공하고자 노력하겠습니다.</p>

<p>회원탈퇴시 고객님의 포인트는 회원 탈퇴 후 소멸되어 사용이 어렵습니다.</p>
<br>

	<form action="memberOutEnd.do" onSubmit = "return formChk();" method = "post">  
		<table class = "type09">
							<colgroup>
								<col width="15%"><col width="*">			
							</colgroup>
							<tbody>
								<tr>
									<td>아이디</td>
									<td><input type = "text" name = "email" value = "${list.email}" readonly = "readonly"></td> <!-- 신경환 -->
								</tr>
								<tr>
									<td>이름</td>
									<td><input type = "text" name = "name" value ="${list.name}" readonly = "readonly"></td> 
								</tr>
								<tr>
									<td>비밀번호</td>
									<td><input type = "password" name = "password" id ="password" value="" size = "20"></td>
								</tr>
								
							</tbody>
		</table>
		
		<input type = "hidden" name = "realpassword" id = "realpassword" value = "${list.password}">
		
        <input type= "submit"  value="탈퇴하기"><br/>
		</form>
		
		
</body>
</body>
</html>