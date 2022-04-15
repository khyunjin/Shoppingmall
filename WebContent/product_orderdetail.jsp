<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="nav_user.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="nav_product.jsp" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.OrderDTO" %>
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
}
.span1 {
	width: 150px; 
	text-align: right; 
	margin: 10px; 
	padding-rightL: 20px;
	margin-bottom: 20px;
}
.span2 {
	width: 980px; 
	text-align: left; 
	margin: 10px; 
	margin-left: 20px;
	margin-bottom: 20px;
}
img {
	width: 200px;
}
</style>
<meta charset="UTF-8">
</head>
<body>
<div class="order-box">
	<h3>주문 상세 정보</h3>
	<hr width="1200px">
	<br>
	<h4>상품 정보</h4>
	<hr width="1200px">
		<span style="width: 180px; text-align: center;">이미지</span>
		<span style="width: 350px; text-align: center;">상품명</span>
		<span style="width: 350px; text-align: center;">선택한 옵션</span>
		<span style="width: 120px; text-align: center;">수량</span>
		<span style="width: 150px; text-align: center;">합계</span>
	<hr width="1200px">
	<%		
		int ordernum = Integer.parseInt(request.getParameter("ordernum"));
		ArrayList<OrderDTO> orderdetail = new ProductDAO().orderdetail(ordernum);
		for (OrderDTO dto : orderdetail) { 
	%>
		<span style="width: 180px; text-align: center;">
			<img alt="product" src="./image/<%= dto.getImage() %>"></span>
		<span style="width: 350px; text-align: center;">
			 <%= dto.getName() %></span>
		<span style="width: 350px; text-align: center;">
			<%= dto.getProdcolor() %><br><%= dto.getProdsize() %></span>
		<span style="width: 120px; text-align: center;">
			<%= dto.getQuantity() %></span>
		<span style="width: 150px; text-align: center;">
			<%= dto.getPrice() %></span>
	<hr width="1200px">
	<br>
	<h4>구매자 정보</h4>
	<hr width="1200px">
		<span class="span1">이름</span>
		<span class="span2"><%= dto.getUsername() %></span><br>
		<span class="span1">이메일</span>
		<span class="span2"><%= dto.getEid() %>@<%= dto.getEdomain() %></span><br>
		<span class="span1">휴대폰 번호</span>
		<span class="span2"><%= dto.getPhone1() %>-<%= dto.getPhone2() %>-<%= dto.getPhone3() %></span><br>
	<hr width="1200px">
	<br>
	<h4>받는사람 정보</h4>
	<hr width="1200px">
		<span class="span1">이름</span>
		<span class="span2"><%= dto.getOrdername() %></span><br>
		<span class="span1">배송주소</span>
		<span class="span2"><%= dto.getOrderadd() %></span><br>
		<span class="span1">연락처 </span>
		<span class="span2"><%= dto.getOrderphone() %></span><br>
		<span class="span1">배송시 요청사항 </span>
		<span class="span2">
			<%
				String Orderreq = dto.getOrderreq();
				if(Orderreq == null) { out.println("배송시 요청사항 없음"); }
				if(Orderreq != null) { out.println(Orderreq); }
			%></span><br>
	<hr width="1200px">
	<br>
<% } %>
</body>
</html>