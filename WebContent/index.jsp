<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="nav_user.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="nav_product.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="./css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="./css/indexslide.css" rel="stylesheet" type="text/css">
<meta charset="UTF-8">
</head>
<body>
<div class="slide-box">
	<input type="radio" name="slide" id="slide1" checked>
	<input type="radio" name="slide" id="slide2">
	<input type="radio" name="slide" id="slide3">
	<input type="radio" name="slide" id="slide4">
	<div class="slide-list">
		<div class="slide-item">
			<div>
				<label for="slide4" class="left"></label>
				<label for="slide2" class="right"></label>
				<a><img src="./image/slide1.jpg" alt="slideimg"></a>
			</div>
		</div>
		<div class="slide-item">
			<div>
				<label for="slide1" class="left"></label>
				<label for="slide3" class="right"></label>
				<a><img src="./image/slide2.jpg" alt="slideimg"></a>
			</div>
		</div>
		<div class="slide-item">
			<div>
				<label for="slide2" class="left"></label>
				<label for="slide4" class="right"></label>
				<a><img src="./image/slide3.jpg" alt="slideimg"></a>
			</div>
		</div>
		<div class="slide-item">
			<div>
				<label for="slide3" class="left"></label>
				<label for="slide1" class="right"></label>
				<a><img src="./image/slide4.jpg" alt="slideimg"></a>
			</div>
		</div>
	</div>
</div>
</body>
</html>