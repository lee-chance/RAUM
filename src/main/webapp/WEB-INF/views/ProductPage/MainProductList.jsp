<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
	#lili{ 
	float : left; 
	margin-left : 5px; 
	margin-right : 5px; 
	display : inline; 
	list-style : none; 
	padding-auto : 0px; }
	#MainProductList.ul{float : left; display: block;}
.page_wrap {
	float:bottom;
	text-align:center;
	font-size:0; }
.page_nation {
	display:inline-block;}
.page_nation .none {
	display:none;}
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;}
.page_nation .arrow {
	border:1px solid #ccc;}
.page_nation .pprev {
	background:#f8f8f8 url('img/page_pprev.png') no-repeat center center;
	margin-left:0;}
.page_nation .prev {
	background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
	margin-right:7px;}
.page_nation .next {
	background:#f8f8f8 url('img/page_next.png') no-repeat center center;
	margin-left:7px;}
.page_nation .nnext {
	background:#f8f8f8 url('img/page_nnext.png') no-repeat center center;
	margin-right:0;}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;}
	

</style>


<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
		<div id="MainProductList" align="center">
				<!-- <ul>
					<li colspan="3">[[TOP]]</li>
				</ul>
				<ul>
					<li colspan="3">배너</li>
				</ul> -->
				
				<!-- product colmns image, name, price 고정 -->
				
				<!-- text-align: center; -->
				<ul align="center" style="float:center;"><!--  style="float:left;"  margin:0auto;"  -->
					<c:forEach items = "${productList}" var="pro">
						<li id="lili">
							<a href="MainProductDetail.do?pSeq=${pro.seq }">
								<img src="http://192.168.0.80:8080/RAUM/resources/image/${pro.image }" width="170" height="200" style="padding:30px;"><br>
								${pro.name } <br>
								${pro.price } <br>
								${pro.category }
							</a>
						</li>
					</c:forEach>
				</ul>
<!-- 
			<div class="page_wrap" >
			   <div class="page_nation">
			      <a class="arrow pprev" href="#"></a>
			      <a class="arrow prev" href="#"></a>
			      <a href="#" class="active">1</a>
			      <a href="#">2</a>
			      <a href="#">3</a>
			      <a href="#">4</a>
			      <a href="#">5</a>
			      <a href="#">6</a>
			      <a href="#">7</a>
			      <a href="#">8</a>
			      <a href="#">9</a>
			      <a href="#">10</a>
			      <a class="arrow next" href="#"></a>
			      <a class="arrow nnext" href="#"></a>
			   </div>
			</div> -->
		
	
	
</body>
</html>