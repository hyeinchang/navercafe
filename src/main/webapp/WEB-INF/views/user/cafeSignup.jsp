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
						<input type="hidden" value="${cafeId}" name="cafeId" id="cafeId">
						<input type="hidden" value="${loginId}" name="userId">
						<input type="hidden" name="status" id="status" value="OK">
						<div class="join_info">
							<div class="join_info_head">
								<strong style="line-height: 20px;">카페설명</strong>
							</div>
							<div class="join_info_body">
								${_cafeDTO.cafeExplanation}
							</div>
						</div>
						<div class="join_info">
							<div class="join_info_head">
								<strong style="line-height: 20px;">가입안내</strong>
							</div>
							<div class="join_info_body">
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