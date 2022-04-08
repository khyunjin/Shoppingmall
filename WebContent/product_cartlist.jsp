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
img {
	width: 200px;
}
</style>
<meta charset="UTF-8">
</head>
<body>
장바구니 화면
<%		
	String sessionid = (String)session.getAttribute("id");

	ArrayList<CartDTO> cartlist = new ProductDAO().cartlist(sessionid);
		for (CartDTO dto : cartlist) { 
%>
	<form name="cartfrm" method="post" action="./cartamount">
		<input type="hidden" name="cartnum" value="<%= dto.getCartnum() %>">
		<a href="product_detail.jsp?prodnum=<%= dto.getProdnum() %>"><img alt="product" src="./image/<%= dto.getImage() %>"></a><p>
		상품정보(이름) <a href="product_detail.jsp?prodnum=<%= dto.getProdnum() %>"><%= dto.getName() %></a><p>
		판매가 <%= dto.getPrice2() * dto.getQuantity() %><p>
		수량	<input type="text" name="quantity" value="<%= dto.getQuantity() %>"><input type="submit" value="변경하기"><p>
		색상 <%= dto.getProdcolor() %><p>
		사이즈 <%= dto.getProdsize() %><p>
		<input type="button" value="주문하기">
		<input type="button" onclick="location.href='./cartdel?cartnum=<%= dto.getCartnum() %>'" value="삭제하기">
	</form>
<% } %>
</body>
</html>