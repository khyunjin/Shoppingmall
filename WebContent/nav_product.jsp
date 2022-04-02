<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<style>
.productnav {
	height: 30px;
	width: 1500px;
	margin: 0 auto;
	background-color: white;
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}
</style>
<link href="./css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="./css/dropdown.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
</head>
<body>
<div class="productnav">
	<div class="dropdown">
		<button class="dropbtn"><a href="./productlist?bestyn=y"><b>BEST</b></a></button>
	</div>
	<div class="dropdown">
		<button class="dropbtn"><a href="./productlist?newyn=y"><b>NEW IN</b></a></button>
	</div>
	<div class="dropdown">
		<button class="dropbtn"><a href="./productlist?kind=1">OUTER</a></button>
		<div class="dropdown-content">
			<a href="./productlist?subkind=101">jacket</a>
			<a href="./productlist?subkind=102">coat</a>
		</div>
	</div>
	<div class="dropdown">
		<button class="dropbtn"><a href="./productlist?kind=2">TOP</a></button>
		<div class="dropdown-content">
			<a href="./productlist?subkind=201">t-shirts</a>
			<a href="./productlist?subkind=202">shirts&blouse</a>
			<a href="./productlist?subkind=203">sweater</a>
		</div>
	</div>
	<div class="dropdown">
		<button class="dropbtn"><a href="./productlist?kind=3">PANTS</a></button>
		<div class="dropdown-content">
			<a href="./productlist?subkind=301">long</a>
			<a href="./productlist?subkind=302">short</a>
		</div>
	</div>
	<div class="dropdown">
		<button class="dropbtn"><a href="./productlist?kind=4">DRESS&SKIRT</a></button>
	</div>
</div>
</body>
</html>