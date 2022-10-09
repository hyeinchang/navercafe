
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	  <!-- SIDEBAR -->
      <div id="sidebar" class="col-lg-4 col-md-4 col-sm-4 col-xs-12 cstmAside" ${_cafeDTO.cafeLayout ne 'left' ? '' : 'style="float:right;"'}>
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
                  	  <c:if test="${_cafeDTO.isCafeManager eq 'true'}">
                  	  <a href="${contextPath}/admin/basicInfo?cafeId=${_cafeDTO.cafeId}">
                  	  </c:if>
                  	  <c:choose>
                  	  	<c:when test="${_cafeDTO.cafeIconNum eq null || _cafeDTO.cafeIconNum == 0}">
                  	  	<img class="profileImg" src="${contextPath}/resources/img/cafe_thumb_noimg_55.png" alt="카페 아이콘 없음">
                  	  	</c:when>
                  	  	<c:otherwise>
                  	  	<img class="profileImg" src="${contextPath}/file/download?cafeIconNum=${_cafeDTO.cafeIconNum}" alt="카페 아이콘">
                  	  	</c:otherwise>
                  	  </c:choose>
          			  <c:if test="${_cafeDTO.isCafeManager eq 'true'}">
                      </a>
                      </c:if>
                  	</span>
                  	<div class="mananger_info">
                      <span class="gradeText">매니저</span>                   
                      <b title="${_cafeDTO.userId}">${_cafeDTO.userId}</b>
                    </div>
                    <div>since <fmt:formatDate value="${_cafeDTO.cafeRegdate}" pattern="YYYY.MM.dd"/> </div>    
                    <div class="cafeSetting">
                    <c:choose>
                    <c:when test="${_cafeDTO.isCafeManager eq 'true'}">
	                  <a href="javascript:changeCafeMenu('${contextPath}/admin')" class="info-cafe">
					    <span class="ico_aside ico_setting"></span>카페관리
					  </a>
				      <a href="javascript:alert('통계로 이동')" class="info-cafe" style="display:none;">
					    <span class="ico_stat"></span>통계
					  </a>
					</c:when>
					<c:otherwise>
					  <a href="${contextPath}/user/cafeInformation?cafeId=${_cafeDTO.cafeId}" class="info-cafe">
					      카페소개
					  </a>
					</c:otherwise>	
					</c:choose>	
                    </div>
                  </li>
                  <li class="cafeInfo">
                  	<div>
                  	  <span class="ico_wrt"></span>
                      <b>일간 게시글 수 :</b> ${_cafeDTO.countMap.dayBoardCount}
                    </div>
                    <div>
                      <span class="ico_wrt"></span>
                      <b>일간 조회 수 :</b> ${_cafeDTO.countMap.dayBoardHit}
                    </div>
                    <div>
                      <span class="ico_cmt"></span>
                      <b>일간 댓글 수 :</b> ${_cafeDTO.countMap.dayReplyCount}
                    </div>
                    <div>
                      <span class="ico"></span>
                      <b>총 회원 수 :</b> ${_cafeDTO.countMap.totalCafeMember}
                    </div>
                  </li>
                  <li>

                    <c:if test="${_cafeDTO.isCafeManager eq 'true' || _cafeDTO.isCafeMember eq 'true'}">
                  	<input type="button" class="button" value="카페 글쓰기" onclick="changeCafeMenu('${contextPath}/user/board/writeForm')" style="width:100%;">
                  	</c:if>
                  	<c:if test="${_cafeDTO.isCafeMember eq 'false'}">
                  	<input type="button" class="button" value="카페 가입하기" onclick="changeCafeMenu('${contextPath}/user/cafeSignup?cafeId=${_cafeDTO.cafeId }')" style="width:100%;">
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
                  <c:if test="${_cafeDTO.isCafeMember eq 'true'}">
                  <li>
                  	<span>
                  		
                  	  <a href="${contextPath}/user/profileUpdate?cafeId=${_cafeDTO.cafeId}" title="프로필 변경하기">
                  	  	<c:choose>
                  	  		<c:when test="${_cafeDTO.loginUser.cafeUserImageNum == 0}">
                  	  			<!-- 프로필 기본사진 -->
                  	  			<img class="profileImg" src="${contextPath}/resources/img/cafe_profile.png" alt="프로필 이미지 없음">
                  	  		</c:when>
                  	  		<c:otherwise>
                  	  			
                  	  			<img class="profileImg" src="${contextPath}/file/download?cafeUserImageNum=${_cafeDTO.loginUser.cafeUserImageNum}" alt="프로필 이미지">
                  	  		</c:otherwise>
                  	  	</c:choose>
                      </a>
                  	</span>
                    <b>${_cafeDTO.loginUser.cafeUserNickname}</b>
                    <div>가입
                    	<fmt:formatDate value="${_cafeDTO.loginUser.cafeUserRegdate}" pattern="YYYY.MM.dd."/></div>
                    <div class="gradeInfo">
                    <c:choose>
                   		<c:when test="${_cafeDTO.loginUser.cafeUserGrade eq 999}">
                   		<span>카페 매니저
                   			<img src="${contextPath}/resources/img/grade_manager.gif" alt="">
                   		</span>
                   		</c:when>
                   		<c:otherwise>
                   		<span>${_cafeDTO.loginUser.cutName}
                   			<img src="${contextPath}/resources/img/grade/icon/level${_cafeDTO.loginUser.cafeUserGrade}.gif" alt="${_cafeDTO.loginUser.cutName}">
                   		</span>
                   		</c:otherwise>
                    </c:choose>
                   	<!--  
                   	<a href="javscript:alert('멤버등급 안내')">등급 안내</a>
                   	-->
                    </div>
                  </li>
                  <li class="cafeInfo">
                    <div>
                      <span class="ico_vst"></span>
                      <b>방문 :</b> ${_cafeDTO.loginUser.cafeUserVisit}회
                    </div>
                    <div>
                      <span class="ico_wrt"></span>
                      <b>내가 쓴 글 보기 :</b> ${_cafeDTO.loginUser.cafeUserWrite}개
                    </div>
                    <div>
                      <span class="ico_cmt"></span>
                      <b>내가 쓴 댓글보기 :</b> ${_cafeDTO.loginUser.cafeUserReply}개
                    </div>
                  </li>
                  </c:if>
                  <!-- end 카페 가입 회원 정보 -->
                  <li>
                  <c:choose>

                  <c:when test="${_cafeDTO.isCafeManager eq 'true' || _cafeDTO.isCafeMember eq 'true'}">
                    <input type="button" class="button" value="카페 글쓰기" onclick="changeCafeMenu('/navercafe/user/board/writeForm')" style="width:100%;">
                  </c:when>
                  <c:otherwise>
                    <c:if test="${loginId ne null}">
                    <input type="button" class="button" value="카페 가입하기" onclick="changeCafeMenu('${contextPath}/user/cafeSignup?cafeId=${_cafeDTO.cafeId }')" style="width:100%;">
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
          	<c:when test="${_cafeDTO.cafeMenuList eq null || _cafeDTO.cafeMenuList.size() == 0}">
          	<li>등록된 게시판이 없습니다.</li>
          	</c:when>
          	<c:otherwise>
          	<li>
            	<a href="${contextPath}/user/board/goBoardList?cafeId=${_cafeDTO.cafeId}">전체글보기</a>
            	<span class="text-primary">${_cafeDTO.countMap.totalBoardCount}</span>
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
            <c:forEach var="cafeMenu" items="${_cafeDTO.cafeMenuList}">
            <!-- 공개 게시판이이거나 카페 회원일 때 공개 -->
            <c:if test="${cafeMenu.boardPublicFlag eq 'Y' || _cafeDTO.isCafeMember eq 'true'}">
              <li><a href="javascript:changeCafeMenu('${contextPath}/user/board/goBoardList', ${cafeMenu.boardMenuNum})">${cafeMenu.boardMenuName}</a></li>
            </c:if>
            </c:forEach>
            <c:if test="${_cafeDTO.cafeMenuList eq null || _cafeDTO.cafeMenuList.size() == 0}">
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
