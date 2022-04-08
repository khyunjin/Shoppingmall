<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%@ include file="nav_user.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="nav_product.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<% 
	UserDTO user = new UserDAO().userget(id); 
%>
<head>
<link href="./css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">

</head>
<body>
<a href="">내가쓴글</a>
<a href="user_infoupdate.jsp?id=<%= id %>">회원정보수정</a>
<a href="product_cartlist.jsp">장바구니</a>
<a href="">주문조회</a>
<a href="">반품 신청/조회</a>
<a href="./UserDelServlet">회원탈퇴</a>
</body>
</html>