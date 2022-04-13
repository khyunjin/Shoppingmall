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
img {
	width: 200px;
}
</style>
<meta charset="UTF-8">
</head>
<body>
주문 상세 정보
<%		
	int ordernum = Integer.parseInt(request.getParameter("ordernum"));

	ArrayList<OrderDTO> orderdetail = new ProductDAO().orderdetail(ordernum);
		for (OrderDTO dto : orderdetail) { 
%>
구매자정보<p>
이름<%= dto.getUsername() %><p>
이메일<%= dto.getEid() %>@<%= dto.getEdomain() %><p>
휴대폰 번호<%= dto.getPhone1() %>-<%= dto.getPhone2() %>-<%= dto.getPhone3() %><p>

받는사람 정보<p>
이름<%= dto.getOrdername() %><p>
배송주소 <%= dto.getOrderadd() %><p>
연락처<%= dto.getOrderphone() %><p>
배송시 요청사항 <%= dto.getOrderreq() %><p>

상품정보<p>
사진<img alt="product" src="./image/<%= dto.getImage() %>"><p>
제품명 <%= dto.getName() %><p>

색상 <%= dto.getProdcolor() %><p>
사이즈 <%= dto.getProdsize() %><p>
수량 <%= dto.getQuantity() %><p>
총 가격 <%= dto.getPrice() %>
<% } %>
</body>
</html>