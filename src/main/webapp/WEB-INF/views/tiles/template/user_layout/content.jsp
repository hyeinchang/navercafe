<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:if test="${message ne null}">
<script type="text/javascript">
	alert('${message}');
</script>
</c:if>
 
  <section class="section1" style="display:none;">
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
            <h4>랭킹 카페가 없습니다.</h4>
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
                <a href="${contextPath}/user/main?cafeId=${ranking.cafeId}"><img src="$${contextPath}/file/download?cafeTitleNum=${ranking.cafeTitleNum}" alt="${ranking.cafeName}" style="width:300px;height:300px;"></a>
              </div>
            </div>
            <h4><a href="${contextPath}/user/main?cafeId=${ranking.cafeId}">${ranking.cafeName}</a></h4>
            <p>${ranking.cafeExplanation}</p>
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
          <form id="searchCafeForm" name="searchCafeForm" class="form-inline" action="./">
          	<input type="hidden" name="page" value="1">
          	<input type="text" name="cafeName" class="form-control" placeholder="검색할 카페명을 입력해주십시오." value="${cafeDTO.cafeName}" 
          		style="width:300px;height:auto;margin-top:0;" onkeypress="if(event.keyCode == 13)searchCafe(1)">
          	<button type="button" class="btn btn-primary" 
          		style="font-size:14px;padding: 8px 18px 5px;;margin-top:0;vertical-align:top;border:none;border-radius:2px;"
          		onclick="searchCafe(1)">검색</button>
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
              <td onclick="changeCafe('${cafe.cafeId}')">
	              <div title="${cafe.cafeName}">
	               <span class="cafeListIcon">
		              <c:choose>
		   	  			<c:when test="${cafe.cafeIconNum eq null || cafe.cafeIconNum == 0}">
		   	  			<img src="${contextPath}/resources/img/cafeicon_default_112x112.png" alt="카페 아이콘 없음">
		   	  			</c:when>
		   	  			<c:otherwise>
		   	  			<img src="${contextPath}/file/download?cafeIconNum=${cafe.cafeIconNum}" alt="카페 아이콘">
		   	  			</c:otherwise>
		   	  		</c:choose>
		   	  		</span>
	 			 	${cafe.cafeName}
              	</div>
              </td>
              <td onclick="changeCafe('${cafe.cafeId}')">
	          	<div title="${cafe.cafeExplanation}">
	          	<c:choose>
	              	<c:when test="${cafe.cafeExplanation eq null || cafe.cafeExplanation.length() == 0}">
	              	등록된 카페 소개가 없습니다.
	              	</c:when>	
	              	<c:otherwise>
	              	${cafe.cafeExplanation}
	              	</c:otherwise>
              	</c:choose>
	            </div>
              </td>
            </tr>
            </c:forEach>
          	</c:otherwise>
          </c:choose>
          </tbody>
        </table>
        <div class=" text-center">
          <ul class="pagination">
          	<c:if test="${pagination.totalPage > 0}">
          	<li><a href="javascript:searchCafe(1)">&lt;&lt;</a></li>
	      	<li><a href="javascript:searchCafe(${pagination.startPage > 1 ? pagination.startPage-1 : 1})">&lt;</a></li>
          	<c:forEach var="page" begin="${pagination.startPage}" end="${pagination.endPage}">
            <li${pagination.page eq page ? ' class="active"' : ''}><a href="javascript:searchCafe(${page})">${page}</a></li>
          	</c:forEach>
          	<li><a href="javascript:searchCafe(${pagination.endPage < pagination.totalPage ? pagination.endPage+1 : pagination.totalPage })">&gt;</a></li>
          	<li><a href="javascript:searchCafe(${pagination.totalPage})">&gt;&gt;</a></li>
          	</c:if>
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
        <form id="loginForm" method="post" name="loginForm" action="${contextPath}/cafe/login">
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-user"></i></span>
              <input type="text" class="form-control" name="id" placeholder="아이디를 입력해주십시오." onkeypress="if(event.keyCode == 13)checkLoginForm()">
            </div>
          </div>
          <div class="form-group">
            <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-lock"></i></span>
              <input type="password" class="form-control" name="password" placeholder="비밀번호를 입력해주십시오." onkeypress="if(event.keyCode == 13)checkLoginForm()">
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
            <button type="button" class="button" onclick="location.href='${contextPath}/cafe/member/signup'">회원가입</button>
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
		        <a href="${contextPath}/cafe/member/userInfo?id=${loginId}" class="info-cafe">
			      <span class="ico_aside ico_setting"></span>회원정보수정
			    </a>
			    <a href="javascript:logout();" class="info-cafe">
				  <span class="logout_custom"></span>로그아웃
			    </a>
		       </div>
		     </div>
		 </div>
		 <input type="button" class="btn btn-primary" value="카페  만들기" onclick="location.href='${contextPath}/cafe/createCafeForm'" style="width:100%;margin-top:20px;">
	  </c:otherwise>
      </c:choose>
      </div>
      <!-- end sidebar -->
    </div>
    <!-- end container -->
  </section>
  
 <script type="text/javascript">
 	function logout() {
 		location.href='${contextPath}/cafe/logout';
 	}
 	
 	function searchCafe(page) {
 		var form = document.searchCafeForm;
 		
 		form.page.value = page;
 		form.submit();
 	}
 </script>