<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<style>
/*//////////////////////////////////   메모 게시판   ////////////////////////////////  */
.memo-wrap{padding:10px;}


#bbpress-forums li.bbp-header-header{background-color:#141618!important;color:#fff!important;padding:20px!important;}

#bbpress-forums li.bbp-header-content{background-color:white!important;color:black!important;padding:12px!important;
					border-top: 1px solid #E0E0E0;border-bottom: 1px solid #E0E0E0;}
#bbpress-forums li.bbp-header-grade-list{background-color:white!important;color:black!important;padding:20px!important;
					border-top: 1px solid #E0E0E0;border-bottom: 1px solid #E0E0E0;}
#bbpress-forums ul li ul.forum-titles-test{ padding-bottom: 10px;}
/*///////////////////////////   컬럼명 부분   //////////////////  */
#bbpress-forums-test{
	background: transparent;
	clear: both;
	margin-bottom: 0px;
	overflow: hidden;
	font-size: 12px;
}
/* //////////////////////////////////영역 설정 부분/////////////////////////////////////// */

.board-img{width:90%;}

.more-more{display:flex;}
.more-one{width:15%;}
.more-two{width:85%; padding-top:10px; font-size: 15pt;}

.memo-list-area {border: 1px solid #eee;padding:10px 20px;}
.post-meta-area {padding-bottom: 10px;}
.post-meta-area > div {display:inline-block; vertical-align:middle;}
.post-meta-area > div {margin-right: 5px;}
.post-meta-area .memo-date {float:right;}
.post-meta-area .memo-action a {color:#696E74;}
.post-meta-area .memo-action a:hover {text-decoration:underline;}
.post-meta-area .memo-date {color: #aaa;}
.memo-board{padding:10px 0;}
.memo-board-content {resize:none;}
.memo-list-area .memo-board:not(:last-child) {border-bottom: 1px solid #ccc;}
.board-post-desc .memo-content {padding: 20px 0 40px;}

/* 댓글 쪽 */
.reply-list-area li {list-style:none;}
.reply-list-area li:not(:last-child){padding-bottom: 25px;margin-bottom: 25px;border-bottom: 1px dotted #aaa;}
.reply-list-area .comment-content {margin-bottom:0;}
.reply-list-area .comment-content li > span {margin-right: 5px;}
.reply-list-area .comment-content .reply-action {float:right;}
.reply-list-area .comment-content .reply-action > a {color: #000;}
.reply-list-area .comment-content .reply-action > a:hover {text-decoration:underline;}
.reply-list-area .comment-content .reply-input-area .reply-input{width:100%;}
.reply-list-area .comment-content .reply-file-btns{float:right;}
.reply-list-area .reply-content {margin-top:10px;}
.reply-list-area .writer{color: #2f8cff; border: 1px solid; border-radius: 15px; padding: 2px 4px;font-size: 12px; margin-left: 2px; background: #fff;}
.reply-list-area .reReply {cursor:pointer;}
.reply-list-area .reReply:hover {text-decoration:underline;}
.replyA:hover {text-decoration: underline;}
.reply-file-attach{width:50%; padding-left: 10px;}
.reply-file-attach .imageAttach{width:30px; cursor:pointer;}
.reply-file-attach .replyImage {width:0;height:0;}
.reply-input-area {margin-top:20px;}
.reply-input-area .reply-input {border:1px solid #ccc; border-radius: 5px; display:inline-block; width:87.8%;padding: 10px;overflow:hidden;background: #fff;}
.reply-input-area .reply-input textarea{width:100%;resize:none;border:none;outline: none;}
.reply-input-area .previewReplyArea a {color:#000;}
.reply-input-area .previewReplyArea a:hover{text-decoration: underline;}

.reply-input-area button {width: 80px; vertical-align: top;height: 80px; border-radius: 5px;}

.board-post-desc{}
.board-post-desc img{
	width:100%;
}
/* ///////////////// 게시물쪽 //////////////// */
.blog-wrap-test{
  background: #ffffff;
  padding: 0;
  position: relative;
  display: block;
  z-index: 1;
}

</style>

<script>
function replyClick(boardNum){
	var replyArea = document.getElementById('replyArea_' + boardNum);
	
	if(replyArea.style.display == 'none') {
		replyArea.style.display = 'block';
	} else {
		replyArea.style.display = 'none';
	}
}
function back(obj){
	document.getElementById(-obj.id).style="display:none";
}
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
								<a href="#">수정</a> | <a href="#">삭제</a>
							</div>
							<div class="memo-date"><fmt:formatDate value="${board.boardSaveDate}" pattern="YYYY-MM-dd hh:mm"/></div>
			            </div>
			          </header>
			          <div class="board-post-desc">
			          	<div class="memo-content">
			         		${board.boardContent}
						</div>
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
                      				<span>└</span>
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
											  		<input type="file" id="replyImage_${board.boardNum}_${reply.replyNum}" name="replyImage" class="replyImage" onchange="previewReplyImage('${board.boardNum}_${reply.replyNum}')">
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
	
	function searchBoardList(page) {
		var form = boardListForm;
		
		form.page.value = page;
		form.submit();
	}
</script>      