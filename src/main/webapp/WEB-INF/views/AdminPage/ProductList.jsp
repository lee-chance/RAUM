<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
#productListTable, #productListTable.tr, #productListTable.td {	
	border: 1px solid black;
	border-collapse:collapse;	
	margin: auto;
	text-align: center;
}
h3, p {
	text-align: center;
}
td, tr{
	border: none;
}
#productListTable {
    width: 800px;
   }
</style>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<p/>
	
	<!-- 상단 선택 메뉴 -->
	
	    <table width="800" align="center">
	    	<tr>
	    		<td align="right"><a href="/ProjectShare/addProduct.do"><span style="color: red; font-size: x-large;">제품등록</span></a><!-- <input type="text" name="search"><input type="button" value="검색"> --></td>
	    	</tr>
	    </table><!-- "http://192.168.0.113:8080/ProjectShare/AdminPage/ProductStock.jsp" -->
		<table id="productListTable" border="1" class="order_table1" width="800" align="center">
		<colgroup>
			<col width="10%"/><col width="10%"/>
			<col width="*"/><col width="30%"/>
		</colgroup>
		<thead>
			<tr><!-- product 만 먼저 처리 나머지 추가 -->
				<!-- product_num, image, name, price  -->
				<th bgcolor="#F2F2F2">제품번호</th>
				<th bgcolor="#F2F2F2">이미지</th>
				<th bgcolor="#F2F2F2">제품명</th>
				<th bgcolor="#F2F2F2">가격</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${productList}" var="pro">
			<tr>
				<td>${pro.product_num }</td>
				<td><img src="http://192.168.0.80:8080/ProjectShare/${pro.image }" width="80" height="80"></td>
				<td>${pro.name }</td><!-- <a href="ProductDetail.do?product_num=${pro.product_num}"> ${pro.name } </a> -->
				<td>${pro.price }</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
	<br/>
</body>
</html>