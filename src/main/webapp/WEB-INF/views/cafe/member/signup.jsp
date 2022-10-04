<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${contextPath}/resources/js/daum_post.js"></script>

<section class="section1 cafe_layout_area">
    <div class="container clearfix">
      <div class="">
       	<h4>
          <span>회원가입</span>
        </h4>
      </div>
      <div class="col-lg-12 col-md-12 col-sm-12 clearfix">

        <form class="main_form" action="register" method="post" name="signupForm">
        	<h5 class="title">회원 기본 정보</h5>
        	<div class="infoLine">
        		<input type="hidden" name="status" id="status" value="NO">
        		<label for="id" class="infoLabel">아이디 <span class="required">*</span></label>
          		<input type="text" name="id" id="id" class="form-control-inline" placeholder="아이디를 입력해주십시오.">
          		<span id="confirm"></span>
          		<input type="button" value="중복확인" class="button" style="margin-left:10px;"
          			onclick="idOverlap2()">
          		<div style="margin:5px 0 0 205px;">
          			<label style="color: red;" id="idlabel"></label>	
          		</div>
        	</div>
        	
        	<div class="infoLine">
        		<label for="password" class="infoLabel">비밀번호 <span class="required">*</span></label>
          		<input type="password" name="password" id="password" class="form-control-inline" placeholder="비밀번호를 입력해주십시오.">
          		<div style="margin:5px 0 0 205px;">
          			<label style="color: red;" id="pwlabel"></label>
          		</div>
        	</div>
        	
        	<div class="infoLine">
        		<label for="password2" class="infoLabel">비밀번호 확인 <span class="required">*</span></label>
          		<input type="password" name="password2" id="password2" class="form-control-inline" placeholder="비밀번호 확인을 입력해주십시오.">
          		<div style="margin:5px 0 0 205px;">
          			<label style="color: red;" id="pw2label"></label>
          		</div>
        	</div>
        	
        	<div class="infoLine">
        		<label for="name" class="infoLabel">이름 <span class="required">*</span></label>
          		<input type="text" name="name" id="name" class="form-control-inline" placeholder="이름을 입력해주십시오.">
          		<div style="margin:5px 0 0 205px;">
          			<label style="color: red;" id="namelabel"></label>
          		</div>
        	</div>
        	
          	<div class="clearfix"></div>
          	<div class="divider"></div>

        	<h5 class="title">회원 추가 정보</h5>
        	<div class="infoLine">
        		<label for="phone" class="infoLabel">휴대폰 번호</label>
          		<input type="tel" id="phone" name="phone" class="form-control-inline" placeholder="###-####-####">
          		<div style="margin:5px 0 0 205px;">
          			<label style="color: red;" id="phlabel"></label>
          		</div>
        	</div>
        	
        	<div class="infoLine">
        		<label for="birthdate" class="infoLabel">태어난 연도</label>
          		<input type="tel" id="birthdate" name="birthdate" class="form-control-inline" maxlength="4" min="1950" max="2022" placeholder="####">
        	</div>
       
       		<div class="infoLine">
     			<label class="infoLabel">성별</label>
	       		<label for="joinGenderM" class="checkLable-inline">
	          		<input type="radio" id="joinGenderM" name="gender" value="male">
	            	<strong>남자</strong>
	       		</label>
	       		<label for="joinGenderF" class="checkLable-inline">
	          		<input type="radio" id="joinGenderF" name="gender" value="female">
	            	<strong>여자</strong>
	       		</label>
      		</div>
      		
        	<div class="infoLine">
        		<label for="addr1" class="infoLabel" style="vertical-align: top;display:inline-block;">주소</label>
        		<div style="display:inline-block;width:500px;">
	        		<div>
	        			<button type="button" onclick="daumPost()" class="button" style="margin-bottom:10px;">우편번호 찾기</button>
	        		</div>
	        		<div>
		          		<input type="text" name="addr1" placeholder="우편번호" readonly id="addr1" class="form-control">
						<input type="text" name="addr2" placeholder="주소" readonly id="addr2" class="form-control">
						<input type="text" name="addr3" placeholder="상세 주소를 입력해주십시오." id="addr3" class="form-control">
	        		</div>
        		</div>
        	</div>
        	
        	<div class="infoLine">
        		<label for="email" class="infoLabel">이메일</label>
          		<input type="email" id="email" name="mail" class="form-control-inline" placeholder="이메일을 입력해주십시오.">
          		<div style="margin:5px 0 0 205px;">
          			<label style="color: red;" id="emaillabel"></label>
          		</div>
        	</div>

          	<br><br>
          	
          	<div class="btns">
          		<button class="button" type="button" onclick="location.href='${contextPath}'" style="background:#ccc;'">뒤로가기</button>
          		<button class="button" type="button" onclick="reg()">회원가입</button>
          	</div>
        </form>
      
      </div>
      <!-- end content -->
    </div>
    <!-- end container -->
  </section>
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
<script type="text/javascript">
<<<<<<< HEAD
function idOverlap2(){
	let idCheck = document.getElementById("id").value;
	let confirm = document.getElementById("confirm");
	let status = document.getElementById("status");
	console.log(idCheck)
	$.ajax({
		type : "POST",
		url : "nickCheck3",
		data : {"id" : idCheck},
		dataType : "text",
		success : function(data){
			if(data=="OK"){
				if(idCheck==""){
					confirm.style.color="#ff0000";
					confirm.innerHTML = "사용 불가능한 아이디 입니다.";
					$('input[name=status]').attr('value',"NO");
				}else{
					confirm.style.color="#0000ff";
					confirm.innerHTML = "사용 가능한 아이디 입니다.";
					$('input[name=status]').attr('value',"OK");
				}
			}else{
				confirm.style.color="#ff0000";
				confirm.innerHTML = "사용 불가능한 아이디 입니다.";
				$('input[name=status]').attr('value',"NO");
			}
		},
		error : function(){
			alert("아이디를 입력해주세요")
		}
	});
}



=======
>>>>>>> c336640b162a2a0b32cc361325a6f109dbdfecbc
	function reg(){
		var id = document.getElementById("id");	
		var pw = document.getElementById("password");	
		var pw2 = document.getElementById("password2");	
		var name = document.getElementById("name");	
		var phone = document.getElementById("phone");	
		var email = document.getElementById("email");	
		var addr1 = document.getElementById("addr1");	
		var addr3 = document.getElementById("addr3");	
		var birthdate = document.getElementById("birthdate");	
		var gender = document.getElementsByName("gender");	
		var boo = false;
		
		var nameck = /^[가-힣]+$/;
		var idck = /^[a-z]+[a-z0-9-_]{4,20}$/g;
		var phck = /^\d{3}-\d{3,4}-\d{4}$/;
		var pwck = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[#?!@$%^&*-])[\w#?!@$%^&*-]{8,15}$/g;
		var emck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/g;
		
		if(id.value==""){
			alert("아이디를 입력하세요.");
			id.focus();
			return false;
		}

		if(!idck.test(id.value)){ //아이디 체크
<<<<<<< HEAD
			console.log(document.getElementById("status").value)
			if(document.getElementById("status").value=="NO"){
				document.getElementById("idlabel").innerHTML = "아이디 중복확인 "
				document.getElementById("idlabel").style.color = "red"
				id.focus();
				return false;
			}
=======
>>>>>>> c336640b162a2a0b32cc361325a6f109dbdfecbc
			document.getElementById("idlabel").innerHTML = "아이디는 5~20자의 영문소문자, 숫자, (-), (_)만 사용가능합니다."
			document.getElementById("idlabel").style.color = "red"
			id.focus();
			return false;
		}else{
<<<<<<< HEAD
			if(document.getElementById("status").value=="NO"){
				document.getElementById("idlabel").innerHTML = "아이디 중복확인 "
				document.getElementById("idlabel").style.color = "red"
				id.focus();
				return false;
			}
			document.getElementById("idlabel").innerHTML = "사용가능합니다."
			document.getElementById("idlabel").style.color = "green"
=======
			document.getElementById("idlabel").innerHTML = "사용가능합니다."
			document.getElementById("idlabel").style.color = "green"
			pw.focus();
>>>>>>> c336640b162a2a0b32cc361325a6f109dbdfecbc
			//return false;
		}
		
		if(pw.value==""){
			alert("비밀번호를 입력하세요.");
			pw.focus();
			return false;
		}
		
		if(!pwck.test(pw.value)){ //비밀번호 체크
<<<<<<< HEAD
			document.getElementById("pwlabel").innerHTML = "비밀번호는 영대소문자+숫자+특수문자 조합으로 8~15자리 입력해주세요"
=======
			document.getElementById("pwlabel").innerHTML = "비밀번호는 영문자+숫자+특수문자 조합으로 8~15자리 입력해주세요"
>>>>>>> c336640b162a2a0b32cc361325a6f109dbdfecbc
			document.getElementById("pwlabel").style.color = "red"
			pw.focus();
			return false;
		}else{
			document.getElementById("pwlabel").innerHTML = "사용가능합니다."
			document.getElementById("pwlabel").style.color = "green"
<<<<<<< HEAD
=======
			pw2.focus();
>>>>>>> c336640b162a2a0b32cc361325a6f109dbdfecbc
		}
		if(pw2.value==""){
			alert("비밀번호를 확인해주세요.");
			pw2.focus();
			return false;
		}
		if(pw.value !== pw2.value){ // 비밀번호 일치 체크
			document.getElementById("pw2label").innerHTML = "비밀번호가 일치하지 않습니다."
			document.getElementById("pw2label").style.color = "red"
			pw2.focus();
			return false;
		}else{
			document.getElementById("pw2label").innerHTML = "비밀번호가 일치합니다."
			document.getElementById("pw2label").style.color = "green"
<<<<<<< HEAD
=======
			name.focus();
>>>>>>> c336640b162a2a0b32cc361325a6f109dbdfecbc
		}
		
		if(name.value==""){
			alert("이름을 입력해 주세요.");
			name.focus();
			return false;
		}
		if(!nameck.test(name.value)){ //이름 체크
			document.getElementById("namelabel").innerHTML = "한글이름만 가입가능합니다."
			document.getElementById("namelabel").style.color = "red"
			name.focus();
			return false;
		}else{
			document.getElementById("namelabel").innerHTML = "사용가능합니다."
			document.getElementById("namelabel").style.color = "green"
		}
		if(phone.value==""){
			alert("핸드폰번호를 입력해 주세요.");
			phone.focus();
			return false;
		}
		if(!phck.test(phone.value)){ // 폰번호체크
			document.getElementById("phlabel").innerHTML = "숫자만 입력해주세요"
			document.getElementById("phlabel").style.color = "red"
			phone.focus();
			return false;
		}else{
			document.getElementById("phlabel").innerHTML = "사용가능합니다."
			document.getElementById("phlabel").style.color = "green"
		}
		if(birthdate.value==""){
			alert("태어난 년도를 입력해 주세요.");
			birthdate.focus();
			return false;
		}
		for (var i=0;i<gender.length;i++) {
	        if (gender[i].checked==true) {
	            boo = true;
	            break;
	        }
	    }
	    if (boo == false) {
	        alert("성별을 선택해 주세요.");
	        return;
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
<<<<<<< HEAD
			document.getElementById("emaillabel").style.color = "red"
=======
>>>>>>> c336640b162a2a0b32cc361325a6f109dbdfecbc
			email.focus();
			return false;
		}else{
			document.getElementById("emaillabel").innerHTML = "사용가능합니다."
<<<<<<< HEAD
			document.getElementById("emaillabel").style.color = "green"
		}
		
		let status = document.getElementById("status").value;
		if(status == "OK"){
			document.signupForm.submit();
		}else{
			alert('회원가입정보를 다시 확인해주세요')
		}
	}
	
</script>
=======
		}
		
		
		document.signupForm.submit();
	}
</script>
>>>>>>> c336640b162a2a0b32cc361325a6f109dbdfecbc
