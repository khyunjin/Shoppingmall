<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.OrderDTO" %>
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
주문조회화면
<%		
	String sessionid = (String)session.getAttribute("id");

	ArrayList<OrderDTO> orderlist = new ProductDAO().orderlist(sessionid);
		for (OrderDTO dto : orderlist) { 
%>
	<form name="cartfrm" method="post" action="./cartamount">
		<input type="hidden" name="ordernum" value="<%= dto.getOrdernum() %>">
		
		주문번호<a href="product_orderdetail.jsp?ordernum=<%= dto.getOrdernum() %>"><%= dto.getOrdernum() %></a><p>
		
		이미지 <a href="product_detail.jsp?prodnum=<%= dto.getProdnum() %>"><img alt="product" src="./image/<%= dto.getImage() %>"></a><p>
		
		상품정보(이름) <a href="product_detail.jsp?prodnum=<%= dto.getProdnum() %>"><%= dto.getName() %></a><p>
		색상 <%= dto.getProdcolor() %><p>
		사이즈 <%= dto.getProdsize() %><p>
		
		수량 <%= dto.getQuantity() %><p>
		판매가 <%= dto.getPrice() %><p>
		배송상태 <%= dto.getDeliveryyn() %><p>

	</form>
<% } %>
</body>
</html>