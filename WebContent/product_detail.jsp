<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.ProductDAO" %>
<%@ page import="product.ProductDTO" %>
<%@ page import="java.util.ArrayList"%>
<%@ include file="nav_user.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="nav_product.jsp" %>
<%
	int prodnum = Integer.parseInt(request.getParameter("prodnum"));
	ProductDTO prod = new ProductDAO().productget(prodnum); 
	String cartid = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<script>
function inCheck() {
	var id = "${id}";
	if(id == ""){
		if(confirm("로그인이 필요한 서비스 입니다. 로그인 하시겠습니까?")){
			location.href = "user_login.jsp";
		} else {
			return;
		}
	} else {
		document.cartfrm.submit();
	}
}

function count(t) {													// plus, minus
	const quantity = document.getElementById('quantity');
	let number = document.getElementById('quantity').value;
	
	var price = document.getElementById('price').value;
	var total = document.getElementById('totalp');
	
	if(t == 'plus') {
		number = parseInt(number) + 1;								// number 값을 문자열에서 숫자로 변환해(pareInt) +1 해준다.   
	}else if(t == 'minus') {
		number = parseInt(number) - 1;								// number 값을 문자열에서 숫자로 변환해(pareInt) -1 해준다.
		if(number<1) {
			alert("수량은 1개 이상 입력해주세요");
			return;
		}
	}
	
	quantity.value = number;
	total.value = parseInt(price) * number;
}
</script>
<style>
.detail-box {
	width: 1200px;
	margin: 0 auto;
	
}
.img-box {
	width: 600px;
	height: 500px;
}
.detail-box img {
	width: 100%;
}
.text-box {
	text-align: right;
}
</style>
<meta charset="UTF-8">
</head>
<body>
<form name="cartfrm" method="post" action="./cartin">
<div class="detail-box">
	<div class="img-box">
		<img alt="product" src="./image/<%= prod.getImage() %>">
	</div>
	<div class="text-box">
		<input type="hidden" name="prodnum" value="<%= prod.getProdnum() %>">
		<input type="hidden" name="id" value="<%= cartid %>">
		<input type="hidden" name="cartcolor" value="<%= prod.getProdcolor() %>">
		<input type="hidden" name="cartsize" value="<%= prod.getProdsize() %>">
		<input type="hidden" name="cartimg" value="<%= prod.getImage() %>">
		<input type="hidden" name="price" id="price" value="<%= prod.getPrice2() %>">
		<b><%= prod.getName() %></b><p>
		<%= prod.getContent() %><p>
		<select name="prodcolor">
			<option value="">---색상을 선택해주세요(필수)---</option>
			<% 
			ArrayList<ProductDTO> colorlist = new ProductDAO().colorlist(prodnum);
			for(ProductDTO dto : colorlist)  { %>
			<option value="<%= dto.getProdcolor() %>"><%= dto.getProdcolor() %></option>
			<% } %>
		</select><p>
		<select name="prodsize">
			<option value="">---사이즈를 선택해주세요(필수)---</option>
			<% 
			ArrayList<ProductDTO> sizelist = new ProductDAO().sizelist(prodnum);
			for(ProductDTO dto : sizelist)  { %>
			<option value="<%= dto.getProdsize() %>"><%= dto.getProdsize() %></option>
			<% } %>
		</select><p>
		<input type="text" value="<%= prod.getPrice2() %>" name="totalp" id="totalp" readonly><p>
		<input type="button" value="+" onclick="count('plus')">
		<input type="text" id="quantity" name="quantity" value="1" readonly>
		<input type="button" value="-" onclick="count('minus')"><p>
	<input type="button" onclick="inCheck()" value="장바구니 담기">
	</div>
</div>
</form>
</body>
</html>