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
	String sessionid = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<script>
function CartCheck() {
	var id = "${id}";
	if(id == ""){
		if(confirm("로그인이 필요한 서비스 입니다. 로그인 하시겠습니까?")){
			location.href = "user_login.jsp";
		} else {
			return;
		}
	} else {
		if(document.frm.prodcolor.value == ""){
			alert("색상을 선택해주세요.");
			return;
			}
		if(document.frm.prodsize.value == ""){
			alert("사이즈를 선택해주세요.");
			return;
			}
		document.frm.submit();
	}
}

function OrderCheck() {
	var id = "${id}";
	if(id == ""){
		if(confirm("로그인이 필요한 서비스 입니다. 로그인 하시겠습니까?")){
			location.href = "user_login.jsp";
		} else {
			return;
		}
	} else {
		if(document.frm.prodcolor.value == ""){
			alert("색상을 선택해주세요.");
			return;
			}
		if(document.frm.prodsize.value == ""){
			alert("사이즈를 선택해주세요.");
			return;
			}
		document.frm.action = "product_order_direct.jsp";
		document.frm.submit();
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
	padding-top: 30px;
	margin: 0 auto;
	height: 880px;
}
.img-box {
	width: 600px;
	height: 10px;
	margin: 10px;
}
.detail-box img {
	width: 100%;
}
.spec-box {
	margin-left:700px;
	text-align: left;
}
.button {
	width: 500px;
	height: 60px;
	border: 0;
	outline: 0;
	border-radius: 3px;
}
.cart {
	background-color: #797065;
	color: white;
}
.buy {
	background-color: #D8D3CD;
	color: #797065;
}
.option {
	width: 500px;
	padding: 5px;
	border: 1px solid #999;
	border-radius: 3px;
}
.text-box {
	width: 80px;
	border: 0;
	outline: 0;
	font-style: italic;
	font-weight: bolder;
	text-align: center;
}
.quantity-box  {
	width: 30px;
	text-align: center;
	border: 0;
	outline: 0;
}
.count-box {
	width: 40px;
	height: 40px;
	border: 0;
	outline: 0;
}
.bottom-box{
	width: 1200px;
	margin: 0 auto;
}

</style>
<meta charset="UTF-8">
</head>
<body>
<form name="frm" method="post" action="./cartin">
<input type="hidden" name="prodnum" value="<%= prod.getProdnum() %>">
<input type="hidden" name="price" id="price" value="<%= prod.getPrice2() %>">
<input type="hidden" name="id" value="<%= sessionid %>">
<div class="detail-box">
	<div class="img-box">
		<img alt="product" src="./image/<%= prod.getImage() %>">
	</div>
	<div class="spec-box">
		<h3><%= prod.getName() %></h3><p>
		<%= prod.getPrice2() %>원<p><br>
		<%= prod.getContent() %><p>
		<hr width="500px"><p>
		<select class="option" name="prodcolor">
			<option value="">색상을 선택해주세요</option>
			<% 
				ArrayList<ProductDTO> colorlist = new ProductDAO().colorlist(prodnum);
				for(ProductDTO dto : colorlist)  { 
			%>
			<option value="<%= dto.getProdcolor() %>"><%= dto.getProdcolor() %></option>
			<% } %>
		</select><p>
		<select class="option" name="prodsize">
			<option value="">사이즈를 선택해주세요</option>
			<% 
				ArrayList<ProductDTO> sizelist = new ProductDAO().sizelist(prodnum);
				for(ProductDTO dto : sizelist)  { 
			%>
			<option value="<%= dto.getProdsize() %>"><%= dto.getProdsize() %></option>
			<% } %>
		</select><p>
		<input class="count-box" type="button" value="+" onclick="count('plus')">
		<input class="quantity-box" type="text" id="quantity" name="quantity" value="1" readonly>
		<input class="count-box" type="button" value="-" onclick="count('minus')"><p><p>
		총 상품금액
		<input class="text-box" type="text" value="<%= prod.getPrice2() %>" name="totalp" id="totalp" readonly>원<p>
		<hr width="500px"><p>
		<input class="button cart" type="button" onclick="CartCheck()" value="Add To Cart"><p>
		<input class="button buy" type="button" onclick="OrderCheck()" value="Buy Now">
	</div>
</div>
	<div class="bottom-box">
		<hr width="1200px">
	</div>
</form>
</body>
</html>