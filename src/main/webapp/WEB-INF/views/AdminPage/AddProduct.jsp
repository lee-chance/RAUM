<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">
	
	function blankCheck(f) {
		var productName = f.productName.value.trim();
		var productPrice = f.productPrice.value.trim();

		if (productName.length == 0) {
			alert("상품이름을 입력해주세요.");
			return false;
		} else if (productPrice.length == 0) {
			alert("상품가격을 입력해주세요.");
			return false;
		}
		alert("상품이 등록되었습니다.")
		return true;
	}
	
</script>

<style>
	td
	{
		border:none;
	}
</style>

<meta charset="UTF-8">
<title>관리자 화면</title>
</head>
<body>

	<p/>
	<div align="center">
	
	<br>
	
	<span style="color: red; font-size: x-large;">새로운 상품등록</span>
	
	
	<form action="actionAddProduct.do" method="post" enctype="Multipart/form-data" onsubmit="return blankCheck(this)">
	
	<br>
	<br>
	<table id="addProductTable" border="1">
		<tr>
			<td>카테고리 : </td>
			<td>
				<select name="category">
					<option value="1">구두(정장/행사)</option>
					<option value="2">운동화/스니커즈</option>
					<option value="3">실내화/슬리퍼</option>
					<option value="4">고무/무도/꽃신(기능)</option>
					<option value="5">워커/부츠/장화</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>상품이름 : </td>
			<td><input type="text" name="productName" id="productName"></td>
		</tr>
		<tr>
			<td>상품가격 : </td>
			<td><input type="text" name="productPrice" id="productPrice"></td>
		</tr>
		<tr>
			<td>상품이미지 : </td>
			<td><input type="file" name="productImage"></td>
		</tr>
	</table>
	<br>
	<table id="stockTable">
		<colgroup>
			<col width="50%"/>
			<col width="50%"/>
		</colgroup>
		<tr>
			<th>사이즈</th>
			<th>재고</th>
		</tr>
		<!-- <tr>
			<td>전체</td>
			<td><input type="number" id="productStockAll" value="0" style="width: 50px;"></td>
		</tr> -->
		<c:forEach var="i" begin="230" end="300" step="5">
			<tr>
				<td>${i}</td>
				<td><input type="number" name="productStock${i}" id="productStock" value="0" style="width: 50px;"></td>
			</tr>
		</c:forEach>
	</table>
	
	<br>
	
	<textarea rows="10" cols="100" name="productInformation"></textarea>
	
	<br>
	
	<input type="submit" value="등록">
	
	</form>
</div>
</html>