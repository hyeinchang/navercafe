<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

      <div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${cafeDTO.cafeLayout > 0 ? '' : 'style="float:right;"'}>
       	<!-- start 대문 -->
       	<div class="frontArea">
       	<c:choose>
       	<c:when test="${cafeDTO.cafeFront eq null || cafeDTO.cafeFront.length() == 0}">
          <div class="default_front">
			<span class="text-primary">카페에 오신것을 환영합니다.</span><br><br>
			  혼자보단 둘이, 둘보단 셋이 더 재미있을 거예요.<br><br>함께 재미있는 이야기 나누며 행복한 카페를 만들어가요!<br><br>
			<a id="cafeGateModifiableBtn" href="/ManageGateEditor.nhn?clubid=30790472" target="_parent" class="link_default" style="visibility: visible; cursor: pointer;">카페 대문 꾸미기</a>
		   </div>
		 </c:when> 
		 <c:otherwise>
		   <div class="setting_front">
		     ${cafeDTO.cafeFront}
		   </div>
		 </c:otherwise> 
		 </c:choose>  
         </div>
         <!-- end 대문 -->
       	 
       	 <!-- start 글 목록 -->
       	 <div class="mainBottom">
           <div class="widget component1">
             <h4 class="title">
               <span>전체글 목록</span><a href="javascript:alert('더보기 이동')">더보기</a>
             </h4>
             <ul>            
               <li><a href="javascript:alert('전체글 보기 이동')">전체글 1</a></li>
               <li><a href="javascript:alert('전체글 보기 이동')">전체글 1전체글 1전체글 1전체글 1전체글 1전체글 1전체글 1전체글 1</a></li>
             </ul>
           </div>
         
           <div class="widget component1">
             <h4 class="title">
               <span>최신글 목록</span><a href="javascript:alert('더보기 이동')">더보기</a>
              </h4>
              <ul>            
                <li><a href="javascript:alert('전체글 보기 이동')">최신글 1</a></li>
              </ul>
           </div>
           
           <div class="widget component2">
             <h4 class="">
               <span>최신 댓글/답글</span><a href="javascript:alert('더보기 이동')">더보기</a>
              </h4>
              <ul>            
                <li><a href="javascript:alert('전체글 보기 이동')">최신글 1</a></li>
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