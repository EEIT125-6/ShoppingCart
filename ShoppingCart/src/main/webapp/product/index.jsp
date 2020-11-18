<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Page</title>
<!-- 商城頁面 -->
</head>
<body>

	<table cellpadding="2" cellspacing="2" border="1">
		<tr>
			<th>商品編號</th>
			<th>商品名稱</th>
			<th>商品照片</th>
			<th>商品價格</th>
			<th>買!</th>
		</tr>
		<c:forEach var="product" items="${products}">
			<tr>
				<td>${product.id}</td>
				<td>${product.name }</td>
				<td><img
					src="${pageContext.request.contextPath }/assets/images/${product.photo}"
					width="120px"></td>
				<td>${product.price}</td>
				<td align="center"><a
					href="Cart/?&action=buy&id=${product.id}">Buy</a></td>
			</tr>
		</c:forEach>
	</table>

</body>
</html>