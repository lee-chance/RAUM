<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기작성</title>
</head>
<body>
	<h3>후기작성</h3>
	<hr style="border:  solid 1px black;"><br>
	- 후기 작성 시, 500원의 적립금을 드립니다.<br>
	- 후기 내용은 단순 문자 및 기호의 나열/반복은 적립금이 지급되지 않습니다.<br>
	- 이메일, 휴대전화 번호 등의 개인 정보/광고/비속어가 포함된 후기는 블라인드 처리됩니다.<br>
	- 등록하신 후기는 공개되어 회원이 조회 가능합니다.<br>
	<br><br>
	
	<table >
		<tr>
			<td rowspan="3"><img src="/RAUM/resources/image/${review_write.image}" width="80" height="80"/><br/></td>

		</tr>
		<tr>
			<td>${review_write.name }</td> 
		</tr>
		<tr>
			<td>${review_write.size }</td>
		</tr>			
	</table >
	<hr style="color: #A4A4A4"> <br><br>


    <form name="fileForm" action="writeReview.do" method="post" enctype="multipart/form-data">
		<table>
	        <tr>
	        	<td><input type="file" name="file" /></td>
	        </tr>
			<tr>
				<td><input type="text" name="title" size="50" placeholder="제목"><br><br></td>
			</tr>
			<tr>
				<td><textarea name="content" cols="70" rows="15" placeholder="내용"></textarea></td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="등록하기" style="height:25px; width:100px;"></td>
			</tr>	
		</table>
    </form>

	
</body>
</html>