<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CartPage</title> <!-- 購物車選購頁面-->

</head>
<body>
<table cellpadding="2" cellspacing="2" border="1">
		<tr>
			<th>清除</th>
			<th>商品編號</th>
			<th>商品名稱</th>
			<th>商品照片</th>
			<th>商品價格</th>
			<th>選購數量</th>
			<th>小計</th>
		</tr>
		<c:set var="total" value="0"></c:set>
		<c:forEach var="item" items="${sessionScope.cart }">
			<c:set var="total" value="${total + item.product.price * item.quantity }"></c:set>
			<tr>
				<td align="center">
					<a href="${pageContext.request.contextPath }/cart?action=remove&id=${item.product.id}"
					onclick="return confirm('是否確定?')">Remove</a>
				</td>
				<td>${item.product.id }</td>
				<td>${item.product.name }</td>
				<td>
					<img src="${pageContext.request.contextPath }/assets/images/${item.product.photo}" width="120px">
				</td>
				<td>${item.product.price }</td>
				<td>${item.quantity}</td>
				<td>${item.product.price * item.quantity }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" align="right">Total</td>
			<td>${total}</td>
		</tr>
	</table>
	<br>
	<a href="../product/">繼續購物</a>

</body>
</html>