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
.order-box {
	font-size: 14px;
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
	width: 150px;
}
a {
	text-decoration: none;
	color: black;
}
</style>
<meta charset="UTF-8">
</head>
<body>
<div class="order-box">
	<h4>주문한 상품</h4>
	<hr width="1200px">
		<span style="width: 180px;">주문일자</span>
		<span style="width: 150px;">이미지</span>
		<span style="width: 350px;">상품정보</span>
		<span style="width: 150px;">상품금액</span>
		<span style="width: 150px;">배송상태</span>
		<span style="width: 180px;">주문상세</span>
	<hr width="1200px">
	<form name="cartfrm" method="post" action="./cartamount">
	<%		
		String sessionid = (String)session.getAttribute("id");
		ArrayList<OrderDTO> orderlist = new ProductDAO().orderlist(sessionid);
		for (OrderDTO dto : orderlist) { 
	%>
		<input type="hidden" name="ordernum" value="<%= dto.getOrdernum() %>">
		<span style="width: 180px;">
			<%= dto.getOrderindate() %></span>
		<span style="width: 150px;">
			<a href="product_detail.jsp?prodnum=<%= dto.getProdnum() %>"><img alt="product" src="./image/<%= dto.getImage() %>"></a></span>
		<span style="width: 350px;">
			<%= dto.getName() %>
			<br>[옵션: <%= dto.getProdcolor() %> / <%= dto.getProdsize() %> / <%= dto.getQuantity() %>개 ]</span>
		<span style="width: 150px;">
			<%= dto.getPrice() %>원</span>
		<span style="width: 150px;">
			<% 
				String delivery = dto.getDeliveryyn();
				if(delivery.equals("y")) { out.println("배송중"); } 
				if(delivery.equals("n")) { out.println("배송준비중"); }
				if(delivery.equals("f")) { out.println("배송완료"); }
			%></span>
		<span style="width: 180px;">
			<%
				String ordernum = dto.getOrdernum();
				if(ordernum.equals(ordernum))  { 
			%>
			<a href="./orderdetail?ordernum=<%= dto.getOrdernum() %>"><%= dto.getOrdernum() %><br>(주문번호)</a></span>	
			<% } %>
	</form>
<% } %>
</div>
</body>
</html>