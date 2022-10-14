<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean id="boardType" class="com.itbank.navercafe.common.menu.BoardMenuType"/>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<c:if test="${message ne null}">
<script type="text/javascript">
	alert('${message}');
</script>
</c:if>

      <div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${_cafeDTO.cafeLayout eq 'left' ? '' : 'style="float:right;"'}>
       	<!-- start 대문 -->
       	<div class="frontArea">
       	<c:choose>
       	<c:when test="${_cafeDTO.cafeFront eq null || _cafeDTO.cafeFront.length() == 0}">
          <div class="default_front">
			<span class="text-primary">카페에 오신것을 환영합니다.</span><br><br>
			  혼자보단 둘이, 둘보단 셋이 더 재미있을 거예요.<br><br>함께 재미있는 이야기 나누며 행복한 카페를 만들어가요!<br><br>
			<c:if test="${_cafeDTO.isCafeManager eq 'true'}">
			<a id="cafeGateModifiableBtn"  target="_parent" class="link_default" 
				href="http://localhost:9090/navercafe/admin/deco/frontdoor?cafeId=${_cafeDTO.cafeId}"
				style="visibility: visible; cursor: pointer;">카페 대문 꾸미기</a>
			</c:if>
		   </div>
		 </c:when> 
		 <c:otherwise>
		   <div class="setting_front">
		     ${_cafeDTO.cafeFront}
		   </div>
		 </c:otherwise> 
		 </c:choose> 
         </div>
         <!-- end 대문 -->

       	 <!-- start 글 목록 -->
       	 <div class="mainBottom">
           <div class="widget component1">
             <h4 class="title">
               <span>전체글 목록</span>
               <a href="javascript:changeCafeMenu('board/goBoardList?cafeId=${_cafeDTO.cafeId}')">더보기</a>
             </h4>
             <ul>
             <c:forEach  var="mainBoard" items="${_cafeDTO.mainBoardList}">
                <c:choose>
	            <c:when test="${mainBoard.boardMenuType == boardType.TOTAL_BOARD_NUM}">
               	<li>
	               	<a href="${contextPath}/user/board/goBoardInside?cafeId=${_cafeDTO.cafeId}&boardMenuNum=${mainBoard.boardMenuNum}&boardNum=${mainBoard.boardNum}">
	               	${mainBoard.boardTitle}
	               	</a>
               	</li>
               	</c:when>
               	<c:when test="${mainBoard.boardMenuType == boardType.GRADE_BOARD_NUM
               		|| mainBoard.boardMenuType == boardType.ATTENDANCE_BOARD_NUM}">
             	<!-- 등업 게시글, 출석 게시글은 가져오지 않음 -->
               	</c:when>
               	<c:when test="${mainBoard.boardMenuType == boardType.SIMPLE_BOARD_NUM 
               	 	|| mainBoard.boardMenuType == boardType.MEMO_BOARD_NUM}">
               	<li>
	               	<a href="${contextPath}/user/board/goBoardList?cafeId=${_cafeDTO.cafeId}&boardMenuNum=${mainBoard.boardMenuNum}&boardNum=${mainBoard.boardNum}">
	               	${mainBoard.boardContent}
	               	</a>
               	</li>
               	</c:when>
               	<c:otherwise></c:otherwise>
	            </c:choose>
             </c:forEach>
             <c:if test="${_cafeDTO.mainBoardList eq null || _cafeDTO.mainBoardList.size() == 0}">
               	<li>등록된 게시글이 없습니다.</li>
             </c:if>          
             </ul>
           </div>
         
           <div class="widget component1">
             <h4 class="title">
               <span>최신글 목록</span>
                <a href="javascript:changeCafeMenu('board/goBoardList?cafeId=${_cafeDTO.cafeId}')">더보기</a>
              </h4>
              <ul>            
                <c:forEach var="mainRecent" items="${_cafeDTO.mainRecentList}"> 
	               	<c:choose>
		            <c:when test="${mainRecent.boardMenuType == boardType.TOTAL_BOARD_NUM}">
	               	<li>
		               	<a href="${contextPath}/user/board/goBoardInside?cafeId=${_cafeDTO.cafeId}&boardMenuNum=${mainRecent.boardMenuNum}&boardNum=${mainRecent.boardNum}">
		               	${mainRecent.boardTitle}
		               	</a>
	               	</li>
	               	</c:when>
	               	<c:when test="${mainRecent.boardMenuType == boardType.GRADE_BOARD_NUM
	               		|| mainRecent.boardMenuType == boardType.ATTENDANCE_BOARD_NUM}">
	             	<!-- 등업 게시글, 출석 게시글은 가져오지 않음 -->
	               	</c:when>
	               	<c:when test="${mainRecent.boardMenuType == boardType.SIMPLE_BOARD_NUM 
	               	 	|| mainRecent.boardMenuType == boardType.MEMO_BOARD_NUM}">
	               	<li>
		               	<a href="${contextPath}/user/board/goBoardList?cafeId=${_cafeDTO.cafeId}&boardMenuNum=${mainRecent.boardMenuNum}&boardNum=${mainRecent.boardNum}">
		               	${mainRecent.boardContent}
		               	</a>
	               	</li>
	               	</c:when>
	               	<c:otherwise></c:otherwise>
		            </c:choose>
               </c:forEach>
               <c:if test="${_cafeDTO.mainRecentList eq null || _cafeDTO.mainRecentList.size() == 0}">
               		<li>등록된 게시글이 없습니다.</li>
               </c:if>
              </ul>
           </div>
           
           <div class="widget component2">
             <h4 class="">
               <span>최신 댓글/답글</span>
               <a href="javascript:changeCafeMenu('board/goBoardList?cafeId=${_cafeDTO.cafeId}')">더보기</a>
              </h4>
              <ul>            
                <c:forEach var="mainRecentReply" items="${_cafeDTO.mainRecentReplyList}"> 
               		<c:choose>
		            <c:when test="${mainRecentReply.boardMenuType == boardType.TOTAL_BOARD_NUM}">
	               	<li>
		               	<a href="${contextPath}/user/board/goBoardInside?cafeId=${_cafeDTO.cafeId}&boardMenuNum=${mainRecentReply.boardMenuNum}&boardNum=${mainRecentReply.boardNum}">
		               	${mainRecentReply.boardTitle}
		               	</a>
	               	</li>
	               	</c:when>
	               	<c:when test="${mainRecentReply.boardMenuType == boardType.GRADE_BOARD_NUM
	               		|| mainRecentReply.boardMenuType == boardType.ATTENDANCE_BOARD_NUM}">
	             	<!-- 등업 게시글, 출석 게시글은 가져오지 않음 -->
	               	</c:when>
	               	<c:when test="${mainRecentReply.boardMenuType == boardType.SIMPLE_BOARD_NUM 
	               	 	|| mainRecentReply.boardMenuType == boardType.MEMO_BOARD_NUM}">
	               	<li>
		               	<a href="${contextPath}/user/board/goBoardList?cafeId=${_cafeDTO.cafeId}&boardMenuNum=${mainRecentReply.boardMenuNum}&boardNum=${mainRecentReply.boardNum}">
		               	${mainRecentReply.boardContent}
		               	</a>
	               	</li>
	               	</c:when>
	               	<c:otherwise></c:otherwise>
		            </c:choose>
               </c:forEach>
               <c:if test="${_cafeDTO.mainRecentReplyList eq null || _cafeDTO.mainRecentReplyList.size() == 0}">
               		<li>등록된 게시글이 없습니다.</li>
               </c:if>
              </ul>
           </div>
         </div>
         <!-- end 글 목록 -->
      </div>
      <!-- end content -->
      
<script type="text/javascript">
document.body.onload = function() {
	setTitle();
}

function setTitle() {
	var titleList = document.querySelectorAll('.component1 > ul > li > a');
	
	for(var i=0; i<titleList.length; i++){
		var title = titleList[i];
		title.title = title.innerText;
	}
}
</script>