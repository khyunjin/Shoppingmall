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
<%
	UserDTO user = new UserDAO().userget(id);
	String ordernum = request.getParameter("ordernum");
	OrderDTO order = new ProductDAO().orderget(ordernum);
%>
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
.bottom-box{
	width: 1200px;
	margin: 0 auto;
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
		int AllQuantity = 0;
		int TotalPrice = 0;
		ArrayList<OrderDTO> orderdetail = new ProductDAO().orderdetail(ordernum);
		for (OrderDTO dto : orderdetail) { 
			AllQuantity = dto.getAllquantity();
			TotalPrice = dto.getTotalprice();
	%>
		<span style="width: 180px; text-align: center;">
			<a href="product_detail.jsp?prodnum=<%= dto.getProdnum() %>"><img alt="product" src="./image/<%= dto.getImage() %>"></a></span>
		<span style="width: 350px; text-align: center;">
			 <%= dto.getName() %></span>
		<span style="width: 350px; text-align: center;">
			<%= dto.getProdcolor() %><br><%= dto.getProdsize() %></span>
		<span style="width: 120px; text-align: center;">
			<%= dto.getQuantity() %></span>
		<span style="width: 150px; text-align: center;">
			<%= dto.getPrice() %></span>
	<% } %>
	
	<div class="bottom-box">
	<hr width="1200px">
		<span style="width:550px; text-align: center;">합계</span>
		<span style="width:550px; text-align: center;">총 상품금액</span>
	<hr width="1200px">
		<span style="width:550px; text-align: center;"><%= AllQuantity %></span>
		<span style="width:550px; text-align: center;"><%= TotalPrice %>원</span>
		
	<hr width="1200px">
	<br>
	<h4>구매자 정보</h4>
	<hr width="1200px">
		<input type="hidden" name="id" value="<%= user.getId() %>">
		<span class="span1">이름</span>
		<span class="span2"><%= user.getName() %></span><br>
		<span class="span1">이메일</span>
		<span class="span2"><%= user.getEid() %>@<%= user.getEdomain() %></span><br>
		<span class="span1">휴대폰 번호</span>
		<span class="span2"><%= user.getPhone1() %>-<%= user.getPhone2() %>-<%= user.getPhone3() %></span><br>
	<hr width="1200px">
	<br>
	<h4>받는사람 정보</h4>
	<hr width="1200px">
		<span class="span1">이름</span>
		<span class="span2"><%= order.getOrdername() %></span><br>
		<span class="span1">배송주소</span>
		<span class="span2"><%= order.getOrderadd() %></span><br>
		<span class="span1">연락처 </span>
		<span class="span2"><%= order.getOrderphone() %></span><br>
		<span class="span1">배송시 요청사항 </span>
		<span class="span2">
			<%
				String Orderreq = order.getOrderreq();
				if(Orderreq == null) { out.println("배송시 요청사항 없음"); }
				if(Orderreq != null) { out.println(Orderreq); }
			%></span><br>
	<hr width="1200px">
	<br>
</div>
</div>
</body>
</html>