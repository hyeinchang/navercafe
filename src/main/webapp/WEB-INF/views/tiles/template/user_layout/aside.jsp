<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- SIDEBAR -->
      <div id="sidebar" class="col-lg-4 col-md-4 col-sm-4 col-xs-12 cstmAside" ${cafeDTO.cafeLayout > 0 ? 'style="float:right;"' : ''}>
        <div class="widget">
          <div class="tabbable">
            <ul class="nav nav-tabs">
              <li class="active"><a href="left-sidebar.html#recent" data-toggle="tab">카페정보</a></li>
              <li><a href="left-sidebar.html#popular" data-toggle="tab">나의활동</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane active" id="recent">
                <ul class="recent_posts">
                  <li>
                  	<span>
                  	  <a href="#">
                  	  <c:choose>
                  	  	<c:when test="${cafeDTO.cafeIconNum eq null || cafeDTO.cafeIconNum == 0}">
                  	  	<img class="profileImg" src="${contextPath}/resources/img/cafe_thumb_noimg_55.png" alt="카페 아이콘 없음">
                  	  	</c:when>
                  	  	<c:otherwise>
                  	  	<img class="profileImg" src="${contextPath}/file/download?cafeIconNum=${cafeDTO.cafeIconNum}" alt="카페 아이콘 없음">
                  	  	</c:otherwise>
                  	  </c:choose>
                  	  
                      </a>
                      <c:if test="${cafeDTO.isCafeManager eq 'true'}"> 
                      <a href="javascript:alert('카페 프로필 변경하기')" class="lab_thmb">카페 프로필 변경하기</a>
                      </c:if>
                  	</span>
                  	<div class="mananger_info">
                      <span class="gradeText">매니저</span>                   
                      <b title="${cafeDTO.userId}">${cafeDTO.userId}</b>
                    </div>
                    <div>since <fmt:formatDate value="${cafeDTO.cafeRegdate}" pattern="YYYY.MM.dd"/> </div>    
                    <div class="cafeSetting">
                    <c:choose>
                    <c:when test="${cafeDTO.isCafeManager eq 'true'}">
	                  <a href="javascript:changeCafeMenu('${contextPath}/admin')" class="info-cafe">
					    <span class="ico_aside ico_setting"></span>카페관리
					  </a>
				      <a href="javascript:alert('통계로 이동')" class="info-cafe">
					    <span class="ico_stat"></span>통계
					  </a>
					</c:when>
					<c:otherwise>
					  <a href="javascript:alert('카페소개로 이동')" class="info-cafe">
					      카페소개
					  </a>
					</c:otherwise>	
					</c:choose>	
                    </div>
                  </li>
                  <li class="cafeInfo">
                  	<div>
                  	  <span class="ico_wrt"></span>
                      <b>일간 게시글 수 :</b> 0
                    </div>
                    <div>
                      <span class="ico_wrt"></span>
                      <b>일간 조회 수 :</b> 0
                    </div>
                    <div>
                      <span class="ico_cmt"></span>
                      <b>일간 댓글 수 :</b> 0
                    </div>
                    <div>
                      <span class="ico"></span>
                      0
                    </div>
                  </li>
                  <li>

                    <c:if test="${cafeDTO.isCafeManager eq 'true' || cafeDTO.isCafeMember eq 'true'}">
                  	<input type="button" class="button" value="카페 글쓰기" onclick="changeCafeMenu('${contextPath}/user/board/writeForm')" style="width:100%;">
                  	</c:if>
                  	<c:if test="${cafeDTO.isCafeMember eq 'false'}">
                  	<input type="button" class="button" value="카페 가입하기" onclick="changeCafeMenu('${contextPath}/user/cafeSignup?cafeId=${cafeDTO.cafeId }')" style="width:100%;">
                  	</c:if>
                  </li>
                </ul>
                <!-- recent posts -->
              </div>
              <div class="tab-pane" id="popular">
               	<c:if test="${loginId eq null}">
                <div class="widget">
		          <h4 class="title">
		            <span>로그인</span>
		          </h4>
		         <form id="loginForm" method="post" name="loginForm" action="${contextPath}/user/login">
		            <div class="form-group">
		              <div class="input-group">
		                <span class="input-group-addon"><i class="fa fa-user"></i></span>
		                <input type="text" class="form-control" name="id" placeholder="아이디를 입력해주십시오." style="font-size:12px;">
		              </div>
		            </div>
		            <div class="form-group">
		              <div class="input-group">
		                <span class="input-group-addon"><i class="fa fa-lock"></i></span>
		                <input type="password" class="form-control" name="password" placeholder="비밀번호를 입력해주십시오." style="font-size:12px;">
		              </div>
		            </div>
		            <div class="form-group">
		              <div class="checkbox">
		                <label>
							<input type="checkbox"> Remember me
						</label>
		              </div>
		            </div>
		            <div class="form-group">
		              <button type="button" class="button" onclick="checkLoginForm()" style="width:100%;">로그인</button>
		            </div>
		          </form>
		        </div>
		        </c:if>
		      
                <ul class="recent_posts">
               
                  <!-- start 카페 가입 회원 정보 -->
                  <c:if test="${cafeDTO.isCafeMember eq 'true'}">
                  <li>
                  	<span>
                  	  <a href="#">
                  	  	<c:choose>
                  	  		<c:when test="${cafeMember.cafeUserImageNum == 0}"> <!-- 프로필 기본사진 -->
                  	  			<img class="profileImg" src="${contextPath}/resources/img/cafe_profile.png" alt="프로필 이미지">
                  	  		</c:when>
                  	  		<c:otherwise>
                  	  			<img class="profileImg" src="${contextPath}/resources/img/profileImage.jpg" alt="프로필 이미지">
                  	  		</c:otherwise>
                  	  	</c:choose>
                      </a>
                      <a href="profileUpdate?cafeId=${cafeMember.cafeId }" class="lab_thmb">프로필 변경하기</a>
                  	</span>
                    <b>${cafeMember.cafeUserNickname }</b>
                    <div>가입 ${cafeMember.cafeUserRegdate}</div>
                    <div class="gradeInfo">
                    	<c:choose>
                    		<c:when test="${cafeMember.cafeUserGrade eq 1}">
                    		<span>카페등급1 <img src="${contextPath}/resources/img/grade_manager.gif" alt=""></span>
                    		</c:when>
                    		<c:when test="${cafeMember.cafeUserGrade eq 2}">
                    		<span>카페등급2 <img src="${contextPath}/resources/img/grade_manager.gif" alt=""></span>
                    		</c:when>
                    		<c:when test="${cafeMember.cafeUserGrade eq 3}">
                    		<span>카페등급3 <img src="${contextPath}/resources/img/grade_manager.gif" alt=""></span>
                    		</c:when>
                    		<c:otherwise>
                    		아니야
                    		</c:otherwise>
                    	</c:choose>
                    	<!--  
	                   	<span>카페 매니저 <img src="${contextPath}/resources/img/grade_manager.gif" alt=""></span>
	                   	<a href="javscript:alert('멤버등급 안내')">등급 안내</a>
	                   	-->
                    </div>
                  </li>
                  <li class="cafeInfo">
                    <div>
                      <span class="ico_vst"></span>
                      <b>방문 :</b> ${cafeMember.cafeUserVisit}회
                    </div>
                    <div>
                      <span class="ico_wrt"></span>
                      <b>내가 쓴 글 보기 :</b> ${cafeMember.cafeUserWrite}개
                    </div>
                    <div>
                      <span class="ico_cmt"></span>
                      <b>내가 쓴 댓글보기 :</b> ${cafeMember.cafeUserReply}개
                    </div>
                  </li>
                  </c:if>
                  <!-- end 카페 가입 회원 정보 -->
                  <li>
                  <c:choose>

                  <c:when test="${cafeDTO.isCafeManager eq 'true' || cafeDTO.isCafeMember eq 'true'}">
                    <input type="button" class="button" value="카페 글쓰기" onclick="alert('카페 글쓰기 이동')" style="width:100%;">
                  </c:when>
                  <c:otherwise>
                    <c:if test="${loginId ne null}">
                    <input type="button" class="button" value="카페 가입하기" onclick="changeCafeMenu('${contextPath}/user/cafeSignup?cafeId=${cafeDTO.cafeId }')" style="width:100%;">
                    </c:if>
                  </c:otherwise>
                  </c:choose>
                  </li>
                </ul>
                <!-- recent posts -->
              </div>
            </div>
          </div>
          <!-- tabbable -->
        </div>
        <!-- end widget -->
        
        <div class="widget">
          <h4 class="title">
            <span>전체글보기</span>
          </h4>

          <ul class="categories">
          <c:choose>
          	<c:when test="${cafeDTO.cafeMenuList eq null || cafeDTO.cafeMenuList.size() == 0}">
          	<li>등록된 게시판이 없습니다.</li>
          	</c:when>
          	<c:otherwise>
          	<li>
            	<a href="javascript:changeCafeMenu('${contextPath}/user/board/goBoardList')">전체글보기</a>
            	<span class="text-primary">3</span>
            </li>
          	</c:otherwise>	
          </c:choose>          
          </ul>
        </div>


        <div class="widget">
          <h4 class="title">
            <span>Categories</span>
          </h4>
          <ul class="categories">            
            <c:forEach var="cafeMenu" items="${cafeDTO.cafeMenuList}">
            <li><a href="javascript:alert('${cafeMenu.boardMenuNum} 번 게시판으로 이동');">${cafeMenu.boardMenuName}</a></li>
            </c:forEach>
            <c:if test="${cafeDTO.cafeMenuList eq null || cafeDTO.cafeMenuList.size() == 0}">
            <li>등록된 게시판이 없습니다.</li>
            </c:if>
          </ul>
        </div>

      </div>
      <!-- end sidebar -->
    </div>
    <!-- end container -->
  </section>
  <!-- end section -->