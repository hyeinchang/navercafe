<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="resources/js/daum_post.js"></script>

<div class="container mt-5 mb-5" style="font-weight: bold; font-size: 20px;">
	<h1><b>회원정보</b></h1>
	<form action="userUpdate" method="post" name="userUpdate">
		<div class="mb-3">
			<label class="form-label">아이디</label>
			<label style="color: red;" id="idlabel"></label>
			<input type="text" id="id" name="id" class="form-control" readonly value="${id }">
		</div>
		<div class="mb-3">
			<label class="form-label">비밀번호</label>
			<label style="color: red;" id="pwlabel"></label>
			<input type="password" id="password" name="password" class="form-control">
		</div>
		<div class="mb-3">
			<label class="form-label">비밀번호확인</label>
			<label style="color: red;" id="pw2label"></label>
			<input type="password" id="password2" name="password2" class="form-control">
		</div>
		<div class="mb-3">
			<label class="form-label">이름</label>
			<input type="text" id="name" name="name" class="form-control" value="${name }">
		</div>
		<div class="mb-3">
			<label class="form-label">휴대폰번호</label>
			<input type="tel" id="phone" name="phone" class="form-control" oninput="onlyNumber()" value="${phone }">
		</div>
		<div class="mb-3">
			<label class="form-label">주소</label>
			<button type="button" onclick="daumPost()" class="btn btn-secondary">우편번호 찾기</button>
			<input type="text" name="addr1" readonly id="addr1" class="form-control" value="${addr1 }">
			<input type="text" name="addr2" placeholder="주소" readonly id="addr2" class="form-control" value="${addr2 }">
			<input type="text" name="addr3" placeholder="상세 주소" id="addr3" class="form-control" value="${addr3 }">
		</div>
		<div class="mb-3">
			<label class="form-label">이메일</label>
			<label style="color: red;" id="emaillabel"></label>
			<input type="email" id="email" name="mail" class="form-control" value="${email }">
		</div>
		<div class="mt-4 text-end">
			<a href="http://localhost:8085/navercafe/" type="button" class="btn btn-dark">뒤로가기</a>
			<button type="button" class="btn btn-primary" style="font-weight: bold;" onclick="update()">정보수정</button>
			<button type="button" class="btn btn-danger" style="font-weight: bold;" onclick="location.href='delete?id=${id}'">회원탈퇴</button>
		</div>
	</form>
</div>

<script type="text/javascript">
	var pw = document.getElementById("password");	
	var pw2 = document.getElementById("password2");	
	var name = document.getElementById("name");	
	var phone = document.getElementById("phone");	
	var email = document.getElementById("email");	
	var addr1 = document.getElementById("addr1");	
	var addr3 = document.getElementById("addr3");	
	
	var pwck = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	var emck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	function update(){
		if(pw.value==""){
			alert("비밀번호를 입력하세요.");
			pw.focus();
			return false;
		}
		
		if(!pwck.test(pw.value)){ //비밀번호 체크
			document.getElementById("pwlabel").innerHTML = "비밀번호는 영문자+숫자+특수문자 조합으로 8~15자리 입력해주세요"
			return false;
		}else{
			document.getElementById("pwlabel").innerHTML = "사용가능합니다."
		}
		if(pw2.value==""){
			alert("비밀번호를 확인해주세요.");
			pw2.focus();
			return false;
		}
		if(pw.value !== pw2.value){
			document.getElementById("pw2label").innerHTML = "비밀번호가 일치하지 않습니다."
			pw2.focus();
			return false;
		}else{
			document.getElementById("pw2label").innerHTML = "비밀번호가 일치합니다."
		}
		
		if(name.value==""){
			alert("이름을 입력해 주세요.");
			name.focus();
			return false;
		}
		if(phone.value==""){
			alert("핸드폰번호를 입력해 주세요.");
			phone.focus();
			return false;
		}
		if(addr1.value==""){
			alert("주소를 검색해 입력해주세요");
			addr1.focus();
			return false;
		}
		if(addr3.value==""){
			alert("상세주소를 입력해주세요");
			addr3.focus();
			return false;
		}
		if(email.value==""){
			alert("이메일을 입력해 주세요.");
			email.focus();
			return false;
		}
		if(!emck.test(email.value)){ //이메일정규식 체크
			document.getElementById("emaillabel").innerHTML = "이메일형식으로 작성해주세요."
			return false;
		}else{
			document.getElementById("emaillabel").innerHTML = "사용가능합니다."
		}
		
		
		document.userUpdate.submit();
	}
</script>
