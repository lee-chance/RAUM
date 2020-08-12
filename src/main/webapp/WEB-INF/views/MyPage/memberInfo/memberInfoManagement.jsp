<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
div.button1 {
   margin: auto;
   width: 100%;
}

div.button1 input {
   padding: 5px;
   width: 10%;
   font-size: 18px;
}
div.button2 {
   margin: auto;
   width: 40%;
}
div.button2 input {
   padding: 5px;
   width: 25%;
   font-size: 18px;
}

</style>
</head>
<body>

<form action= "memberInfoManagement2.do" method="post">	
<table class = "type01">
	<colgroup>
		<col width="15%"><col width="*">
		<col width="15%"><col width="15%">
	</colgroup>
	<tbody>
		<!-- value 및 name db와 일치시키기 위하여 name -> nickname로 수정 -->
		<tr>
			<td colspan="4"><span><input type = "text" name = "nickname" value = "${list.nickname}" size = 20 readonly = "readonly" style = "font-size:15px">고객님의 쇼핑함입니다. 보유 포인트를 확인하실 수 있습니다.</span> </td>
		</tr>
		<tr>
			<td>최초가입일</td>
			<td colspan="3"><span><input type = "text" name = "join_date" value = "${list.createdate}" size = 50 readonly = "readonly" style = "font-size:15px"></span></td>
		</tr>
		<!-- value 값 db와 일치시키기 위하여  total_point -> point로 수정 -->
		<tr>
			<td>보유포인트</td>
			<td><span><input type = "text" name = "total_point" value = "${list.point}" size = 10 readonly = "readonly" style = "font-size:15px"></span>Point</td>
		</tr>
	</tbody>
</table>
<br>
<h3>회원 정보</h3>
<p>고객님의 기본정보는 라움에서 안전하게 관리되고 있습니다.</p>				
			<table class = "type09">
							<colgroup>
								<col width="50%"><col width="*">			
							</colgroup>
							<thead>
								<tr>
									<th>항목</th>
									<th>내용</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>아이디</td>
									<td><input type = "text" name = "email" value = "${list.email}" size = 50 readonly = "readonly" style = "font-size:15px"></td> <!-- 신경환 -->
								</tr>
								<tr>
									<td>핸드폰번호</td>
									<td><input type = "text" name = "phone1" value = "${phone1}" size = 10 readonly = "readonly" style = "font-size:15px"> -
 									<input type = "text" name = "phone2" value = "${phone2}" size = 10 readonly = "readonly" style = "font-size:15px"> -
									<input type = "text" name = "phone3" value = "${phone3}" size = 10 readonly = "readonly" style = "font-size:15px"> 
									</td>
								</tr>
								<tr>
									<td>주소</td>
									<td><input type = "text" name = "postcode" value = "${postcode}" size = 100 readonly = "readonly" style = "font-size:15px"><br>
									<input type = "text" name = "partaddress" value = "${partaddress}" size = 30 readonly = "readonly" style = "font-size:15px"><br>
									<input type = "text" name = "detailaddress" value = "${detailaddress}" size = 30 readonly = "readonly" style = "font-size:15px">
									</td>
								</tr>
							</tbody>
		</table>
<br>

		<div class="button">
			<input type='submit'  value='회원정보변경'>
		</div>
</form>


</body>
</html>