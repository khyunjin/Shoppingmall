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
<script type="text/javascript" src="./javascript/memberjoin.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>

<body>
<div class="container">
<h3 class="text-center mb-5 mt-5">회원정보수정</h3>
<form name="joinfrm" method="post" action="./userupdate">
<fieldset class="form-group">
<hr>
<!-- 아이디, 비밀번호 입력  -->
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label">아이디<a style="color:red;">*</a></label>
		<div class="col-auto"><input type="text" id="id" name="id" class="form-control" maxlength="20" value="<%= user.getId() %>" readonly></div>
	</div>
<hr>
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label">비밀번호<a style="color:red;">*</a></label>
		<div class="col-auto"><input type="password" id="pwd1" name="pwd1" class="form-control" maxlength="16"></div>
	</div>
<hr>
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label">비밀번호 확인<a style="color:red;">*</a></label>
		<div class="col-auto"><input type="password" id="pwd2" name="pwd2" class="form-control" maxlength="16"></div>
	</div>
<hr>
<!-- 이름, 성별  입력 -->
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label">이름<a style="color:red;">*</a></label>
		<div class="col-auto"><input type="text" id="name" name="name" class="form-control" maxlength="20" value="<%= user.getName() %>"></div>
	</div>
<hr>
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label">성별<a style="color:red;">*</a></label>
		<div class="col-auto mt-2">
		남&nbsp;<input type="radio" name="gender" id="male" class="form-check-input" value="남" <% if(user.getGender().equals("남")) { %> checked <% } %>>&nbsp;
		여&nbsp;<input type="radio" name="gender" id="female" class="form-check-input" value="여" <% if(user.getGender().equals("여")) { %> checked <% } %>>
		</div>
	</div>
<hr>
<!-- 휴대전화, 이메일 입력  -->
	<div class="input-group mb-3">
		<label class="col-sm-2 col-form-label">휴대전화<a style="color:red;">*</a></label>
		<div class="col-auto">
		<select id="phone1" name="phone1" class="form-select">
			<option value="010" <% if(user.getPhone1().equals("010")) { %> selected <% } %>>010</option>
			<option value="011" <% if(user.getPhone1().equals("011")){ %> selected <% } %>>011</option>
			<option value="016" <% if(user.getPhone1().equals("016")){ %> selected <% } %>>016</option>
			<option value="017" <% if(user.getPhone1().equals("017")){ %> selected <% } %>>017</option>
			<option value="018" <% if(user.getPhone1().equals("018")){ %> selected <% } %>>018</option>
			<option value="019" <% if(user.getPhone1().equals("019")){ %> selected <% } %>>019</option>
		</select></div>
		<span class="input-group-text">-</span>
		<div class="col-auto"><input type="text" id="phone2" name="phone2" class="form-control" maxlength="4" placeholder="1234" value="<%= user.getPhone2() %>"></div>
		<span class="input-group-text">-</span>
		<div class="col-auto"><input type="text" id="phone3" name="phone3" class="form-control" maxlength="4" placeholder="5678" value="<%= user.getPhone3() %>"></div>
	</div>
<hr>
	<div class="input-group mb-3">
		<label class="col-sm-2 col-form-label">이메일<a style="color:red;">*</a></label>
		<div class="col-sm-2"><input type="text" id="eid" name="eid" class="form-control" maxlength="20" value="<%= user.getEid() %>"></div>
		<span class="input-group-text">@</span>
		<div class="col-sm-3"><input type="text" id="edomain" name="edomain" class="form-control" maxlength="20" placeholder="gmail.com" value="<%= user.getEdomain() %>"></div>
	</div>
<hr>
<!--  주소입력 : 카카오 API 예제1 소스 사용  -->
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label">주소<a style="color:red;">*</a></label>
		<div class="col-auto"><input type="text" name="postcode" id="postcode" class="form-control" placeholder="우편번호" readonly value="<%= user.getPostcode() %>"></div>
		<div class="col-auto"><input type="button" onclick="DaumPostcode()" class="btn btn-secondary" value="우편번호 찾기"></div>
	</div>
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label"></label>
		<div class="col-sm-7"><input type="text" id="address" name="address" class="form-control" placeholder="주소" readonly value="<%= user.getAddress() %>"></div>
	</div>
	<div class="row mb-3">
		<label class="col-sm-2 col-form-label"></label>
		<div class="col-sm-4"><input type="text" id="detailAddress" name="detailAddress" class="form-control" placeholder="상세주소" value="<%= user.getDetailAddress() %>"></div>
		<div class="col-sm-3"><input type="text" id="extraAddress" name="extraAddress" class="form-control" placeholder="참고항목" value="<%= user.getExtraAddress() %>"></div>
	</div>
<!-- 주소 입력 끝  -->
<hr>
	<div class="text-center">
	<input type="reset" class="btn btn-secondary" value="취  소">
	<input type="button" onclick="joinCheck()" class="btn btn-secondary" value="정보수정">
	</div>
</div>
</fieldset>
</form>
<br>
</body>
</html>
<!-- 카카오 우편번호API  -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

function DaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var addr = ''; // 주소 변수
			var extraAddr = ''; // 참고항목 변수
			
			//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				addr = data.roadAddress;
			} else { // 사용자가 지번 주소를 선택했을 경우(J)
			addr = data.jibunAddress;
			}
			
			// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
			if(data.userSelectedType === 'R'){
				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
					extraAddr += data.bname;
					}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if(data.buildingName !== '' && data.apartment === 'Y'){
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if(extraAddr !== ''){
					extraAddr = ' (' + extraAddr + ')';
					}
				// 조합된 참고항목을 해당 필드에 넣는다.
				document.getElementById("extraAddress").value = extraAddr;
				
			} else {
				document.getElementById("extraAddress").value = '';
				}
			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('postcode').value = data.zonecode;
			document.getElementById("address").value = addr;
			// 커서를 상세주소 필드로 이동한다.
			document.getElementById("detailAddress").focus();
			}
	}).open();
	}
	
</script>