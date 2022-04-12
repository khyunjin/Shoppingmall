<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="nav_user.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="nav_product.jsp" %>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.ProductDTO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% 
	UserDTO user = new UserDAO().userget(id); 
	int prodnum = Integer.parseInt(request.getParameter("prodnum"));
	ProductDTO prod = new ProductDAO().productget(prodnum); 
	String prodcolor = request.getParameter("prodcolor");
	String prodsize = request.getParameter("prodsize");
	int price = Integer.parseInt(request.getParameter("totalp"));
	int quantity = Integer.parseInt(request.getParameter("quantity"));
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
구매자정보<p>
<form name="frm" method="post" action="./orderin">
<input type="hidden" name="id" value="<%= user.getId() %>">
이름<%= user.getName() %><p>
이메일<%= user.getEid() %>@<%= user.getEdomain() %><p>
휴대폰 번호<%= user.getPhone1() %>-<%= user.getPhone2() %>-<%= user.getPhone3() %><p>

받는사람 정보<p>
이름<input type="text" name="ordername" value="<%= user.getName() %>"><p>
배송주소 <input type="text" name="orderadd" value="<%= user.getAddress() %><%= user.getDetailAddress() %><%= user.getExtraAddress() %>"><p>
연락처 <input type="text" name="orderphone" value="<%= user.getPhone1() %>-<%= user.getPhone2() %>-<%= user.getPhone3() %>"><p>
배송시 요청사항 <input type="text" name="orderreq"><p>

상품정보<p>
<input type="hidden" name="prodnum" value="<%= prod.getProdnum() %>">
<input type="hidden" name="prodcolor" value="<%= prodcolor %>">
<input type="hidden" name="prodsize" value="<%= prodsize %>">
<input type="hidden" name="quantity" value="<%= quantity %>">
사진<img alt="product" src="./image/<%= prod.getImage() %>"><p>
제품명 <%= prod.getName() %><p>
색상 <%= prodcolor %><p>
사이즈 <%= prodsize %><p>
수량 <%= quantity %><p>
총 가격 <%= price %>
<input type="submit" value="주문하기">
</form>
</body>
</html>