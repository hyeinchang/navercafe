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
		            <form name="boardWriteForm" id="boardWriteForm" action="memoSave" class="row" method="post">
		            	<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
		            	<input type="hidden" name="userId" value="${_cafeDTO.loginUser.userId}">
		            	<input type="hidden" name="boardMenuNum" value="${_cafeDTO.menuDTO.boardMenuNum}">
		            	<input type="hidden" name="boardNotice" value="N">
		            	<input type="hidden" name="boardTitle" value="${_cafeDTO.menuDTO.boardMenuName}의 글">
		            	
		              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                <textarea class="form-control memo-board-content" name="boardContent" rows="6" placeholder="글을 입력해 주세요."></textarea>
		                <span style="display:none;">
		               	 	<input type="checkbox" name="checkbox" value="" style="zoom: 1.5; cursor:pointer;"> 스탭만 보기
		                </span>
	                	<span style="float: right;">
	                		<button type="button" class="button" onclick="writeBoard()">등록</button>
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
<form name="boardListForm" action="${contextPath}/user/board/goBoardList">
	<input type="hidden" name="cafeId" value="${menuDTO.cafeId}">
	<input type="hidden" name="boardMenuNum" value="${menuDTO.boardMenuNum}">
	<input type="hidden" name="page" value="${menuDTO.page}">
</form>
<script type="text/javascript">
	// 글 작성
	function writeBoard() {
		var form = document.boardWriteForm;
		var xhr = new XMLHttpRequest();
		var boardContent = form.boardContent;
		var data = new Object();
		
		if(boardContent.value == '') {
			alert('내용을 입력해주세요.');
			boardContent.focus();
			return;
		}
		
		data = getData(form);
		
		xhr.open('post', '${contextPath}/user/board/writeBoard', false);
		xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
		xhr.setRequestHeader('Content-Type', 'application/json');
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
	 			var message = '';
	 			
	 			if(Number(xhr.response) == 1) {
	 				var boardListForm = document.boardListForm;
	 				
	 				boardListForm.action = '${contextPath}/user/board/goBoardList';
	 				boardListForm.submit();
	 			} else {
	 				alert('저장에 실패했습니다.');
	 			}
			}
		}
		
		xhr.send(JSON.stringify(data));
	}
	
	// 답글 작성
	function writeReply(boardNum) {
		var form = document.getElementById('replyForm_' + boardNum);
		var xhr = new XMLHttpRequest();
		var replyContent = form.replyContent;
		
		if(replyContent.value == '') {
			alert('내용을 입력해주세요.');
			replyContent.focus();
			return;
		}
		
		xhr.open('post', '${contextPath}/user/reply/writeReply', false);
		xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
	 			var message = '';
	 			
	 			if(Number(xhr.response) == 1) {
					var boardListForm = document.boardListForm;
	 				
	 				boardListForm.action = '${contextPath}/user/board/goBoardList';
	 				boardListForm.submit();
	 			} else {
	 				alert('저장에 실패했습니다.');
	 			}
			}
		}
		
		xhr.send(new FormData(form));
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
	
	// 답글 이미지 미리보기
	function previewReplyImage(boardNum) {
		var fileInput = event.target;
		var file = fileInput.files[0];
		var fileReader = null;
		
		if(file.type.indexOf('image') < 0) {
			alert('이미지 파일이 아닙니다.');
			fileInput.files = null;
			fileInput.value = '';
			return;
		}
		
		fileReader = new FileReader();
		fileReader.readAsDataURL(file);
		fileReader.onload = function() {
			var previewReplyArea = document.getElementById('previewReplyArea_' + boardNum);
			var previewReplyImg = document.getElementById('previewReplyImg_' + boardNum);
			
			previewReplyImg.src = fileReader.result;
			previewReplyArea.style.display = '';
		}
	}
	
	// 답글 이미지 삭제
	function deleteReplyImage(boardNum) {
		var replyImage = document.getElementById('replyImage_' + boardNum);
		var previewReplyArea = document.getElementById('previewReplyArea_' + boardNum);
		var previewReplyImg = document.getElementById('previewReplyImg_' + boardNum);
		
		replyImage.files = null;
		replyImage.value = '';
		previewReplyImg.src = '';
		previewReplyArea.style.display = 'none';
	}
	
	// 답글 - 답글 영역 생성
	function showReReplyArea(boardNum_replyNum) {
		var forms = document.getElementsByClassName('reReplyForm');
		var form = document.getElementById('replyForm_' + boardNum_replyNum);
		
		for(var i=0;i<forms.length;i++) {
			forms[i].style.display = 'none';
		}
		
		form.style.display = '';
	}
	
	// 댓글 보기
	function replyClick(boardNum){
		var replyArea = document.getElementById('replyArea_' + boardNum);
		
		if(replyArea.style.display == 'none') {
			replyArea.style.display = 'block';
		} else {
			replyArea.style.display = 'none';
		}
	}
	
	// 게시글 수정
	function modifyBoard(boardNum) {
		
	}
	
	// 게시글 삭제
	function deleteBoard(boardNum) {
		
	}
	
	function searchBoardList(page) {
		var form = boardListForm;
		
		form.page.value = page;
		form.submit();
	}
</script>      