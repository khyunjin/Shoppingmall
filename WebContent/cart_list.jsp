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
		<img alt="product" src="./image/<%= dto.getImage() %>"><p>
		상품정보(이름) <%= dto.getName() %><p>
		판매가 <%= dto.getPrice2() %><p>
		수량 <%= dto.getQuantity() %><p>
		<%= dto.getCartnum() %>
<input type="button" value="주문하기">
<input type="button" onclick="location.href='./cartdel?cartnum=<%= dto.getCartnum() %>';" value="삭제하기">
<% } %>
</body>
</html>