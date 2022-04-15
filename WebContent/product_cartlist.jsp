<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.CartDTO" %>
<%@ page import="java.util.ArrayList"%>
<%@ include file="nav_user.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="nav_product.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style>
.cart-box {
	width: 1200px;
	padding-top: 30px;
	margin: 0 auto;
	margin-bottom: 100px;
}
span {
	display:inline-block; 
	text-align: center;
}
img {
	width: 180px;
}
#quantity  {
	width: 50px;
	text-align: center;
	border: 1px solid lightgray;
}
#submit {
	border: 1px solid lightgray;
	margin: 3px;
	width: 60px;
	height: 30px;
	background-color: white;
	color: gray;
	border-radius: 3px;
	box-shadow: 0px 1px 1px 1px lightgray;
}
#order {
	border: 1px solid #797065;
	margin: 3px;
	width: 100px;
	height: 30px;
	background-color: #797065;
	color: white;
	border-radius: 3px;
	box-shadow: 0px 1px 1px 1px lightgray;
}
#delete {
	border: 1px solid lightgray;
	margin: 3px;
	width: 100px;
	height: 30px;
	background-color: white;
	color: gray;
	border-radius: 3px;
	box-shadow: 0px 1px 1px 1px lightgray;
}
a {
	text-decoration: none;
	color: black;
}
</style>
<meta charset="UTF-8">
</head>
<body>
<div class="cart-box">
	<h4>장바구니</h4>
	<hr width="1200px">
		<span style="width: 180px;">이미지</span>
		<span style="width: 450px;">상품정보</span>
		<span style="width: 150px;">판매가</span>
		<span style="width: 120px;">수량</span>
		<span style="width: 120px;">합계</span>
		<span style="width: 150px;">선택</span>
	<hr width="1200px">
	<form name="cartfrm" method="post" action="./cartamount">
	<%
		String sessionid = (String)session.getAttribute("id");
		ArrayList<CartDTO> cartlist = new ProductDAO().cartlist(sessionid);
		for (CartDTO dto : cartlist) { 
	%>
		<input type="hidden" name="cartnum" value="<%= dto.getCartnum() %>">
		
		<span style="width: 180px;">
			<a href="product_detail.jsp?prodnum=<%= dto.getProdnum() %>"><img alt="product" src="./image/<%= dto.getImage() %>"></a></span>
		<span style="width: 450px;">
			<a href="product_detail.jsp?prodnum=<%= dto.getProdnum() %>"><%= dto.getName() %></a>
		    <br>[옵션: <%= dto.getProdcolor() %> / <%= dto.getProdsize() %> ]</span>
		<span style="width: 150px;">
			<%= dto.getPrice2() %>원</span>
		<span style="width: 120px;">
			<input id="quantity" type="text" name="quantity" value="<%= dto.getQuantity() %>"><br>
			<input id="submit" type="submit" value="변경"></span>
		<span style="width: 120px;">
			<%= dto.getPrice2() * dto.getQuantity() %>원</span>
		<span style="width: 150px;">
			<input id="order" type="button" value="주문">
			<input id="delete" type="button" onclick="location.href='./cartdel?cartnum=<%= dto.getCartnum() %>'" value="삭제"></span>
	</form>
<% } %>
</div>
</body>
</html>