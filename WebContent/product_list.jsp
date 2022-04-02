<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.ProductDTO" %>
<%@ page import="java.util.ArrayList"%>
<%@ include file="nav_user.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="nav_product.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="./css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<style>
.product-list {
	width: 1250px;
	height: 800px;
	margin: 0 auto;
 }
.product-box {
	width: 300px;
	height: 550px;
	padding: 13px;
	margin-left: 10px;
	margin-bottom: 10px;
	box-sizing: border-box;
}
.img-box img{
	width: 275px;
	height: 360px;
}
.img-box a{ 	
	text-decoration: none; 
}
.txt-box {
	text-align: center;
	margin-top: 20px;
}
.cell { 
	float: left;
}
</style>
</head>
<body>
	<div class="product-list">
<%
	String bestyn = request.getParameter("bestyn");

	if(bestyn != null) {
		ArrayList<ProductDTO> bestlist = new ProductDAO().bestlist(bestyn);
		for (ProductDTO dto : bestlist) {
%>
		<div class="product-box cell">
			<div class="img-box">
				<a href="product_detail.jsp?prodnum=<%= dto.getProdnum() %>">
				<img alt="product" src="./image/<%= dto.getImage() %>">
				<div class="txt-box"><%= dto.getName() %><br><%= dto.getPrice2() %></div></a>
			</div>
		</div>
<%
		} 
	}
	
	String newyn = request.getParameter("newyn");
	
	if(newyn != null) {
		ArrayList<ProductDTO> newlist = new ProductDAO().newlist(newyn);
		for (ProductDTO dto : newlist) {
%>
		<div class="product-box cell">
			<div class="img-box">
				<a href="product_detail.jsp?prodnum=<%= dto.getProdnum() %>">
				<img alt="product" src="./image/<%= dto.getImage() %>">
				<div class="txt-box"><%= dto.getName() %><br><%= dto.getPrice2() %></div></a>
			</div>
		</div>
<%
		} 
	}
	
	String kind = request.getParameter("kind");
	
	if(kind != null) {
		ArrayList<ProductDTO> kindlist = new ProductDAO().kindlist(kind);
		for (ProductDTO dto : kindlist) {
%>
		<div class="product-box cell">
			<div class="img-box">
				<a href="product_detail.jsp?prodnum=<%= dto.getProdnum() %>">
				<img alt="product" src="./image/<%= dto.getImage() %>">
				<div class="txt-box"><%= dto.getName() %><br><%= dto.getPrice2() %></div></a>
			</div>
		</div>
<%
		} 
	}
	
	String subkind = request.getParameter("subkind");
	
	if(subkind != null) {
		ArrayList<ProductDTO> subkindlist = new ProductDAO().subkindlist(subkind);
		for (ProductDTO dto : subkindlist) {
%>
		<div class="product-box cell">
			<div class="img-box">
				<a href="product_detail.jsp?prodnum=<%= dto.getProdnum() %>">
				<img alt="product" src="./image/<%= dto.getImage() %>">
				<div class="txt-box"><%= dto.getName() %><br><%= dto.getPrice2() %></div></a>
			</div>
		</div>
<%
		} 
	}
%>
	</div>
</body>
</html>