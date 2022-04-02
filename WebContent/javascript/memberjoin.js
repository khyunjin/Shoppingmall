
function joinCheck(){
	
// 위에서 순서대로 숫자, 영어(대소문자), 특수문자, 한글 구분 정규식

	var checkNum = /[0-9]/;
	var checkEng = /[a-zA-Z]/;
	var checkSpc = /[~!@#$%^&*()_+|<>?:{}]/;
	var checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
	var checkBlk = /\s/g;

// 아이디 유효성 검사

	var id = document.joinfrm.id.value;
	
	if(id==""){
		alert("아이디를 입력해 주세요");
		document.joinfrm.id.focus();
		return;
		}
	if(!checkNum.test(id)||!checkEng.test(id)||checkSpc.test(id)||checkKor.test(id)||id.match(checkBlk)||id.length<5){
		alert("아이디는 공백없이 5~20자의 영문 소문자, 숫자로 입력해 주세요");
		document.joinfrm.id.focus();
		return;
		}

// 비밀번호 유효성 검사

	var pwd1 = document.joinfrm.pwd1.value;
	var pwd2 = document.joinfrm.pwd2.value;

	if(pwd1==""){
		alert("비밀번호를 입력해 주세요");
		document.joinfrm.pwd1.focus();
		return;
		}
	if(!checkNum.test(pwd1)||!checkEng.test(pwd1)||!checkSpc.test(pwd1)||checkKor.test(pwd1)||pwd1.match(checkBlk)||pwd1.length<8){
		alert("비밀번호는 공백없이 8~16자 영문 대 소문자, 숫자, 특수문자로 입력해주세요");
		document.joinfrm.pwd1.focus();
		return;
		}
	if(pwd1!=pwd2){
		alert("비밀번호가 일치하지 않습니다");
		document.joinfrm.pwd2.focus();
		return;
		}

// 이름 유효성 검사

	var name = document.joinfrm.name.value;
	
	if(name==""){
		alert("이름을 입력해 주세요");
		document.joinfrm.name.focus();
		return;
		}
	if(checkNum.test(name)||checkSpc.test(name)||name.match(checkBlk)){
		alert("이름은 공백, 특수문자 없이 한글과 영문 대 소문자로 입력해주세요");
		document.joinfrm.name.focus();
		return;
		}
		
// 성별 유효성 검사

	if(!document.getElementById('gender').checked) {
		alert("성별을 입력하세요.");
		return;
		}
	
// 휴대전화 유효성 검사

	var phone2 = document.joinfrm.phone2.value;
	var phone3 = document.joinfrm.phone3.value;

	if(phone2==""){
		alert("휴대전화 중간자리를 입력해 주세요");
		document.joinfrm.phone2.focus();
		return;
		}
	if(phone3==""){
		alert("휴대전화 뒷자리를 입력해 주세요");
		document.joinfrm.phone3.focus();
		return;
		}
	if(!checkNum.test(phone2)||checkEng.test(phone2)||checkSpc.test(phone2)||checkKor.test(phone2)||phone2.match(checkBlk)){
		alert("휴대전화는 숫자로만 입력해 주세요");
		document.joinfrm.phone2.focus();
		return;
		}
	if(!checkNum.test(phone3)||checkEng.test(phone3)||checkSpc.test(phone3)||checkKor.test(phone3)||phone3.match(checkBlk)){
		alert("휴대전화는 숫자로만 입력해 주세요");
		document.joinfrm.phone3.focus();
		return;
		}
		
// 이메일 유효성 검사

	var eid = document.joinfrm.eid.value;
	var edomain = document.joinfrm.edomain.value;
	var checkEid = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])$/;
	var checkEdomain = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/;
	
	
	if(eid==""){
		alert("이메일 아이디를 입력해 주세요");
		document.joinfrm.eid.focus();
		return;
		}
	if(!checkEng.test(eid)||checkSpc.test(eid)||checkKor.test(eid)||eid.match(checkBlk)){
		alert("이메일 아이디에 특수문자, 한글, 공백이 들어갔는지 확인해 주세요");
		document.joinfrm.eid.focus();
		return;
		}
	if(edomain==""){
		alert("이메일 주소를 입력해 주세요");
		document.joinfrm.edomain.focus();
		return;
		}
	if(!edomain.match(checkEdomain)||edomain.match(checkBlk)){
		alert("이메일 주소형식을 확인해 주세요");
		document.joinfrm.edomain.focus();
		return;
	}
		
		
// 주소 유효성 검사

	var address = document.joinfrm.address.value;

	if(address==""){
		alert("주소를 입력해 주세요");
		document.joinfrm.address.focus();
		return;
		}

   document.joinfrm.submit();

}

function win_close(){
	self.close();
}