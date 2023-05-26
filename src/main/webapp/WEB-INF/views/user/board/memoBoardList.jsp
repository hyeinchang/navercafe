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
		            	<input type="hidden" name="boardTitle" value="${_cafeDTO.menuDTO.boardMenuName}의 게시글">
		            	
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
		      	<c:if test="${boardList eq null || boardList.size() == 0}">
		      		<p>등록된 글이 없습니다.</p>
		      	</c:if>
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
									<c:if test="${loginId ne null && _cafeDTO.isCafeMember eq 'true' && _cafeDTO.loginUser.userId eq board.userId}">
									<a href="javascript:modifyBoard(${board.boardNum})">수정</a> | <a href="javascript:deleteBoard(${board.boardNum})">삭제</a>
									</c:if>
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
			          	<!--  	근데 메모는 댓글들 먼저 보여주고. 댓글view		 -->
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
											<img src="${contextPath}/resources/img/bu_arr.png"> 댓글
										</span>
										<span class="reply-action">
											<c:if test="${loginId ne null && _cafeDTO.isCafeMember eq 'true' && _cafeDTO.loginUser.userId eq reply.userId}">
											<a href="javascript:showReplyModifyForm(${reply.replyNum})">수정</a> | <a href="javascript:deleteReply(${reply.replyNum})">삭제</a>
											</c:if>
										</span>
					                  	<div class="reply-content" id="reply-content_${reply.replyNum}">
					                  		<div>${reply.replyContent}</div>
					                  		<c:forEach var="replyFile" items="${reply.fileList}">
					                  		<img alt="${replyFile.fileOrgName}" src="${contextPath}/file/download?replyNum=${replyFile.replyNum}" style="max-width:70%;">
					                  		</c:forEach>
					                  	</div>
					                  	<!-- 댓글 수정 입력 -->
					                  	<form name="replyModifyForm" id="replyModifyForm_${reply.replyNum}" class="row replyModifyForm" method="post" 
					                  		enctype="multipart/form-data" style="display:none;">
									  		<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
									  		<input type="hidden" name="userId" value="${_cafeDTO.loginUser.userId}">
									  		<input type="hidden" name="boardMenuNum" value="${_cafeDTO.menuDTO.boardMenuNum}">
									  		<input type="hidden" name="boardNum" value="${reply.boardNum}">
									  		<input type="hidden" name="replyNum" value="${reply.replyNum}">
									  		<input type="hidden" name="replyGroup" value="${reply.replyGroup}">
									  		<input type="hidden" name="replyParent" value="${reply.replyNum}">
									  		<input type="hidden" name="replyStep" value="${reply.replyStep}">
									  		<input type="hidden" name="replyIndent" value="${reply.replyIndent}">
									  		<input type="hidden" name="attachFile" value="${reply.fileList ne null && reply.fileList.size() > 0 ? 'true' : 'false'}">
									  		<input type="hidden" name="deleteReplyImage" value="N">
								  		
								    		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								    			<div class="reply-input-area">
									    			<div class="reply-input">
									    				<textarea name="replyContent" rows="2" placeholder="내용을 입력해주세요.">${reply.replyContent}</textarea>
									    				<div id="previewReplyArea_modify_${reply.replyNum}" class="previewReplyArea" 
									    					${reply.fileList ne null && reply.fileList.size() > 0 ? '' : ' style="display:none"'}>
									    					<c:choose>
									    					<c:when test="${reply.fileList ne null && reply.fileList.size() > 0}">
									    					<c:forEach var="replyFile" items="${reply.fileList}">
									                  		<img id="previewReplyImg_modify_${reply.replyNum}" 
									                  			alt="${replyFile.fileOrgName}" src="${contextPath}/file/download?replyNum=${replyFile.replyNum}"
									                  		 	style="max-width:70%;">
									                  		<a href="javascript:deleteReplyImage('modify_${reply.replyNum}')">삭제 X</a> 	
									                  		</c:forEach>
									    					</c:when>
									    					<c:otherwise>
									    					<img id="previewReplyImg_modify_${reply.replyNum}" style="max-width:70%;">
									    					<a href="javascript:deleteReplyImage('modify_${reply.replyNum}')">삭제 X</a>
									    					</c:otherwise>
									    					</c:choose>
									    				</div>
									    			</div>
								    			</div>
									      	
												<div class="post-meta-area">
											  		<div class=reply-file-attach>
											  			<img src="${contextPath}/resources/img/camera-icon.png" title="댓글 이미지 첨부" alt="댓글 이미지 첨부"
											  				class="imageAttach" onclick="this.nextElementSibling.click()">
											  			<input type="file" id="replyImage_modify_${reply.replyNum}" name="replyImage" class="replyImage" 
											  				onchange="previewReplyImage('modify_${reply.replyNum}')">
											  		</div>
											  		<div class="reply-file-btns">
											  			<button type="button" onclick="hideRepluModifyForm('${reply.replyNum}')" style="background:#ccc;">취소</button>
											  			<button type="button" onclick="modifyReply('${reply.replyNum}')">수정</button>
											  		</div>
										  		</div>
								  			</div>
								  		</form>
				                  		<!-- 댓글의 댓글 입력 -->
				                  		<c:if test="${_cafeDTO.isCafeMember eq 'true'}">
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
									    				<textarea name="replyContent" rows="2" placeholder="└> ${reply.cafeUserNickname}님에게 댓글쓰기"></textarea>
									    				<div id="previewReplyArea_${board.boardNum}_${reply.replyNum}" class="previewReplyArea" style="display:none;">
									    					<img id="previewReplyImg_${board.boardNum}_${reply.replyNum}" style="max-width:70%;">
									    					<a href="javascript:deleteReplyImage('${board.boardNum}_${reply.replyNum}')">삭제 X</a>
									    				</div>
									    			</div>
								    			</div>
									      	
												<div class="post-meta-area">
											  		<div class=reply-file-attach>
											  			<img src="${contextPath}/resources/img/camera-icon.png" title="댓글 이미지 첨부" alt="댓글 이미지 첨부"
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
								  		</c:if>
									</li>
	                      			</c:forEach>
			          			</ul>
	                    	</article>
	                    	</c:if>
		                    <!-- 댓글 입력 -->
		                    <c:if test="${_cafeDTO.isCafeMember eq 'true'}">
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
							    			<textarea name="replyContent" rows="2" placeholder="댓글을 남겨보세요"></textarea>
							    			<div id="previewReplyArea_${board.boardNum}" class="previewReplyArea" style="display:none;">
							    				<img id="previewReplyImg_${board.boardNum}" style="max-width:70%;">
							    				<a href="javascript:deleteReplyImage(${board.boardNum})">삭제 X</a>
							    			</div>
							    		</div>
							    		<button type="button" onclick="writeReply(${board.boardNum})">등록</button>
						    		</div>
						      	
									<div class="post-meta-area">
									  	<div class=reply-file-attach>
									  		<img src="${contextPath}/resources/img/camera-icon.png" title="댓글 이미지 첨부" alt="댓글 이미지 첨부"
									  			class="imageAttach" onclick="this.nextElementSibling.click()">
									  		<input type="file" id="replyImage_${board.boardNum}" name="replyImage" class="replyImage" onchange="previewReplyImage(${board.boardNum})">
									  	</div>
							  		</div>
					  			</div>
					  		</form>
					  		</c:if>
                		</div>		
					</div>
		    		</c:forEach>
		    	</div>
			    <!-- end 메모 작성글 들 -->
			     
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
				<article class="comment-content memo-search">
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
	 			if(Number(xhr.response) == 1) {
	 				searchBoardList(1);
	 			} else {
	 				alert('저장에 실패했습니다.');
	 			}
			}
		}
		
		xhr.send(JSON.stringify(data));
	}
	
	// 댓글 작성
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
	 			if(Number(xhr.response) == 1) {
	 				searchBoardList(0);
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
		var form = document.boardListForm;
		
		clearDate();
		form.action = '${contextPath}/user/board/modifyForm';
		form.boardNum.value = boardNum;
		form.submit();
	}
	
	// 게시글 삭제
	function deleteBoard(boardNum) {
		if(confirm('게시글을 삭제하시겠습니까?')) {
			var xhr = new XMLHttpRequest();
			var data = {'boardNum' : boardNum};
			
			xhr.open('post', '${contextPath}/user/board/deleteBoard', false);
			xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
			xhr.setRequestHeader('Content-Type', 'application/json');
			
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200) {
		 			if(Number(xhr.response) == 1) {
		 				searchBoardList(0);
		 			} else {
		 				alert('삭제에 실패했습니다.');
		 			}
				}
			}
			
			xhr.send(JSON.stringify(data));
		}
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
	
	// 댓글 수정
	function modifyReply(replyNum) {
		var form = document.getElementById('replyModifyForm_' + replyNum);
		var xhr = new XMLHttpRequest();
		var replyContent = form.replyContent;
		
		if(replyContent.value == '') {
			alert('내용을 입력해주세요.');
			replyContent.focus();
			return;
		}
		
		xhr.open('post', '${contextPath}/user/reply/modifyReply', false);
		xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
	 			if(Number(xhr.response) == 1) {
	 				searchBoardList(0);
	 			} else {
	 				alert('저장에 실패했습니다.');
	 			}
			}
		}
		
		xhr.send(new FormData(form));
	}
	
	// 댓글 삭제
	function deleteReply(replyNum) {
		if(confirm('댓글을 삭제하시겠습니까?')) {
			var form = document.getElementById('replyModifyForm_' + replyNum);
			var xhr = new XMLHttpRequest();
			var data = getData(form);
			
			xhr.open('post', '${contextPath}/user/reply/deleteReply', false);
			xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
			xhr.setRequestHeader('Content-Type', 'application/json');
			
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200) {
		 			if(Number(xhr.response) == 1) {
		 				searchBoardList(0);
		 			} else {
		 				alert('삭제에 실패했습니다.');
		 			}
				}
			}
			
			xhr.send(JSON.stringify(data));
		}
	}
</script>      