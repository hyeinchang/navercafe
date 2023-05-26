<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	<div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${_cafeDTO.cafeLayout eq 'left' ? '' : 'style="float:right;"'}>
       	<section class="section1">
		    <div class="container clearfix">
		      <div class="title">
		       	<h4>
		          <span>${boardMenuName}</span>
		        </h4>
		      </div>
		      <div class="col-lg-8 col-md-8 col-sm-8 clearfix">
		      	<!--  메모 작성 부분-->
		        <div class="memo-board">
		            <form name="boardModifyForm" id="boardModifyForm" method="post">
		            	<input type="hidden" name="cafeId" value="${boardDTO.cafeId}">
		            	<input type="hidden" name="userId" value="${boardDTO.userId}">
		            	<input type="hidden" name="boardMenuNum" value="${boardDTO.boardMenuNum}">
		            	<input type="hidden" name="boardNotice" value="${boardDTO.boardNotice}">
		            	<input type="hidden" name="boardTitle" value="${boardDTO.boardTitle}">
		            	<input type="hidden" name="boardNum" value="${boardDTO.boardNum}">
		            	
		              	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                	<textarea class="form-control memo-board-content" name="boardContent" rows="6" placeholder="글을 입력해 주세요.">${boardDTO.boardContent}</textarea>
			                <span style="display:none;">
			               	 	<input type="checkbox" name="checkbox" value="" style="zoom: 1.5; cursor:pointer;"> 스탭만 보기
			                </span>
		                	<span style="float: right;">
		                		<button type="button" class="button" onclick="goBoardList()" style="background:#ccc;">취소</button>
		                		<button type="button" class="button" onclick="modifyBoard()">수정</button>
		                	</span>
		              </div>
		           </form>
			    </div>
		      	<!-- end 메모 작성 부분 -->
				
		      </div>
		      <!-- end content -->
		    </div>
		    <!-- end container -->
		  </section>
      </div>
      <!-- end content -->
<form name="boardListForm">
	<input type="hidden" name="cafeId" value="${boardDTO.cafeId}">
   	<input type="hidden" name="userId" value="${boardDTO.userId}">
   	<input type="hidden" name="boardMenuNum" value="${boardDTO.boardMenuNum}">
    <input type="hidden" name="startSearchDate" value="${menuDTO.startSearchDate}">
	<input type="hidden" name="endSearchDate" value="${menuDTO.endSearchDate}">
	<input type="hidden" name="searchDate" value="${menuDTO.searchDate}">
	<input type="hidden" name="searchCondition" value="${menuDTO.searchCondition}">
	<input type="hidden" name="searchKeyword" value="${menuDTO.searchKeyword}">	
	<input type="hidden" name="page" value="${menuDTO.page}">
</form>
<script type="text/javascript">
	//게시글 수정
	function modifyBoard() {
		var form = document.boardModifyForm;
		var xhr = new XMLHttpRequest();
		var boardContent = form.boardContent;
		var data = new Object();
		
		if(boardContent.value == '') {
			alert('내용을 입력해주세요.');
			boardContent.focus();
			return;
		}
		
		data = getData(form);
		
		xhr.open('post', '${contextPath}/user/board/modifyBoard', false);
		xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
		xhr.setRequestHeader('Content-Type', 'application/json');
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
	 			var message = '';
	 			
	 			if(Number(xhr.response) == 1) {
	 				goBoardList();
	 			} else {
	 				alert('저장에 실패했습니다.');
	 			}
			}
		}
		
		xhr.send(JSON.stringify(data));
	}
	
	// form data를 object로 반환
	function getData(form) {
		var data = new Object();
		
		for(var i=0;i<form.length;i++) {
			var element = form[i];
			
			if(element.name && element.value) {
				data[element.name] = element.value;
			}
		}
		
		return data;
	}
	
	// 게시판 목록으로 이동
	function goBoardList() {
		var form = document.boardListForm;
		
		clearDate(form);
		form.action = '${contextPath}/user/board/goBoardList';
		form.submit();
	}
	
	// 기간 입력으로 검색하지 않을 경우 기간 삭제
	function clearDate() {
		var form = document.boardListForm;
		var searchDate = form.searchDate;
		
		if(searchDate.value != 'inputDate') {
			var startSearchDate = form.startSearchDate;
			var endSearchDate = form.endSearchDate;
			startSearchDate.parentElement.removeChild(startSearchDate);
			endSearchDate.parentElement.removeChild(endSearchDate);
		}
	}
</script>      