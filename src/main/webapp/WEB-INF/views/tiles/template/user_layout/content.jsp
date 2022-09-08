<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:if test="${message ne null}">
<script type="text/javascript">
	alert('${message}');
</script>
</c:if>
  <section id="intro">
    <div class="container">
      <div class="ror">
        <div class="col-md-8 col-md-offset-2">
          <h1>네이버 카페</h1>
          <p>원하는 주제로 다양한 카페를 만들 수 있습니다.</p>
        </div>
      </div>
    </div>
  </section>

 
  <section class="section1">
    <div class="container clearfix">
      <!-- 주간 랭킹 카페는 일주일 동안 게시글, 댓글 수, 조회 수, 가입 맴버수가 가장 높은 카페 3개를 선정 -->
      <div class="title">
       <h4>
          <span>주간 랭킹 Top3 카페</span>
        </h4>
      </div>
      <div class="col-lg-12 col-md-12 col-sm-12 clearfix">
      <c:choose>
        <c:when test="${rankingList eq null || rankingList.size() == 0}">
        <div class="col-lg-4 col-md-4 col-sm-12" style="width:100%;">
          <div class="dmbox">
            <div class="service-icon">
              <div class="dm-icon-effect-1 effect-slide-bottom in" data-effect="slide-bottom" style="transition: all 0.7s ease-in-out 0s;">
                <i class="dm-icon fa fa-exclamation fa-3x" style="cursor:default;"></i>
              </div>
            </div>
            <h4>등록된 카페가 없습니다.</h4>
          </div>
        </div>
        <!-- end dmbox -->
        </c:when>
        <c:otherwise>
        <c:forEach var="ranking" items="${rankingList}">
         <div class="col-lg-4 col-md-4 col-sm-12">
          <div class="dmbox" style="padding:18px;">
            <div class="service-icon">
              <div class="dm-icon-effect-1 effect-slide-bottom in" data-effect="slide-bottom" style="transition: all 0.7s ease-in-out 0s;">
                <a href="${contextPath}/user/main?cafeId=${ranking.cafeId}"><img src="${ranking.cafeTitle}" alt="${ranking.cafeName}" style="width:300px;height:300px;"></a>
              </div>
            </div>
            <h4><a href="location.href='${contextPath}/user/main?cafeId=${ranking.cafeId}'">${ranking.cafeName}</a></h4>
            <p>${ranking.cafeIntroduce}</p>
          </div>
        </div>
        <!-- end dmbox -->
        </c:forEach>
        </c:otherwise>
      </c:choose>
      </div>
      <!-- end content -->
    </div>
    <!-- end container -->
  </section>
  
  <section class="section1">
    <div class="container clearfix">
      <div class="col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix">
      	<div class="title">
          <h4>
          	<span>카페 검색</span>
          </h4>
        </div>
        <div>
          <form id="bbsearch" class="form-inline">
          	<input type="text" class="form-control" placeholder="검색할 카페명을 입력해주십시오." style="height:auto;margin-top:0;">
          	<button type="button" class="btn btn-primary" 
          		style="font-size:14px;padding: 8px 18px 5px;;margin-top:0;vertical-align:top;border:none;border-radius:2px;">검색</button>
          </form>
        </div>
        <div class="title">
          <h4>
          	<span>카페 목록</span>
          </h4>
        </div>
        <table class="table cstmTbl1 effect-fade in" data-effect="fade" style="transition: all 0.7s ease-in-out 0s;">
          <colgroup>
          	<col width="35%">
          	<col width="65%">
          </colgroup>
          <thead>
            <tr>
              <th>카페명</th>
              <th>카페 소개</th>
            </tr>
          </thead>
          <tbody>
          <c:choose>
          	<c:when test="${cafeList eq null || cafeList.size() == 0}">
          	<tr>
          	  <th colspan="2" class="text-center">등록된 카페가 없습니다.</th>
          	</tr>
          	</c:when>
          	<c:otherwise>
          	<c:forEach var="cafe" items="${cafeList}">
          	<tr>
              <td onclick="changeCafe('${cafe.cafeId}')">${cafe.cafeName}</td>
              <td onclick="changeCafe('${cafe.cafeId}')">${cafe.cafeIntroduce}</td>
            </tr>
            </c:forEach>
          	</c:otherwise>
          </c:choose>
          </tbody>
        </table>
        <div class=" text-center">
          <ul class="pagination">
            <li><a href="#">«</a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">»</a></li>
          </ul>
        </div>
      </div>
      <!-- end content -->

      <div id="sidebar" class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
      <c:choose>
      <c:when test="${loginId eq null}">
        <h4 class="title">
          <span>로그인</span>
        </h4>
        <form id="loginForm" method="post" name="loginForm" action="${contextPath}/user/login">
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-user"></i></span>
              <input type="text" class="form-control" name="id" placeholder="아이디를 입력해주십시오." value="chi9148">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-lock"></i></span>
              <input type="password" class="form-control" name="password" placeholder="비밀번호를 입력해주십시오." value="1234">
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
            <button type="button" class="button" onclick="checkLoginForm()">로그인</button>
            <button type="button" class="button">회원가입</button>
          </div>
        </form>
	  </c:when>
	  <c:otherwise>
	    <div class="login_user_area">
		   <div>
		      <a href="#">
		        <img class="profileImg" src="${contextPath}/resources/img/login_user.png" alt="프로필 이미지">
		      </a>
		      <!-- <a href="javascript:alert('프로필 변경하기')" class="lab_thmb">프로필 변경하기</a> -->
		    </div>
		    <div>
		      <b><span class="text-primary">${loginName}</span>님</b>
		      <div>${loginId}</div>
		      <div class="cafeSetting">
		        <a href="javascript:alert('카페관리로 이동')" class="info-cafe">
			      <span class="ico_aside ico_setting"></span>회원정보수정
			    </a>
			    <a href="javascript:logout();" class="info-cafe">
				  <span class="logout_custom"></span>로그아웃
			    </a>
		       </div>
		     </div>
		 </div>
	  </c:otherwise>
      </c:choose>
      </div>
      <!-- end sidebar -->
    </div>
    <!-- end container -->
  </section>
 <section class="section1" style="display:none;">
    <div class="container clearfix">
      <div class="col-lg-12 col-md-12 col-sm-12 clearfix">
        <div class="clearfix"></div>
      	<h4 class="title">
          <span>최근 방문한 카페</span>
        </h4>

        <div class="col-lg-2 col-md-2 col-sm-2">
          <div class="servicetitle">
            <h5><a href="#">IT뱅크 산업기사 평가과정B</a></h5>
            <hr>
            <p>카페소개</p>
           </div>
        </div>
        <!-- large-2 -->

        <div class="col-lg-2 col-md-2 col-sm-2">
          <div class="servicetitle">
            <h5><a href="#">IT뱅크 산업기사 평가과정B</a></h5>
            <hr>
            <p>카페소개</p>
           </div>
        </div>
        <!-- large-2 -->

        <div class="col-lg-2 col-md-2 col-sm-2">
          <div class="servicetitle">
            <h5><a href="#">IT뱅크 산업기사 평가과정B</a></h5>
            <hr>
            <p>카페소개</p>
           </div>
        </div>
        <!-- large-2 -->

         <div class="col-lg-2 col-md-2 col-sm-2">
          <div class="servicetitle">
            <h5><a href="#">IT뱅크 산업기사 평가과정B</a></h5>
            <hr>
            <p>카페소개</p>
           </div>
        </div>
        <!-- large-2 -->
        
        <div class="col-lg-2 col-md-2 col-sm-2">
          <div class="servicetitle">
            <h5><a href="#">IT뱅크 산업기사 평가과정B</a></h5>
            <hr>
            <p>카페소개</p>
           </div>
        </div>
        <!-- large-2 -->
        
        <div class="col-lg-2 col-md-2 col-sm-2">
          <div class="servicetitle">
            <h5><a href="#">IT뱅크 산업기사 평가과정B</a></h5>
            <hr>
            <p>카페소개</p>
           </div>
        </div>
        <!-- large-2 -->
        
      </div>
      <!-- end content -->
    </div>
    <!-- end container -->
  </section>
  
 <script type="text/javascript">
 	function logout() {
 		location.href='${contextPath}/user/logout';
 	} 
 </script>