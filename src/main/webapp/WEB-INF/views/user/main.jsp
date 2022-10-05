<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

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
               <li>
               	<a 
               		href="${contextPath}/user/board/goBoardInside?cafeId=${_cafeDTO.cafeId}&boardMenuNum=${mainBoard.boardMenuNum}&boardNum=${mainBoard.boardNum}">
               	${mainBoard.boardTitle}</a></li>
               </c:forEach>          
             </ul>
           </div>
         
           <div class="widget component1">
             <h4 class="title">
               <span>최신글 목록</span>
                <a href="javascript:changeCafeMenu('board/goBoardList?cafeId=${_cafeDTO.cafeId}')">더보기</a>
              </h4>
              <ul>            
                <c:forEach var="mainRecent" items="${_cafeDTO.mainRecentList}"> 
               <li>
               	<a 
               		href="${contextPath}/user/board/goBoardInside?cafeId=${_cafeDTO.cafeId}&boardMenuNum=${mainRecent.boardMenuNum}&boardNum=${mainRecent.boardNum}">
               	${mainRecent.boardTitle}</a></li>
               </c:forEach> 
              </ul>
           </div>
           
           <div class="widget component2">
             <h4 class="">
               <span>최신 댓글/답글</span>
               <a href="javascript:changeCafeMenu('board/goBoardList?cafeId=${_cafeDTO.cafeId}')">더보기</a>
              </h4>
              <ul>            
                <c:forEach var="mainRecentReply" items="${_cafeDTO.mainRecentReplyList}"> 
               <li>
	               	<a 
	               		href="${contextPath}/user/board/goBoardInside?cafeId=${_cafeDTO.cafeId}&boardMenuNum=${mainRecentReply.boardMenuNum}&boardNum=${mainRecentReply.boardNum}">
	               	${mainRecentReply.boardTitle}</a>
               	</li>
               </c:forEach> 
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