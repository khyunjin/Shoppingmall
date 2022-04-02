<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="nav_user.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="nav_product.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="./css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
function pwdfindCheck() {
	if(document.findfrm.name.value==""){
		alert("이름을 입력해 주세요");
		document.findfrm.name.focus();
		return;
	}
	if(document.findfrm.id.value==""){
		alert("아이디를 입력해 주세요");
		document.findfrm.id.focus();
		return;
	}
	if(document.findfrm.eid.value==""){
		alert("이메일 아이디를 입력해 주세요");
		document.findfrm.eid.focus();
		return;
	}
	if(document.findfrm.edomain.value==""){
		alert("이메일 주소를 입력해 주세요");
		document.findfrm.edomain.focus();
		return;
	}
	document.findfrm.submit();
}
</script>
<meta charset="UTF-8">
</head>
<body>
<div class="container">
<div class="row justify-content-center align-items-center" style="height:100vh"">
<!-- justify-content-center : 세로 줄 중앙정렬 , align-items-center : 가로 줄 중앙정렬  -->
<div class="col-4">
<h3 class="text-center mb-5">비밀번호 찾기</h3>
	<div class="card">
		<div class="card-body">
			<form name="findfrm" method="post" action="./userpwdfind">
			<div class="form-group mb-3">
				<label class="mb-2">이름</label>
				<input type="text" id="name" name="name" class="form-control username" maxlength="20">
			</div>
			<div class="form-group mb-3">
				<label class="mb-2">아이디</label>
				<input type="text" id="id" name="id" class="form-control username" maxlength="20">
			</div>
			<div class="form-group mb-3">
			<label class="mb-2">이메일</label>
			<div class="input-group mb-3">
				<div class="col-sm-5"><input type="text" id="eid" name="eid" class="form-control" maxlength="20"></div>
				<span class="input-group-text">@</span>
				<div class="col-sm-5"><input type="text" id="edomain" name="edomain" class="form-control" maxlength="20" placeholder="gmail.com"></div>
			</div>
			</div>
			<input type="button" onclick="pwdfindCheck()" class="btn btn-secondary" value="찾기">
			</form>
		</div>
	</div>
</div>
</div>
</body>
</html>