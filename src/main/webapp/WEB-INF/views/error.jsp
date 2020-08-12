<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<%
    response.setStatus(200);
%>

<!DOCTYPE html>
<html>
<head>

<style>
#content{
	width: 400px;
}

.btsCon2 {
    overflow: hidden;
}
.taC {
    text-align: center !important;
}
.mt20 {
    margin-top: 20px;
}

.btsCon2 span {
    float: left;
    width: 50%;
}
a {
    text-decoration: none;
    color: inherit;
}

.white1x34 {
    display: block;
    height: 34px;
    padding: 0;
    border: 1px solid #b10c28;
    border-radius: 3px;
    background-color: #fff;
    color: #bb162b;
    font-weight: bold;
    text-align: center;
    line-height: 34px;
    margin-right: 8px;
}
.red1x34 {
    display: block;
    height: 34px;
    padding: 0;
    border: 1px solid #b10c28;
    border-radius: 3px;
    background: url(resources/assets/img/error/red1x34.png) repeat-x 0 0;
    background-size: 1px 34px;
    color: #fff;
    font-weight: bold;
    text-align: center;
    line-height: 34px;
    margin-left: 8px;
}
</style>

<meta charset="UTF-8">
<title>에러 발생</title>
</head>
<body>
<center>

<br>
<br>
<br>

	<div id="content">
		<div class="taC mt25 pb20 borB"><!-- 2015-03-03 pb20 클래스 추가 -->
			<p><img src="resources/assets/img/error/error_txt1.png" alt="ERROR 서비스 이용에 불편을 드려 죄송합니다" width="185" /></p>
			<p class="mt15">방문하시려는  <span style="color: #bb162b !important;">웹페이지의 주소가 잘못 입력</span><br/>되었거나, <span style="color: #bb162b !important;">변경 또는 삭제</span>되어 <br/>요청하신 페이지를 찾을 수 없습니다. <br/>새로 고침을 하시거나  페이지 확인 후 <br/>다시 접속해 주시기 바랍니다.</p>
		</div>
		<div class="btsCon2 mt20 taC">
			<span><a href="javascript:history.back();" class="white1x34">이전</a></span>
			<span><a href="home.do" class="red1x34">메인으로</a></span>
		</div>
	</div><!-- // content -->

</body>
</html>