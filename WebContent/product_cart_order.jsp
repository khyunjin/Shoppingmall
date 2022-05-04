<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ include file="nav_user.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="nav_product.jsp" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.CartDTO" %>
<!DOCTYPE html>
<html>
<% 
	UserDTO user = new UserDAO().userget(id);
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
	width: 180px;
}
.text-box  {
	padding: 10px;
	height: 35px;
	border: 1px solid lightgray;
}
.bottom-box{
	width: 1200px;
	margin: 0 auto;
}
#order {
	margin: auto;
	display: block;
	width: 300px;
	height: 60px;
	border: 0;
	outline: 0;
	border-radius: 3px;
	background-color: #797065;
	color: white;
	font-size: 20px;
}
#Allorder {
	margin: auto;
	display: block;
	width: 300px;
	height: 60px;
	border: 0;
	outline: 0;
	border-radius: 3px;
	background-color: #797065;
	color: white;
	font-size: 20px;
}
</style>
<meta charset="UTF-8">
</head>
<body>
<div class="order-box">
	<h3>주문/결제</h3>
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
	<form name="frm" method="post" action="./orderin">
	<%
		int AllQuantity = 0;
		int AllPrice = 0;
		String sessionid = (String)session.getAttribute("id");
		ArrayList<CartDTO> cartlist = new ProductDAO().cartlist(sessionid);
		for (CartDTO dto : cartlist) { 
			AllQuantity += dto.getQuantity();
			AllPrice += dto.getPrice2() * dto.getQuantity();
	%>
		<input type="hidden" name="prodnum" value="<%= dto.getProdnum() %>">
		<input type="hidden" name="quantity" value="<%= dto.getQuantity() %>">
		<input type="hidden" name="prodcolor" value="<%= dto.getProdcolor() %>">
		<input type="hidden" name="prodsize" value="<%= dto.getProdsize() %>">
		<input type="hidden" name="pname" value="<%= dto.getName() %>">
		<span style="width: 180px; text-align: center;">
			<img alt="product" src="./image/<%= dto.getImage() %>"></span>
		<span style="width: 350px; text-align: center;">
			<%= dto.getName() %></span>
		<span style="width: 350px; text-align: center;">
			<%= dto.getProdcolor() %><br><%= dto.getProdsize() %></span>
		<span style="width: 120px; text-align: center;">
			<%= dto.getQuantity() %></span>
		<span style="width: 150px; text-align: center;">
			<%= dto.getPrice2() * dto.getQuantity() %>원</span>
<% } %>
	<div class="bottom-box">
	<hr width="1200px">
		<span style="width:550px; text-align: center;">합계</span>
		<span style="width:550px; text-align: center;">총 상품금액</span>
	<hr width="1200px">
		<input type="hidden" name="allquantity" value="<%= AllQuantity %>">
		<input type="hidden" name="totalprice" value="<%= AllPrice %>">
		<span style="width:550px; text-align: center;"><%= AllQuantity %></span>
		<span style="width:550px; text-align: center;"><%= AllPrice %>원</span>
	<hr width="1200px">
	</div>
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
		<span class="span2"><input class="text-box" type="text" name="ordername" value="<%= user.getName() %>"></span><br>
		<span class="span1">배송주소</span>
		<span class="span2"><input class="text-box" style="width:500px;" type="text" name="orderadd" value="<%= user.getAddress() %><%= user.getDetailAddress() %><%= user.getExtraAddress() %>"></span><br>
		<span class="span1">연락처 </span>
		<span class="span2"><input class="text-box" type="text" name="orderphone" value="<%= user.getPhone1() %>-<%= user.getPhone2() %>-<%= user.getPhone3() %>"></span><br>
		<span class="span1">배송시 요청사항 </span>
		<span class="span2"><input class="text-box" style="width:500px;" type="text" name="orderreq"></span><br>
	<hr width="1200px">
	<br>
	<div class="bottom-box">
		<input id="order" type="submit" value="주문하기">
	</div>
</form>
</div>
</body>
</html>