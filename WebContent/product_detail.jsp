<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.ProductDTO" %>
<%@ include file="nav_user.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="nav_product.jsp" %>
<%
	int prodnum = Integer.parseInt(request.getParameter("prodnum"));
	ProductDTO prod = new ProductDAO().productget(prodnum); 
	String cartid = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<style>
.detail-box {
	width: 1200px;
	margin: 0 auto;
	
}
.img-box {
	width: 600px;
	height: 500px;
}
.detail-box img {
	width: 100%;
}
.text-box {
	text-align: right;
}
</style>
<meta charset="UTF-8">
</head>
<body>
<form name="cartfrm" method="post" action="./cartin">
<div class="detail-box">
	<div class="img-box">
		<img alt="product" src="./image/<%= prod.getImage() %>">
	</div>
	<div class="text-box">
		<input type="hidden" name="prodnum" value="<%= prod.getProdnum() %>">
		<input type="hidden" name="id" value="<%= cartid %>">
		<input type="hidden" name="cartcolor" value="<%= prod.getOpcolor() %>">
		<input type="hidden" name="cartsize" value="<%= prod.getOpsize() %>">
		<input type="hidden" name="cartimg" value="<%= prod.getImage() %>">
		<b><%= prod.getName() %></b><p>
		<%= prod.getPrice2() %><p>
		<%= prod.getContent() %><p>
		<%= prod.getOpcolor() %><p>
		<%= prod.getOpsize() %><p>
	<input type="text" name="quantity"><p>
	<input type="submit" value="장바구니 담기">
	</div>
</div>
</form>
</body>
</html>