<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="nav_user.jsp" %>
<%@ include file="header.jsp" %>
<%@ include file="nav_product.jsp" %>
<%
	String Id = request.getParameter("id");
	String Pwd = request.getParameter("pwd");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link href="./css/bootstrap.css" rel="stylesheet" type="text/css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% if(Id != null||Pwd == null){ %>
<div class="container">
<div class="row justify-content-center align-items-center" style="height:100vh"">
<!-- justify-content-center : 세로 줄 중앙정렬 , align-items-center : 가로 줄 중앙정렬  -->
<div class="col-4">
<h3 class="text-center mb-5">아이디 찾기</h3>
	<div class="card">
		<div class="card-body">
			찾으신 아이디는 <%= Id %> 입니다.
			</div>
			<input type="button" onclick="location.href = 'user_pwdfind.jsp'" class="btn btn-secondary" value="비밀번호 찾기">
			</form>
		</div>
	</div>
</div>
</div>
<% } else if (Pwd != null) { %>
<div class="container">
<div class="row justify-content-center align-items-center" style="height:100vh"">
<!-- justify-content-center : 세로 줄 중앙정렬 , align-items-center : 가로 줄 중앙정렬  -->
<div class="col-4">
<h3 class="text-center mb-5">비밀번호 찾기</h3>
	<div class="card">
		<div class="card-body">
			찾으신 비밀번호는 <%= Pwd %> 입니다.
			</div>
			</form>
		</div>
	</div>
</div>
</div>
<% } %>
</body>
</html>