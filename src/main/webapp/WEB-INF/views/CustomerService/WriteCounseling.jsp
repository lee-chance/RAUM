<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

#top{
	position:relative; 
	width:1280px; 
	margin:5px auto; 
	padding-bottom:30px;
	}
#container{
	position:relative;
	width:1280px;
	margin:5px auto;
	}
#menu{
	text-align:center;
	}
#content{
	float:right;
	width: 1010px;
	}
	
	
#counTable, #counTable.tr, #counTable.td {
	border: 1px solid #D8D8D8;
	border-collapse:collapse;	
	margin: auto;

}
h3, p {
	text-align: center;
}
#footer {
position: absolute;
bottom: 0;
width: 100%;

}
</style>
<meta charset="EUC-KR">
<title>1:1 상담</title>
</head>
<body>


<div id="top">
	<%@ include file="Top.jsp" %>
</div>
	
<div id="container">

	<div id="menu">
		<%@ include file="Menu.jsp" %>
	</div>
	
	<div id="content">
	<h3>1:1 친절 상담문의</h3>
	<p>고객님 무엇을 도와드릴까요? 정확하고 신속한 답변 드리도록 하겠습니다.<br>
	문의하신 답변 내용은 <span style="color:blue;">마이페이지 > 1:1 친절상담</span> 에서 확인하실 수 있습니다.</p><br><br>
	
	
	<form action="writeCounselingAction.do" method="post">
		<table id="counTable" border="1">
			<tr>
				<td bgcolor="#F2F2F2">상담유형</td>
				<td><select name='category'>
					  <option value='1' selected="selected">상품문의</option>
					  <option value='2'>입금확인</option>
					  <option value='3'>현금영수증</option>
					  <option value='4'>배송문의</option>
					  <option value='5'>교환/반품</option>
					  <option value='6'>주문취소/환불</option>
					  <option value='7'>기타</option>			  					  
					</select></td>
			</tr>
			<tr>
				<td bgcolor="#F2F2F2">주문자</td>
				<td><input type="text" name="nickname" size="25" value="<%= session.getAttribute("NICKNAME") %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td bgcolor="#F2F2F2">상품명</td>
				<td><input type="text" size="25"></td>
			</tr>
			<tr>
				<td bgcolor="#F2F2F2">주문구분</td>
				<td><select name='orderType'>
					  <option value='주문전' selected="selected">주문전</option>
					  <option value='주문완료'>주문완료</option>
					</select></td>
			</tr>
			<tr>
				<td bgcolor="#F2F2F2">제목</td>
				<td><input type="text" name="title" size="25"></td>
			</tr>
			<tr>
				<td bgcolor="#F2F2F2">내용</td>
				<td><textarea cols="50" rows="5" name="content"></textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="등록"></td>
			</tr>																
		
		</table>
	</form>
	
	</div>
	
</div>

	<div id="footer">
		<%@ include file="/WEB-INF/views/CustomerService/footer.jsp"%>
	</div>


</body>
</html>