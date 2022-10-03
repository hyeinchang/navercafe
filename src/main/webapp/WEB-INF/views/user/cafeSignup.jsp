<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

      <div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${_cafeDTO.cafeLayout eq 'left' ? '' : 'style="float:right;"'}>
       	<section class="section1">
		    <div class="container clearfix">
		      <div class="">
		       	<h4>
		          <span>카페 가입하기</span>
		        </h4>
		      </div>
		      <div class="col-lg-8 col-md-8 col-sm-8 clearfix">
				<div style="margin-top: 30px; padding: 8px 32px 32px; border: 1px solid #ebecef; line-height: 20px; border-radius: 10px;">
					<form action="cafeRegApp" method="post" name="signupForm" id="signupForm">
						<input type="hidden" value="${_cafeDTO.cafeId}" name="cafeId" id="cafeId">
						<input type="hidden" value="${_cafeDTO.loginId}" name="userId">
						<input type="hidden" name="status" id="status" value="OK">
						<div class="join_info">
							<div class="join_info_head">
								<strong style="line-height: 20px;">카페소개</strong>
							</div>
							<div class="join_info_body">
							<c:if test="${_cafeDTO.cafeExplanation eq null || _cafeDTO.cafeExplanation.length() == 0}">
								등록된 카페소개 없습니다.
							</c:if>
								${_cafeDTO.cafeExplanation}
							</div>
						</div>
						<div class="join_info">
							<div class="join_info_head">
								<strong style="line-height: 20px;">가입안내</strong>
							</div>
							<div class="join_info_body">
							<c:if test="${_cafeDTO.cafeJoinInformation eq null || _cafeDTO.cafeJoinInformation.length() == 0}">
								등록된 가입안내가 없습니다.
							</c:if>
								${_cafeDTO.cafeJoinInformation}
							</div>
						</div>
						<!-- 카페 가입 설명, 안내  -->
						<div class="join_info">
							<div class="join_info_head">
								<strong style="line-height: 20px;">닉네임</strong>
							</div>
							<div class="join_info_body">
								<div style="position: relative; display: inline-block; margin: 0; padding: 0;">
									<input class="input_text" type="text" placeholder="닉네임" id="cafeUserNickname" name="cafeUserNickname" onkeyup="idOverlap()">
									<span id="confirm"></span>
									<button type="button" class="btn_close"></button>
								</div>
							</div>
						</div>
						<c:if test="${_cafeDTO.questionList ne null && _cafeDTO.questionList.size() > 0}">
						<div class="join_info">
							<div class="join_info_head">
								<strong style="line-height: 20px;">가입질문</strong>
							</div>
							<div class="join_info_body">
							<c:forEach var="question" items="${_cafeDTO.questionList}">
								<div>
									<strong style="line-height: 20px;">질문 ${question.cafeQuestionNum}. ${question.cafeQuestionContent}</strong>
									<textarea class="qna_area" rows="2" cols="60" name="answer${question.cafeQuestionNum}"></textarea>
								</div>
							</c:forEach>
							</div>
						</div>
						</c:if>
						<div style="margin-top: 16px; text-align: center;">
							<button class="button" type="button" onclick="update()">
								동의 후 가입하기
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

<script type="text/javascript" src="resources/js/jquery3.6.0.js"></script>
<script type="text/javascript">
function idOverlap(){
	let idCheck = document.getElementById("cafeUserNickname").value;
	/*  let oldNick = document.getElementById("oldNick").value; */
	let cafeId = document.getElementById("cafeId").value;
	let confirm = document.getElementById("confirm");
	let status = document.getElementById("status");
	
	$.ajax({
		type : "POST",
		url : "nickCheck2",
		data : {"id" : idCheck,"cafeId":cafeId},
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
	console.log(status)
	if(status == "OK"){
		document.getElementById("signupForm").submit();
	}else{
		alert('수정 정보를 다시 확인해주세요')
	}
}
</script>    