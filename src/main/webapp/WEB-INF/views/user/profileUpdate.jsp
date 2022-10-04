<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

      <div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${_cafeDTO.cafeLayout eq 'left' ? '' : 'style="float:right;"'}>
       	<section class="section1">
		    <div class="container clearfix">
		      <div class="">
		       	<h4>
		          <span>프로필 수정</span>
		        </h4>
		      </div>
		      <div class="col-lg-8 col-md-8 col-sm-8 clearfix">
				<div style="margin-top: 30px; padding: 8px 32px 32px; border: 1px solid #ebecef; line-height: 20px; border-radius: 10px;">
					<form action="profilesubmit2" method="post" name="profilForm" id="profilForm" enctype="multipart/form-data">
						<input type="hidden" value="${_cafeDTO.cafeId}" name="cafeId" id="cafeId">
						<input type="hidden" value="${_cafeDTO.loginId}" name="userId">
						<input type="hidden" value="${_cafeDTO.loginUser.cafeUserNickname}" name="oldNick" id="oldNick">
						<input type="hidden" name="status" id="status" value="OK">
						<div class="join_info">
							<div class="join_info_head">
								<strong style="line-height: 20px;">닉네임</strong>
							</div>
							<div class="join_info_body">
								<div style="position: relative; display: inline-block; margin: 0; padding: 0;">
									<input class="input_text" type="text" placeholder="닉네임" name="cafeUserNickname" id="cafeUserNickname" value="${_cafeDTO.loginUser.cafeUserNickname }" onkeyup="idOverlap()">
									<span id="confirm"></span>
									<p style="font-size: 13px;">한글 1~10자, 영문 대소문자 2~20자, 숫자를 사용할 수 있습니다.(혼용가능)</p>
									<p style="font-size: 13px;">중복되지 않은 별명으로 변경해주세요.</p>
								</div>
							</div> 
						</div>
						<div class="join_info">
							<div class="join_info_head">
								<strong style="line-height: 20px;">프로필 이미지</strong>
							</div>
							<div class="join_info_body">
								<div style="position: relative; display: inline-block; margin: 0; padding: 0;">
									<input type="file" >
								</div>
								<p>프로필은 카페별로 설정가능합니다.</p>
							</div>
						</div>
						<div class="join_info">
							<div class="join_info_head">
								<strong style="line-height: 20px;">성별연령대공개</strong>
							</div>
							<div class="join_info_body">
								<div>
									<c:if test="${_cafeDTO.loginUser.cafeUserGenderReveal eq 'Y' 
										|| _cafeDTO.loginUser.cafeUserGenderReveal eq null}">
										<input type="radio" name="cafeUserGenderReveal" checked="checked" value="Y">
										<label>허용</label>
										<input type="radio" name="cafeUserGenderReveal" value="N">
										<label>비허용</label>
									</c:if>
									<c:if test="${_cafeDTO.loginUser.cafeUserGenderReveal eq 'N' }">
										<input type="radio" name="cafeUserGenderReveal"  value="Y">
										<label>허용</label>
										<input type="radio" name=cafeUserGenderReveal  checked="checked" value="N">
										<label>비허용</label>
									</c:if>
									<p>카페 운영진이 내 성별과 연령대를 확인할 수 있습니다.</p>
								</div>
							</div>
						</div>
						<div class="join_info">
							<div class="join_info_head">
								<strong style="line-height: 20px;">전체메일 수신</strong>
							</div>
							<div class="join_info_body">
								<div>
									<c:if test="${_cafeDTO.loginUser.cafeUserEmailReceieve eq 'Y' }">
										<input type="radio" name="cafeUserEmailReceieve" checked="checked" value="Y">
										<label>허용</label>
										<input type="radio" name="cafeUserEmailReceieve"  value="N">
										<label>비허용</label>
									</c:if>
									<c:if test="${_cafeDTO.loginUser.cafeUserEmailReceieve eq 'N' }">
										<input type="radio" name="cafeUserEmailReceieve"  value="Y">
										<label>허용</label>
										<input type="radio" name=cafeUserEmailReceieve  checked="checked" value="N">
										<label>비허용</label>
									</c:if>
									<p>카페 운영진이 보내는 메일을 수신합니다.</p>
								</div>
							</div>
						</div>
						<div style="margin-top: 16px; text-align: center;">
							<button class="btn" type="button" style="background-color: gray;">
								<span >취소</span>
							</button>
							<button class="btn" type="button" onclick="update()">
								<span >수정</span>
							</button>
						</div>
					</form>
				</div>
		     
		      </div>
		      <!-- end content -->
		    </div>
		    <!-- end container -->
		  </section>
      </div>
      <!-- end content -->

<script type="text/javascript" src="${contextPath}/resources/js/jquery3.6.0.js"></script>
<script type="text/javascript">
	function idOverlap(){
		let idCheck = document.getElementById("cafeUserNickname").value;
		let oldNick = document.getElementById("oldNick").value;
		let cafeId = document.getElementById("cafeId").value;
		let confirm = document.getElementById("confirm");
		let status = document.getElementById("status");
		
		$.ajax({
			type : "POST",
			url : "nickCheck",
			data : {"id" : idCheck,"cafeId":cafeId,"oldNick":oldNick},
			dataType : "text",
			success : function(data){
				if(data=="OK"){
					confirm.style.color="#0000ff";
					confirm.innerHTML = "사용 가능한 닉네임 입니다.";
					$('input[name=status]').attr('value',"OK");
					
				}else{
					confirm.style.color="#ff0000";
					confirm.innerHTML = "사용 불가능한 닉네임 입니다.";
					$('input[name=status]').attr('value',"NO");
				}
			},
			error : function(){
				alert("에러ㅓㅓ")
			}
		});
	}
	
	function update(){
		let confirm = document.getElementById("confirm");
		let status = document.getElementById("status").value;
		let cafeUserNickname = document.getElementById('cafeUserNickname');
		
		if(cafeUserNickname.value == '') {
			alert('카페 닉네임을 입력해주십시오.');
			cafeUserNickname.focus();
			return;
		}
		
		console.log(status)
		if(status == "OK"){
			document.getElementById("profilForm").submit();
		}else{
			alert('수정 정보를 다시 확인해주세요')
		}
	}
</script>