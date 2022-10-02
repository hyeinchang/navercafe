<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath}/resources/js/daum_post.js"></script>

<section class="section1 cafe_layout_area">
    <div class="container clearfix">
      <div class="">
       	<h4>
          <span>회원정보</span>
        </h4>
      </div>
      <div class="col-lg-12 col-md-12 col-sm-12 clearfix">

        <form class="main_form" action="${contextPath}/cafe/member/userUpdate" method="post" name="userUpdate">
        	<h5 class="title">회원 기본 정보</h5>
        	<div class="infoLine">
        		<label for="id" class="infoLabel">아이디 <span class="required">*</span></label>
          		<input type="text" name="id" id="id" class="form-control-inline" readonly  value="${id}">
          		<label class="infoText" style="color: red;" id="idlabel"></label>	
        	</div>
        	
        	<div class="infoLine">
        		<label for="password" class="infoLabel">비밀번호 <span class="required">*</span></label>
          		<input type="password" name="password" id="password" class="form-control-inline" placeholder="비밀번호를 입력해주십시오.">
          		<label class="infoText" style="color: red;" id="pwlabel"></label>
        	</div>
        	
        	<div class="infoLine">
        		<label for="password2" class="infoLabel">비밀번호 확인 <span class="required">*</span></label>
          		<input type="password" name="password2" id="password2" class="form-control-inline" placeholder="비밀번호 확인을 입력해주십시오.">
          		<label class="infoText" style="color: red;" id="pw2label"></label>
        	</div>
        	
        	<div class="infoLine">
        		<label for="name" class="infoLabel">이름 <span class="required">*</span></label>
          		<input type="text" name="name" id="name" class="form-control-inline" placeholder="이름을 입력해주십시오." value="${name}">
          		<label class="infoText" style="color: red;" id="namelabel"></label>
        	</div>
        	
          	<div class="clearfix"></div>
          	<div class="divider"></div>

        	<h5 class="title">회원 추가 정보</h5>
        	<div class="infoLine">
        		<label for="phone" class="infoLabel">휴대폰 번호</label>
          		<input type="tel" id="phone" name="phone" class="form-control-inline" placeholder="###-####-####" oninput="onlyNumber()" value="${phone }">
          		<label class="infoText" style="color: red;" id="phlabel"></label>
        	</div>
      		
        	<div class="infoLine">
        		<label for="addr1" class="infoLabel" style="vertical-align: top;display:inline-block;">주소</label>
        		<div style="display:inline-block;width:500px;">
	        		<div>
	        			<button type="button" onclick="daumPost()" class="button" style="margin-bottom:10px;">우편번호 찾기</button>
	        		</div>
	        		<div>
		          		<input type="text" name="addr1" placeholder="우편번호" readonly id="addr1" class="form-control"  value="${addr1}">
						<input type="text" name="addr2" placeholder="주소" readonly id="addr2" class="form-control" value="${addr2}">
						<input type="text" name="addr3" placeholder="상세 주소를 입력해주십시오." id="addr3" class="form-control" value="${addr3}">
	        		</div>
        		</div>
        	</div>
        	
        	<div class="infoLine">
        		<label for="email" class="infoLabel">이메일</label>
          		<input type="email" id="email" name="mail" class="form-control-inline" placeholder="이메일을 입력해주십시오." value="${email}">
          		<label class="infoText" style="color: red;" id="emaillabel"></label>
        	</div>

          	<br><br>
          	
          	<div class="btns">
          		<button class="button" type="button" onclick="location.href='${contextPath}'" style="background:#ccc;'">뒤로가기</button>
          		<button class="button" type="button" onclick="update()">정보수정</button>
          		<button class="button danger" type="button" onclick="location.href='${contextPath}/cafe/member/delete?id=${id}'">회원탈퇴</button>
          	</div>
        </form>
      
      </div>
      <!-- end content -->
    </div>
    <!-- end container -->
  </section>
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script type="text/javascript">
function update(){
	var pw = document.getElementById("password");	
	var pw2 = document.getElementById("password2");	
	var name = document.getElementById("name");	
	var phone = document.getElementById("phone");	
	var email = document.getElementById("email");	
	var addr1 = document.getElementById("addr1");	
	var addr3 = document.getElementById("addr3");	

	var pwck = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
	var emck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	
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