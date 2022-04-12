<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="nav_user.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="nav_product.jsp" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.OrderDTO" %>
<%@ page import="product.ProductDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% 
	String sessionid = (String)session.getAttribute("id");
	UserDTO user = new UserDAO().userget(sessionid); 
	
	int ordernum = Integer.parseInt(request.getParameter("ordernum"));
	OrderDTO order = new ProductDAO().orderget(ordernum);
	
	int prodnum = Integer.parseInt(request.getParameter("prodnum"));
	ProductDTO prod = new ProductDAO().productget(prodnum);
%>
<head>
<style>
img {
	width: 200px;
}
</style>
<meta charset="UTF-8">
</head>
<body>
주문 상세 정보
구매자정보<p>
<form name="frm" method="post" action="./orderin">
<input type="hidden" name="id" value="<%= user.getId() %>">
이름<%= user.getName() %><p>
이메일<%= user.getEid() %>@<%= user.getEdomain() %><p>
휴대폰 번호<%= user.getPhone1() %>-<%= user.getPhone2() %>-<%= user.getPhone3() %><p>

받는사람 정보<p>
이름<%= order.getOrdername() %><p>
배송주소 <%= order.getOrderadd() %><p>
연락처<%= order.getOrderphone() %><p>
배송시 요청사항 <%= order.getOrderreq() %><p>

상품정보<p>
사진<img alt="product" src="./image/<%= prod.getImage() %>"><p>
제품명 <%= prod.getName() %><p>

색상 <%= order.getProdcolor() %><p>
사이즈 <%= order.getProdsize() %><p>
수량 <%= order.getQuantity() %><p>
총 가격 <%= order.getPrice() %>
<input type="submit" value="주문하기">
</form>
</body>
</html>