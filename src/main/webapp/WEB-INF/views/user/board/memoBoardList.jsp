<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<style>
.indentSpan {color: #2f8cff;}
.select-div {vertical-align:top;cursor: pointer;}
.option-div {cursor: pointer; line-height:30px;padding: 0 12px;color: #555;}
.option-div:hover {background:#e2faea;color:#03c75a;border-radius: 4px;}
.option-div a {color: #555;}
.option-div a:hover {background:#e2faea; color:#03c75a;text-decoration:underline;}
.select-div::after {content: "";display: inline-block;margin-left: 10px; background-position: -229px -185px;width: 12px;height: 5px;}
.select-modal {position:absolute;background:#fff;text-align: left;display:block;z-index:100;display:none;color: #555;background-color: #fff; border: 1px solid #ccc;border-radius: 4px;-webkit-box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%); box-shadow: inset 0 1px 1px rgb(0 0 0 / 8%);}
.select-modal span.wave {vertical-align:middle;}
.select-modal label {margin:0 5px 0 0;vertical-align:middle;font-weight:normal;cursor:pointer;}
.select-modal input {width: 95px;font-size: 13px;height: auto;padding: 5px 10px; margin:0;}
.select-modal .button {vertical-align:middle; margin:0 0 0 5px}
#searchConditionOption{margin-left: -13px;margin-top: 5px;width: 122px;}
#searchDateOption{margin-top: 5px;margin-left: -13px;}
</style>

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
		      	
		      	<!-- 메모 작성글들   -->
		      	<div class="memo-list-area">
		        <c:forEach var="board" items="${boardList}">
		         	<div class="memo-board">
			        	<header class="page-header blog-title">
			          		<div class="post-meta-area">
			              		<div class="memo-profile">
			              		<c:choose>
			              		<c:when test="${board.cafeUserImageNum eq null || board.cafeUserImageNum == 0}">
			              			<img src="${contextPath}/resources/img/Users-Folder-icon.png" class="profileImg-small">
			              		</c:when>
								<c:otherwise>
									<img src="${contextPath}/file/download?cafeUserImageNum=${board.cafeUserImageNum}" class="profileImg-small"
										onerror="${contextPath}/resources/img/Users-Folder-icon.png">
								</c:otherwise>
								</c:choose>
			                	</div>
								<div class="memo-nickname">
									<a href="#">${board.cafeUserNickname}</a>
									<c:if test="${(board.cafeUserGrade >= 0 && board.cafeUserGrade <= 5) 
										|| board.cafeUserGrade == 999}">
			              			<img src="${contextPath}/resources/img/grade/icon/level${board.cafeUserGrade}.gif">
			              			</c:if>
								</div>
								<div class="memo-action">
									<a href="javascript:modifyBoard(${board.boardNum})">수정</a> | <a href="javascript:deleteBoard(${board.boardNum})">삭제</a>
								</div>
								<div class="memo-date"><fmt:formatDate value="${board.boardSaveDate}" pattern="YYYY-MM-dd hh:mm"/></div>
			           		</div>
			    		</header>
						<div class="board-post-desc">
			          		<div class="memo-content">${board.boardContent}</div>
							<a href="javascript:replyClick(${board.boardNum})" id="replyA_${board.boardNum}" class="replyA">
								<span>^</span> 댓글  ${board.replyCount}
							</a><!--memoNum의 아이디 그룹을 갖고있는 수만큼 표시  -->
			          	</div>
			          
			          	<!-- 댓글 클릭시 생성되는 div  -->
			          	<div id="replyArea_${board.boardNum}" class="reply-list-area" style="display:none;">
			          	<!--  	근데 메모는 답글들 먼저 보여주고. 답글view		 -->
			          		<c:if test="${board.replyList ne null && board.replyList.size() > 0}">
			          		<article class="comment-content" style="color:black;">
			          			<ul>
			          			<c:forEach var="reply" items="${board.replyList}">
                      				<li id="reply_${reply.replyNum}" style="padding-left:${15 * reply.replyIndent}px;">
	                      				<c:if test="${reply.replyIndent > 0}">
	                      				<span class="indentSpan">└</span>
	                      				</c:if>
					            		<span>
						              	<c:choose>
					              			<c:when test="${reply.cafeUserImageNum eq null || reply.cafeUserImageNum == 0}">
					              			<img src="${contextPath}/resources/img/Users-Folder-icon.png" class="profileImg-small">
					              			</c:when>
											<c:otherwise>
											<img src="${contextPath}/file/download?cafeUserImageNum=${reply.cafeUserImageNum}" class="profileImg-small"
											onerror="${contextPath}/resources/img/Users-Folder-icon.png">
											</c:otherwise>
										</c:choose>
										</span>
										<span>
											<a href="#" class="comment-author">
						                       ${reply.cafeUserNickname}
						                    </a>
						                    <c:if test="${(board.cafeUserGrade >= 0 && board.cafeUserGrade <= 5) 
												|| board.cafeUserGrade == 999}">
						              		<img src="${contextPath}/resources/img/grade/icon/level${board.cafeUserGrade}.gif">
						              		</c:if>
						              		<c:if test="${board.userId == reply.userId}">
						              		<span class="writer">작성자</span>
						              		</c:if>
										</span>
										<span>
											<small class="comment-meta"><fmt:formatDate value="${reply.replySaveDate}" pattern="YYYY.MM.dd. HH:mm"/></small>
										</span>
										<span class="reReply" onclick="showReReplyArea('${board.boardNum}_${reply.replyNum}')">
											<img src="${contextPath}/resources/img/bu_arr.png"> 답글
										</span>
										<span class="reply-action">
											<a href="#">수정</a> | <a href="#">삭제</a>
										</span>
					                  	<div class="reply-content">
					                  		<div>${reply.replyContent}</div>
					                  		<c:forEach var="replyFile" items="${reply.fileList}">
					                  		<img alt="${replyFile.fileOrgName}" src="${contextPath}/file/download?replyNum=${replyFile.replyNum}" style="max-width:70%;">
					                  		</c:forEach>
					                  	</div>
				                  		<!-- 답글의 답글 입력 -->
					                  	<form name="reReplyForm" id="replyForm_${board.boardNum}_${reply.replyNum}" class="row reReplyForm" method="post" 
					                  		enctype="multipart/form-data" style="display:none;">
									  		<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
									  		<input type="hidden" name="userId" value="${_cafeDTO.loginUser.userId}">
									  		<input type="hidden" name="boardMenuNum" value="${_cafeDTO.menuDTO.boardMenuNum}">
									  		<input type="hidden" name="boardNum" value="${reply.boardNum}">
									  		<input type="hidden" name="replyGroup" value="${reply.replyGroup}">
									  		<input type="hidden" name="replyParent" value="${reply.replyNum}">
									  		<input type="hidden" name="replyStep" value="${reply.replyStep+1}">
									  		<input type="hidden" name="replyIndent" value="${reply.replyIndent+1}">
								  		
								    		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								    			<div class="reply-input-area">
									    			<div class="reply-input">
									    				<textarea name="replyContent" rows="2" placeholder="└> ${reply.cafeUserNickname}님에게 답글쓰기"></textarea>
									    				<div id="previewReplyArea_${board.boardNum}_${reply.replyNum}" class="previewReplyArea" style="display:none;">
									    					<img id="previewReplyImg_${board.boardNum}_${reply.replyNum}" style="max-width:70%;">
									    					<a href="javascript:deleteReplyImage('${board.boardNum}_${reply.replyNum}')">삭제 X</a>
									    				</div>
									    			</div>
								    			</div>
									      	
												<div class="post-meta-area">
											  		<div class=reply-file-attach>
											  			<img src="${contextPath}/resources/img/camera-icon.png" title="답글 이미지 첨부" alt="답글 이미지 첨부"
											  				class="imageAttach" onclick="this.nextElementSibling.click()">
											  			<input type="file" id="replyImage_${board.boardNum}_${reply.replyNum}" name="replyImage" class="replyImage" 
											  				onchange="previewReplyImage('${board.boardNum}_${reply.replyNum}')">
											  		</div>
											  		<div class="reply-file-btns">
											  			<button type="button" onclick="writeReply('${board.boardNum}_${reply.replyNum}')">등록</button>
											  		</div>
										  		</div>
								  			</div>
								  		</form>
									</li>
	                      			</c:forEach>
			          			</ul>
	                    	</article>
	                    	</c:if>
		                    <!-- 답글 입력 -->
	                    	<form name="replyForm" id="replyForm_${board.boardNum}" class="row" method="post" enctype="multipart/form-data">
						  		<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
						  		<input type="hidden" name="userId" value="${_cafeDTO.loginUser.userId}">
						  		<input type="hidden" name="boardMenuNum" value="${_cafeDTO.menuDTO.boardMenuNum}">
						  		<input type="hidden" name="boardNum" value="${board.boardNum}">
						  		<input type="hidden" name="replyGroup" value="0">
						  		<input type="hidden" name="replyParent" value="0">
						  		<input type="hidden" name="replyStep" value="0">
						  		<input type="hidden" name="replyIndent" value="0">
					  		
					    		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						    		<div class="reply-input-area">
							    		<div class="reply-input">
							    			<textarea name="replyContent" rows="2" placeholder="답글을 남겨보세요"></textarea>
							    			<div id="previewReplyArea_${board.boardNum}" class="previewReplyArea" style="display:none;">
							    				<img id="previewReplyImg_${board.boardNum}" style="max-width:70%;">
							    				<a href="javascript:deleteReplyImage(${board.boardNum})">삭제 X</a>
							    			</div>
							    		</div>
							    		<button type="button" onclick="writeReply(${board.boardNum})">등록</button>
						    		</div>
						      	
									<div class="post-meta-area">
									  	<div class=reply-file-attach>
									  		<img src="${contextPath}/resources/img/camera-icon.png" title="답글 이미지 첨부" alt="답글 이미지 첨부"
									  			class="imageAttach" onclick="this.nextElementSibling.click()">
									  		<input type="file" id="replyImage_${board.boardNum}" name="replyImage" class="replyImage" onchange="previewReplyImage(${board.boardNum})">
									  	</div>
							  		</div>
					  			</div>
					  		</form>
                		</div>		
					</div>
		    		</c:forEach>
		    	</div>
			    <!-- end 메모 작성글 들 -->
			     
				<!-- 페이징  -->
				<div class="paging" align="center">
					<ul class="pagination">
						<li><a href="javascript:searchBoardList(1)">&lt;&lt;</a></li>
				      	<li><a href="javascript:searchBoardList(${menuDTO.startPage > 1 ? menuDTO.startPage-1 : 1})">&lt;</a></li>
			          	<c:forEach var="page" begin="${menuDTO.startPage}" end="${menuDTO.endPage}">
			            <li${menuDTO.page eq page ? ' class="active"' : ''}><a href="javascript:searchBoardList(${page})">${page}</a></li>
			          	</c:forEach>
			          	<li><a href="javascript:searchBoardList(${menuDTO.endPage < menuDTO.totalPage ? menuDTO.endPage+1 : menuDTO.totalPage })">&gt;</a></li>
			          	<li><a href="javascript:searchBoardList(${menuDTO.totalPage})">&gt;&gt;</a></li>
					</ul>
				</div>
				
				<!-- 검색 -->
				<article class="comment-content memo-search">
					<form name="boardListForm" action="${contextPath}/user/board/goBoardList">
						<input type="hidden" name="cafeId" value="${menuDTO.cafeId}">
						<input type="hidden" name="boardMenuNum" value="${menuDTO.boardMenuNum}">
						<input type="hidden" name="page" value="${menuDTO.page}">
						
						<div class="select-div form-control-inline" onclick="showOption('searchDateOption')">
							<c:set var="dateText" value="전체기간"/>
							<c:choose>
								<c:when test="${menuDTO.searchCondition eq ''}">
									<c:set var="dateText" value="전체기간"/>
								</c:when>
								<c:when test="${menuDTO.searchCondition eq 'inputDate'}">
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
							<c:set var="conditionText" value="메모내용"/>
							<c:choose>
								<c:when test="${menuDTO.searchCondition eq 'boardContent'}">
									<c:set var="conditionText" value="메모내용"/>
								</c:when>
								<c:when test="${menuDTO.searchCondition eq 'cafeUserNickname'}">
									<c:set var="conditionText" value="메모작성자"/>
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
								<div class="option-div" onclick="selectOption('boardContent', 'searchCondition')">메모내용</div>
								<div class="option-div" onclick="selectOption('cafeUserNickname', 'searchCondition')">메모작성자</div>
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
		var searchDate = document.getElementById('searchDate');
		
		if(searchDate.value != 'inputDate') {
			var startSearchDate = form.startSearchDate;
			var endSearchDate = form.endSearchDate;
			startSearchDate.parentElement.removeChild(startSearchDate);
			endSearchDate.parentElement.removeChild(endSearchDate);
		}
		
		form.page.value = page;
		form.submit();
	}
	
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
</script>      