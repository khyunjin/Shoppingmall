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
function loginCheck() {
	var id = document.loginfrm.id;
	var pwd = document.loginfrm.pwd1;
	if(id.value==""){
		alert("아이디를 입력해 주세요");
		id.focus();
		return;
	}
	if(pwd.value==""){
		alert("비밀번호를 입력해 주세요");
		pwd.focus();
		return;
	}
	document.loginfrm.submit();
}
</script>
</head>

<body>

<div class="container">
<div class="row justify-content-center">
<!-- justify-content-center : 세로 줄 중앙정렬 , align-items-center : 가로 줄 중앙정렬  -->
<div class="col-4">
<h3 class="text-center mb-5">로그인</h3>
	<div class="card">
		<div class="card-body">
			<form name="loginfrm" method="post" action="./userlogin">
			<div class="form-group mb-3">
				<label class="mb-2">아이디</label>
				<input type="text" id="id" name="id" class="form-control username" maxlength="20">
			</div>
			<div class="form-group mb-3">
				<label class="mb-2">비밀번호</label>
				<input type="password" id="pwd1" name="pwd1" class="form-control" maxlength="16">
			</div>
			<input type="button" onclick="loginCheck()" class="btn btn-secondary" value="로그인">
			<a href = "user_idfind.jsp">아이디 찾기</a>
			<a href = "user_pwdfind.jsp">비밀번호 찾기</a>
			</form>
		</div>
	</div>
</div>
</div>
</div>
</body>
</html>