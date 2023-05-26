<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<script>
$(function() {
	$('.datepicker').datepicker({
		format : 'yyyy-mm-dd'
		, language : 'ko'
		, todayHighlight: true
		, autoclose: true
		, todayBtn: "linked"
		//, clearBtn: true
	});
});

</script>
<style>
.simple-board textarea {resize:none;}
.simple-board .board {display:none;}
.simple-board .control-btns {padding: 0 0 10px 10px}
.simple-board .control-btns > img {width: 30px;height: 30px;cursor:pointer;}
.simple-board .control-btns > input[type="file"] {width:0;height:0;}
.simple-board .control-btns .action-btns {float:right;}
.simple-board .control-btns #writeBoard {width:100px;}
.simple-board .board-write .file-list {background: #f5f5f5;border: 1px solid #eeeeee; padding: 20px;margin-bottom:12px;}
.simple-board .regist-file-count {float: right;}
.simple-board .board-list {border: 1px solid #eee; padding: 10px 20px;}
.simple-board .board:not(:last-child){ border-bottom: 1px solid #ccc;}
.simple-board .board {padding: 10px 0;}
.simple-board .board-header { border-bottom: 1px solid #EEEEEE;margin: 0 0; padding-bottom: 10px;}
.simple-board .board-header > div {margin-right: 5px; display:inline-block; vertical-align:middle;}
.simple-board .cafe-user-image img {border: none !important; border-radius: 100%;width: 24px; height: 24px;}
.simple-board .board-owner a {color: #696E74;}
.simple-board .board-owner a:hover {text-decoration: underline;}
.simple-board .board-save-date {float: right; color: #aaa;}
.simple-board .board-content {padding: 20px 0 40px;}

.simple-board .reply-list {background: #f5f5f5;border: 1px solid #eeeeee; margin-bottom: 20px;padding: 20px;}
.simple-board .reply:not(:last-child) {padding-bottom: 25px;margin-bottom: 25px; border-bottom: 1px dotted #aaa;}
.simple-board .reply-header > div {margin-right: 5px; display:inline-block; vertical-align:middle;}
.simple-board .reply-save-date {font-size: 12px;color: #aaa; padding-left: 10px;}
.simple-board .reply-owner {float:right;}
.simple-board .reply-owner a {color: #696E74;}
.simple-board .reply-owner a:hover {text-decoration: underline;}
.simple-board .reply-reply:hover {cursor: pointer;text-decoration:underline;}
.simple-board .reply-content {margin-top:10px;}
.simple-board .reply-write {padding: 0 15px;}
.simple-board .reply-write textarea {width:85%;display: inline-block;}
.simple-board .reply-write .action-btns button{width:14%;vertical-align:top;height:73px;}
.simple-board .reply-write .file-list {margin: 10px;}
.simple-board #reply-form {display:none;}
</style>

	<div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${_cafeDTO.cafeLayout eq 'left' ? '' : 'style="float:right;"'}>
       	<section class="section1">
		    <div class="container clearfix">
		      <div class="title">
		       	<h4>
		          <span>${boardMenuName}</span>
		        </h4>
		      </div>
		      <div class="col-lg-8 col-md-8 col-sm-8 clearfix simple-board">
		      	<!--  메모 작성 부분-->
		        <div class="board-write">
		            <form name="boardWriteForm" class="row" method="post">
		            	<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}" id="cafeId">
		            	<input type="hidden" name="userId" value="${_cafeDTO.loginUser.userId}" id="userId">
		            	<input type="hidden" name="boardMenuNum" value="${_cafeDTO.menuDTO.boardMenuNum}">
		            	<input type="hidden" name="boardNotice" value="N">
		            	<input type="hidden" name="boardTitle" value="${_cafeDTO.menuDTO.boardMenuName}의 게시글">
		            	
		              	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			                <textarea class="form-control" name="boardContent" rows="6" placeholder="글을 입력해 주세요."></textarea>
			                <div class="control-btns">
					  			<img src="${contextPath}/resources/img/camera-icon.png" title="이미지 첨부" alt="이미지 첨부" onclick="this.nextElementSibling.click()">
					  			<input type="file" name="boardImage" class="replyImage" onchange="">
					  			<img src="${contextPath}/resources/img/Video-Folder-icon.png" title="동영상 첨부" alt="동영상 첨부" onclick="this.nextElementSibling.click()">
					  			<input type="file" name="boardVideo" class="replyImage" onchange="">	
					  			<img src="${contextPath}/resources/img/Settings-icon.png" title="설정" alt="설정">	
					  			
					  			<span class="action-btns">
		                			<button type="button" id="writeBoard" class="button" onclick="writeBoard()">등록</button>
		                		</span>	
					  		</div>
					  		<div class="file-list">
					  			<header class="file-header">
					  				<strong>첨부파일</strong>
					  				<span class="regist-file-count">이미지 <span id="image-count">1</span>/5 &nbsp;|&nbsp; 동영상 <span id="video-count">1</span>/5</span>
					  			</header>
					  			<article class="file-article">
					  			</article>
					  		</div>
		              	</div>
		            </form>
			    </div>
		      	<!-- end 메모 작성 부분 -->
		      	
		      	<!-- 메모 작성글들   -->
		      	<div class="board-list" id="board-list">
		         	<div class="board" id="board-copy">
			        	<header class="board-header">
		              		<div class="cafe-user-image">
		              			<img src="${contextPath}/resources/img/Users-Folder-icon.png" alt="프로필 이미지" class="cafe-user-image-num">
		              		</div>
							<div class="">
								<span class="cafe-user-nickname"></span>
								<img src="" class="cafe-user-grade">
							</div>
							<div class="board-owner">
								<a href="javascript:modifyBoard(#boardNum#)">수정</a> | <a href="javascript:deleteBoard(#boardNum#)">삭제</a>
							</div>
							<div class="board-save-date"></div>
			    		</header>
						<article class="board-article">
			          		<div class="board-content"></div>
			          		<div class="file-list"></div>
							<a href="javascript:displayReplyList(#boardNum#)">
								<span>^ 댓글</span> <span class="reply-count"></span>
							</a>
			          	</article>
			          	<div class="reply-list" style="display:none;">
			          		<div class="reply" id="reply-copy">
			          			<header class="reply-header">
				          			<div class="cafe-user-image">
				          				<img src="${contextPath}/resources/img/Users-Folder-icon.png" alt="프로필 이미지" class="cafe-user-image-num">
				          			</div>
									<div class="">
										<span class="cafe-user-nickname"></span>
										<img src="" class="cafe-user-grade">
									</div>
									<div class="reply-save-date"></div>
									<div class="reply-reply" onclick="copyReplyForm(this)">
										<img src="/navercafe/resources/img/bu_arr.png"> 댓글
									</div>
									<div class="reply-owner">
										<a href="javascript:modifyBoard(#boardNum#)">수정</a> | <a href="javascript:deleteBoard(#boardNum#)">삭제</a>
									</div>
								</header>
								<article class="reply-article">
					          		<div class="reply-content"></div>
					          		<div class="file-list"></div>
					          	</article>
					          	<div class="reply-modify" style="display:none;"></div>
			          		</div>
			          	</div>
			          	<div class="reply-write" style="display:none;"></div>
					</div>
		    	</div>
			    <!-- end 메모 작성글 들 -->
			    
			    <form name="replyForm" id="reply-form" class="row" method="post" enctype="multipart/form-data" style="display:none;">
			  		<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
			  		<input type="hidden" name="userId" value="${_cafeDTO.loginUser.userId}">
			  		<input type="hidden" name="boardMenuNum" value="${_cafeDTO.menuDTO.boardMenuNum}">
			  		<input type="hidden" name="boardNum" value="0">
			  		<input type="hidden" name="replyGroup" value="0">
			  		<input type="hidden" name="replyParent" value="0">
			  		<input type="hidden" name="replyStep" value="0">
			  		<input type="hidden" name="replyIndent" value="0">
			  		<input type="hidden" name="attachFile" value="false">
					<input type="hidden" name="deleteReplyImage" value="N">
		  		
		  			<div>
		    			<textarea class="form-control" name="replyContent" rows="3" placeholder="댓글을 남겨보세요"></textarea>
		    			<span class="action-btns">
	                		<button type="button" class="write-reply-btn" onclick="writeReply(this)">등록</button>
	                		<button type="button" class="modify-reply-btn" onclick="modifyReply(this)">수정</button>
	                	</span>	
	               	</div>
	    			<div class="file-list">
			  			<header class="file-header">
			  				<strong>첨부파일</strong>
			  			</header>
			  			<article class="file-article">
			  			</article>
			  		</div>
		    		<div class="control-btns">
			  			<img src="${contextPath}/resources/img/camera-icon.png" title="이미지 첨부" alt="이미지 첨부" onclick="this.nextElementSibling.click()">
			  			<input type="file" name="replyImage" onchange="">
			  		</div>
 				</form>
			     
				<!-- 페이징  -->
				<div class="paging" align="center">
					<c:if test="${menuDTO.totalPage > 0}">
					<ul class="pagination">
						<li><a href="javascript:searchBoardList(1)">&lt;&lt;</a></li>
				      	<li><a href="javascript:searchBoardList(${menuDTO.startPage > 1 ? menuDTO.startPage-1 : 1})">&lt;</a></li>
			          	<c:forEach var="page" begin="${menuDTO.startPage}" end="${menuDTO.endPage}">
			            <li${menuDTO.page eq page ? ' class="active"' : ''}><a href="javascript:searchBoardList(${page})">${page}</a></li>
			          	</c:forEach>
			          	<li><a href="javascript:searchBoardList(${menuDTO.endPage < menuDTO.totalPage ? menuDTO.endPage+1 : menuDTO.totalPage })">&gt;</a></li>
			          	<li><a href="javascript:searchBoardList(${menuDTO.totalPage})">&gt;&gt;</a></li>
					</ul>
					</c:if>
				</div>
				
				<!-- 검색 -->
				<article class="comment-content simple-search">
					<form name="boardListForm" action="${contextPath}/user/board/goBoardList">
						<input type="hidden" name="cafeId" value="${menuDTO.cafeId}">
						<input type="hidden" name="boardMenuNum" value="${menuDTO.boardMenuNum}">
						<input type="hidden" name="boardNum" value="0">
						<input type="hidden" name="page" value="${menuDTO.page}">
						
						<div class="select-div form-control-inline" onclick="showOption('searchDateOption')">
							<c:set var="dateText" value="전체기간"/>
							<c:choose>
								<c:when test="${menuDTO.searchDate eq ''}">
									<c:set var="dateText" value="전체기간"/>
								</c:when>
								<c:when test="${menuDTO.searchDate eq 'inputDate'}">
									<c:set var="dateText" value="기간입력"/>
								</c:when>
							</c:choose>
							<span id="searchDateText">${dateText}</span>
							<div class="select-modal" id="searchDateOption">
								<div class="option-div" onclick="selectOption('', 'searchDate')">전체기간</div>
								<div class="option-div">
									<input type="text" class="form-control-inline datepicker" placeholder="YYYY-MM-DD"
										id="startSearchDate" name="startSearchDate" value="${menuDTO.startSearchDate}">
									<span class="wave">~</span>
									<input type="text" class="form-control-inline datepicker" placeholder="YYYY-MM-DD" 
										id="endSearchDate" name="endSearchDate" value="${menuDTO.endSearchDate}">
									<button type="button" class="button" onclick="selectOption('inputDate', 'searchDate')">기간입력</button>
								</div>
							</div>
						</div>
						
						<div class="select-div form-control-inline" onclick="showOption('searchConditionOption')" style="width:122px;">
							<c:set var="conditionText" value="내용"/>
							<c:choose>
								<c:when test="${menuDTO.searchCondition eq 'boardContent'}">
									<c:set var="conditionText" value="내용"/>
								</c:when>
								<c:when test="${menuDTO.searchCondition eq 'cafeUserNickname'}">
									<c:set var="conditionText" value="작성자"/>
								</c:when>
								<c:when test="${menuDTO.searchCondition eq 'replyContent'}">
									<c:set var="conditionText" value="댓글내용"/>
								</c:when>
								<c:when test="${menuDTO.searchCondition eq 'searchCondition'}">
									<c:set var="conditionText" value="댓글작성자"/>
								</c:when>
							</c:choose>
							<span id="searchConditionText">${conditionText}</span>
							<div class="select-modal" id="searchConditionOption">
								<div class="option-div" onclick="selectOption('boardContent', 'searchCondition')">내용</div>
								<div class="option-div" onclick="selectOption('cafeUserNickname', 'searchCondition')">작성자</div>
								<div class="option-div" onclick="selectOption('replyContent', 'searchCondition')">댓글내용</div>
								<div class="option-div" onclick="selectOption('replyCafeUserNickname', 'searchCondition')">댓글작성자</div>
							</div>
						</div>
						
						<input type="hidden" id="searchDate" name="searchDate" value="${menuDTO.searchDate}">
						<input type="hidden" id="searchCondition" name="searchCondition"
							value="${menuDTO.searchCondition eq null ? 'boardContent' : menuDTO.searchCondition}">
						
						<input type="text" class="form-control-inline" placeholder="검색어를 입력해주세요." 
							id="searchKeyword" name ="searchKeyword" value="${menuDTO.searchKeyword}"
							onkeypress="if(event.keyCode == 13)searchBoardList(1)">
						<button type="button" class="button" onclick="searchBoardList(1)">검색</button>
					</form>
				</article>
				
		      </div>
		      <!-- end content -->
		    </div>
		    <!-- end container -->
		  </section>
      </div>
      <!-- end content -->

<script type="text/javascript">
	//댓글 보기
	function displayReplyList(boardNum) {
		var replyList = document.getElementById('reply-list_' + boardNum);
		
		if(replyList.style.display == 'none') {
			replyList.style.display = 'block';
			replyList.nextElementSibling.style.display = 'block';
		} else {
			replyList.style.display = 'none';
			replyList.nextElementSibling.style.display = 'none';
		}
	}
	
	// 검색 옵션을 보여줌
	function showOption(optionId) {
		var selectModal = document.getElementsByClassName('select-modal');
		
		for(var i=0;i<selectModal.length;i++) {
			var option = selectModal[i];
			
			if(option.id == optionId) {
				option.style.display = 'block';
			} else {
				option.style.display = 'none';
			}
		}
	}
	
	// 검색 옵션 선택
	function selectOption(fieldName, inputId) {
		var conditionInput = document.getElementById(inputId);
		var option = document.getElementById(inputId + 'Option');
		var text = document.getElementById(inputId + 'Text');
		
		event.stopPropagation();
		
		if(fieldName == 'inputDate') {
			var startSearchDate = document.getElementById('startSearchDate');
			var endSearchDate = document.getElementById('endSearchDate');
			
			if(startSearchDate.value == '') {
				alert('검색 시작 기간을 입력해주십시오.');
				startSearchDate.focus();
				return;
			}
			
			if(endSearchDate.value == '') {
				alert('검색 종료 기간을 입력해주십시오.');
				endSearchDate.focus();
				return;
			}
		}
		conditionInput.value = fieldName;
		option.style.display = 'none';
		text.innerText = event.target.innerText;
	}
	
	// 검색
	function searchBoardList(page) {
		var form = boardListForm;
		
		clearDate();
		form.action = '${contextPath}/user/board/goBoardList';
		if(Number(page) > 0) {
			form.page.value = page;
		}
		form.submit();
	}
	
	// 기간 입력으로 검색하지 않을 경우 기간 삭제
	function clearDate() {
		var form = boardListForm;
		var searchDate = document.getElementById('searchDate');
		
		if(searchDate.value != 'inputDate') {
			var startSearchDate = form.startSearchDate;
			var endSearchDate = form.endSearchDate;
			startSearchDate.parentElement.removeChild(startSearchDate);
			endSearchDate.parentElement.removeChild(endSearchDate);
		}
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
	
	// 댓글 이미지 미리보기 
	/** (댓글 -> boardNum, 대댓글 -> boardNum_replyNum, 댓글수정 -> modify_replyNum) */
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
		
		if(boardNum.indexOf('modify') > -1) {
			var replyNum = boardNum.split('_')[1];
			var modifyForm = document.getElementById('replyModifyForm_' + replyNum);
			modifyForm.deleteReplyImage.value= 'N';	
		}
	}
	
	// 댓글 이미지 삭제
	/** (댓글 -> boardNum, 대댓글 -> boardNum_replyNum, 댓글수정 -> modify_replyNum) */
	function deleteReplyImage(boardNum) {
		var replyImage = document.getElementById('replyImage_' + boardNum);
		var previewReplyArea = document.getElementById('previewReplyArea_' + boardNum);
		var previewReplyImg = document.getElementById('previewReplyImg_' + boardNum);
		
		replyImage.files = null;
		replyImage.value = '';
		previewReplyImg.src = '';
		previewReplyArea.style.display = 'none';
		
		if(boardNum.indexOf('modify') > -1) {
			var replyNum = boardNum.split('_')[1];
			var modifyForm = document.getElementById('replyModifyForm_' + replyNum);
			modifyForm.deleteReplyImage.value = 'Y';	
		}
	}
	
	// 댓글 - 댓글 영역 생성
	function showReReplyArea(boardNum_replyNum) {
		var forms = document.getElementsByClassName('reReplyForm');
		var form = document.getElementById('replyForm_' + boardNum_replyNum);
		
		for(var i=0;i<forms.length;i++) {
			forms[i].style.display = 'none';
		}
		
		form.style.display = '';
	}
	
	
	// 댓글 수정 form 보여줌
	function showReplyModifyForm(replyNum) {
		var replyModifyForm = document.getElementsByClassName('replyModifyForm');
		var replyContent = document.getElementsByClassName('reply-content');
		
		for(var i=0;i<replyModifyForm.length;i++) {
			var form = replyModifyForm[i];
			var content = replyContent[i];
			
			if(form.id == 'replyModifyForm_' + replyNum) {
				form.style.display = 'block';
				content.style.display = 'none';
			} else {
				form.style.display = 'none';
				content.style.display = 'block';
			}
		}
	}
	
	// 댓글 수정 form 숨김
	function hideRepluModifyForm(replyNum) {
		var replyModifyForm = document.getElementById('replyModifyForm_' + replyNum);
		var replyContent = document.getElementById('reply-content_' + replyNum);
	
		replyModifyForm.style.display = 'none';
		replyContent.style.display = 'block';
	}
	
	// 글 작성
	function writeBoard() {
		var form = document.boardWriteForm;
		var boardContent = form.boardContent;
		var data = new FormData(form);
		
		if(boardContent.value == '') {
			alert('내용을 입력해주세요.');
			boardContent.focus();
			return;
		}
		
		send('post', '${contextPath}/user/board/writeBoard_mulit', data, '', '저장');
	}
	
	// 게시글 수정
	function modifyBoard(boardNum) {
		var form = document.boardListForm;
		
		clearDate();
		form.action = '${contextPath}/user/board/modifyForm';
		form.boardNum.value = boardNum;
		form.submit();
	}
	
	// 게시글 삭제
	function deleteBoard(boardNum) {
		if(confirm('게시글을 삭제하시겠습니까?')) {
			var data = JSON.stringify({'boardNum' : boardNum});
			
			send('post', '${contextPath}/user/board/deleteBoard', data, 'application/json', '삭제');
		}
	}
	
	// 댓글 작성
	function writeReply(button) {
		var form = getForm(button);
		var replyContent = form.replyContent;
		var data = new FormData(form);
		
		if(replyContent.value == '') {
			alert('내용을 입력해주세요.');
			replyContent.focus();
			return;
		}
		
		send('post', '${contextPath}/user/reply/writeReply', data, '', '저장');
	}
	
	// 해당 이벤트 노드의 상위 form 반환
	function getForm(node) {
		var form = node;
		
		while(node.nodeName == 'FORM') {
			node = node.parentElement;
		}
		
		return form;
	}
	
	// 댓글 수정
	function modifyReply(replyNum) {
		var form = document.getElementById('replyModifyForm_' + replyNum);
		var replyContent = form.replyContent;
		var data = new FormData(form);
		
		if(replyContent.value == '') {
			alert('내용을 입력해주세요.');
			replyContent.focus();
			return;
		}
		
		send('post', '${contextPath}/user/reply/modifyReply', data, '', '저장');
	}
	
	// 댓글 삭제
	function deleteReply(replyNum) {
		if(confirm('댓글을 삭제하시겠습니까?')) {
			var form = document.getElementById('replyModifyForm_' + replyNum);
			var data = JSON.stringify(getData(form));
			
			send('post', '${contextPath}/user/reply/deleteReply', data, 'application/json', '삭제');
		}
	}
	
	// 비동기 전송
	function send(type, url, data, contentType, text) {
		xhr.open(type, url, false);
		xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
		
		if(contentType && contentType != '') {
			xhr.setRequestHeader('Content-Type', contentType);
		}
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
	 			if(Number(xhr.response) == 1) {
	 				searchBoardList(0);
	 			} else {
	 				alert(text + '에 실패했습니다.');
	 			}
			}
		}
		
		xhr.send(data);
	}
	
	// 비동기로 게시판 목록을 가져옴
	function getBoardList() {
		var form = document.boardListForm;
		var xhr = new XMLHttpRequest(form);
		var data = getData(form);
		var boardList = null;
		
		xhr.open('post', '${contextPath}/user/board/getBoardList', false);
		xhr.setRequestHeader('Content-Type', 'application/json');
		xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var result = JSON.parse(xhr.response);
				
				boardList = result.boardList;
			}
		}
		
		xhr.send(JSON.stringify(data));
		
		return boardList;
	}
	
	setBoardList();
	
	// 비동기로 가져온 게시판 목록 설정
	function setBoardList() {
		var boardtarget = document.getElementById('board-list');
		var boardList = getBoardList();
		
		if(boardList == null || boardList.length == 0) {
			boardtarget.innerHTML = '<p>등록된 글이 없습니다.</p>';
		} else {
			searchElement(boardList, boardtarget, 'board');
		}
		
	}
	
	// 해당 노드 리스트 검색
	function searchElement(dataList, target) {
		var node = target.children[0];
	
		for(var d=0;d<dataList.length;d++) {
			var clone = node.cloneNode(true);
			var data = dataList[d];
			var cursor = clone.children[0];
			var owner = data['userId'];
			var key = null;
			
			if(target.className == 'board-list') {
				key = data['boardNum'];
			} else if(target.className == 'reply-list') {
				key = data['replyNum'];
			}
		
			clone.id = clone.className + '_' + key;
			target.appendChild(clone);
			
			while(true) {
				var brake = false;
				
				if(cursor.children.length > 0) {
					cursor = cursor.children[0];
				} else {
					while((cursor == null 
							|| cursor.parentElement == null 
							|| cursor.nextElementSibling == null) 
							&& cursor != target) {
						cursor = cursor.parentElement;
					}
					
					if(cursor == target) {
						break;
					}
		
					cursor = cursor.nextElementSibling;
				}
				
				if(cursor.className.indexOf('-owner') > -1) {
					var loginUser = document.getElementById('userId').value;
					
					if(loginUser != owner) {
						cursor.style.display = 'none';
						continue;
					}
				}
				
				// 이벤트가 설정되어있는 node에 key data 설정
				if(cursor.onclick || cursor.onchange || cursor.onkeypress) {
					cursor.dataset.key = key;
				}
				
				// a tag 매개 변수 설정				
				if(cursor.nodeName == 'A' && cursor.href.indexOf('#') > -1) {
					var href = cursor.href;
					var paramName = href.substring(href.indexOf('#')+1, href.lastIndexOf('#'));
					var paramValue = data[paramName];
					
					cursor.href = href.replace('#' + paramName + '#', paramValue);
				}
				
				console.log(className)
				// replyForm 복사
				if(className == 'reply-write' || className == 'reply-modify') {
					var replyForm = document.getElementById('reply-form');
					
					cursor.appendChild(replyForm.cloneNode(true));
				}
				
				if(cursor.className) {
					var classList = cursor.className.split(/\s/gi);
					
					for(var c=0;c<classList.length;c++) {
						var className = classList[c];
						var fieldName = getFieldName(className);
						var value = data[fieldName];
						
						if(!value) {
							continue;
						}
												
						brake = setNodeValue(value, cursor, className, fieldName, key);
					}
				}
				
				if(brake) {
					break;
				}
				
				//console.log(cursor);
			}//-- while
			
			clone.style.display = 'block';
		}//-- for
		
		node.style.display = 'none';
	}
	
	// 변수에 따라 노드 값 설정
	function setNodeValue(data, node, className, fieldName, key) {
		var result = '';
		var brake = false;	// 하위 리스트와 변수명이 중복되므로 멈춤

		switch(className) {
		case 'cafe-user-grade' :
			result = '${contextPath}/resources/img/grade/icon/level' + data + '.gif';
			break;
		case 'cafe-user-image-num' :
			result = '${contextPath}/file/download?' + fieldName + '=' + data;
			break;	
		case 'board-save-date' :
			result = getFormatDate(data , 'YYYY-MM-dd HH:mm');
			break;
	
		case 'file-list' :
			for(var f=0;f<data.length;f++) {
				var file = data[f];
				result += '<img src="${contextPath}/file/download?"'+ fieldName + '=' + file;
			}
			break;
		case 'reply-list' :
			node.id = node.className + '_' + key;
			searchElement(data, node);
			
			if(data.length == 0) {
				node.className = node.className.replace('reply-list', '');
			}
			
			brake = true;
			break;	
		case 'reply-save-date' : 
			result = getFormatDate(data , 'YYYY.MM.dd. HH:mm');
			break;
		default : result = data;
			break;
		}
	
		if(node.nodeName == 'IMG') {
			node.src = result;
		} else {
			if(className.indexOf('list') < 0) {
				node.innerHTML = result;
			}
		}
		
		return brake;
	}
	
	// 클래스 명으로 변수명 반환
	function getFieldName(className) {
		var filedName = className.charAt(0);
		
		for(var i=1;i<className.length;i++) {
			var before = className.charAt(i-1);
			var c = className.charAt(i);
			
			if(before == '-') {
				filedName += c.toUpperCase();
			} else {
				filedName += c;
			}
		}
		
		filedName = filedName.replace(/\-/gi, '');
		
		return filedName;
	}
	
	// 해당 날짜 포맷 반환
	function getFormatDate(value, format) {
		var dateTime = new Date();
		var result = '';
		
		dateTime.setTime(Number(value));
		
		var YYYY = dateTime.getFullYear();
		var MM = dateTime.getMonth() + 1;
		var dd = dateTime.getDate();
		var hh = dateTime.getHours();
		var mm = dateTime.getMinutes();
		
		MM = MM < 10 ? '0' + MM : MM;
		dd = dd < 10 ? '0' + dd : dd;
		hh = hh < 10 ? '0' + hh : hh;
		mm = mm < 10 ? '0' + mm : mm;
		
		switch(format) {
		case 'YYYY-MM-dd HH:mm' : 
			result = YYYY + '-' + MM + '-' + dd + ' ' + hh + ':' + mm;
			break;
		case 'YYYY.MM.dd. HH:mm' : 
			result = YYYY + '.' + MM + '.' + dd + '. ' + hh + ':' + mm;
			break;
		}
		
		return result;
	}
	
</script>      