<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.UserDTO" %>
<%
    request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id"); 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style>
.usernav-box {
	padding: 10px;
	font-size: 14px;
	background-color: #D8D3CD;
	margin: 0 auto;
}
.usernav-box a {
	text-decoration: none;
	padding: 10px;
	color: white;
}
.usernav {
	width: 1470px;
	text-align: right;
}
</style>
<meta charset="UTF-8">
</head>
<body>
	<div class="usernav-box">
		<div class="usernav">
		<%if (id != null) {%>
			<a class="" href="user_logout.jsp">LOGOUT</a>
			<a class="" href="user_mypage.jsp">MYFAGE</a>
			<a class="" href="./cartlist">MYCART</a>
		<%} else {%>
			<a class="" href="user_login.jsp">LOGIN</a>
			<a class="" href="user_infoinsert.jsp">JOIN</a>
		<%}%>
		</div>
	</div>
</body>
</html>