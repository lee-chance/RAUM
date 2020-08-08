<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
dl{
   box-sizing: border-box;
   }
dt{
   padding-left: 35px;
   font-size: 18px; 
   text-align: left; 
   font-weight: bold;
   }
dd{
   text-align:left;
   padding-left: 35px;
   margin: 5px 0;
   }
</style>
<title>Insert title here</title>
</head>
<body>

			<div style="position : absolute; height: 350px; width: 200px; border:3px solid black ">
			<h2 style="margin-bottom:30px;">My page 메뉴</h2>
			
			
			<dl>
			<dt>My쇼핑정보</dt>
			<dd><a href="/ProjectShare/orderList.do">- 주문 내역</a></dd>
			</dl>
			
			
			<dl>
			<dt>My서비스정보</dt>
			<dd><a href="/ProjectShare/counSeling.do">- 1:1 상담내역</a></dd>
			<dd><a href="/ProjectShare/myReview.do">- 이용후기</a></dd>
			</dl>
			
			
			<dl>
			<dt>My개인정보</dt>
			<dd><a href="/ProjectShare/userInfo.do">- 회원정보관리</a></dd>
			<dd><a href="/ProjectShare/memberOut.do">- 회원탈퇴</a></dd>
			</dl>
			
			</div>

</body>
</html>