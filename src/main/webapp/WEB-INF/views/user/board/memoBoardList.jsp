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
.post-meta-area > div:last-child {float:right;}
.post-meta-area .memo-action a {color:#696E74;}
.post-meta-area .memo-action a:hover {text-decoration:underline;}
.post-meta-area .memo-date {color: #aaa;}
.memo-board{padding:10px 0;}
.memo-list-area .memo-board:not(:last-child) {border-bottom: 1px solid #ccc;}
.board-post-desc .memo-content {padding: 20px 0 40px;}

/* 댓글 쪽 */
.reply-list-area li {list-style:none;}
.reply-list-area .comment-content > span {margin-right: 5px;}
.reply-list-area .comment-content .reply-action {float:right;}
.reply-list-area .comment-content .reply-action > a {color: #000;}
.reply-list-area .comment-content .reply-action > a:hover {text-decoration:underline;}
.reply-list-area .reply-content {margin-top:10px;}
.replyA:hover {text-decoration: underline;}
.reply-file-attach{width:50%; padding-left: 10px;}
.reply-file-attach .imageAttach{width:30px; cursor:pointer;}
.reply-file-attach .replyImage {width:0;height:0;}
.reply-btns{text-align: right;}
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
	var replyArea = document.getElementById('reply_' + boardNum);
	
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
		                <textarea class="form-control" name="boardContent" id="comments" rows="6" placeholder="글을 입력해 주세요."></textarea>
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
			          <div id="reply_${board.boardNum}" class="reply-list-area" style="display:none;">
			          	<!--  	근데 메모는 답글들 먼저 보여주고. 답글view		 -->
			          	<ul>
			          	<c:forEach var="reply" items="${board.replyList}">
                      		<li>
				            	<article class="comment-content" style="color:black;">
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
									</span>
									<span>
										<small class="comment-meta">${reply.replySaveDate}</small>
									</span>
									<span class="reply-action">
										<a href="#">수정</a> | <a href="#">삭제</a>
									</span>
				                  	<div class="reply-content">
			                   		${reply.replyContent}
			                   		</div>
		                   			<!-- 내용에 이미지가 있다면 보여주고 -->
		                   		
		                   		<c:forEach var="file" items="${fileList}">
		                   			<c:if test="${file.memoReplyNum == reply.replyNum}">
		                   				<img src="download?fileNum=${reply.replyNum}" 
										width="30%">
		                   			</c:if>
		                   		</c:forEach>	                   		
				                   		
			                      </article>
                   			   </li>
	                      	</c:forEach>
			          	</ul>
	                      	
                    	<form name="replyForm" id="replyForm_${board.boardNum}" class="row" method="post" enctype="multipart/form-data">
					  		<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
					  		<input type="hidden" name="userId" value="${_cafeDTO.loginUser.userId}">
					  		<input type="hidden" name="boardMenuNum" value="${_cafeDTO.menuDTO.boardMenuNum}">
					  		<input type="hidden" name="boardNum" value="${board.boardNum}">
					  		<input type="hidden" name="replyGroup" value="${board.boardNum}">
					  		<input type="hidden" name="replyStep" value="0">
					  		
					    	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					    	
						      	<textarea class="form-control" name="replyContent"
						      		rows="6" placeholder="답글을 남겨보세요"></textarea>
								<div class="post-meta-area">
								  	<div class=reply-file-attach>
								  		<img src="${contextPath}/resources/img/camera-icon.png" title="답글 이미지 첨부" alt="답글 이미지 첨부"
								  			class="imageAttach" onclick="this.nextElementSibling.click()">
								  		<input type="file" name="replyImage" class="replyImage" onchange="">
								  	</div>
								  	<div class="reply-btns"> 
								  		<button type="button" onclick="back(this)" id="${memoList.boardNum}" class="button">취소</button>
								  		<button type="button" class="button" onclick="writeReply(${board.boardNum})">등록</button>
								  	</div>
							  	</div>
							  	
					  		</div>
					  </form>
						  
                	</div>		
	          
				</div>
		     </c:forEach>
		     </div>
		     <!-- end 메모 작성글 들 -->
		     
		     	<!--	페이징  -->
				  <div class="paging" align="center">
					  <ul class="pagination">
					  <c:if test="${menuDTO.prevActive}">
				      	<li><a href="javascript:searchBoardList(${menuDTO.startPage-1})">«</a></li>
				      </c:if>
			          <c:forEach var="page" begin="${menuDTO.startPage}" end="${menuDTO.endPage}">
			            <li${menuDTO.page eq page ? ' class="active"' : ''}><a href="javascript:searchBoardList(${page})">${page}</a></li>
			          </c:forEach>
			          <c:if test="${menuDTO.nextActive}">
			          	<li><a href="javascript:searchBoardList(${menuDTO.endPage+1})">»</a></li>
			          </c:if>
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
	 				var cafeId = form.cafeId.value;
	 				var boardMenuNum = form.boardMenuNum.value;
	 				
	 				location.href = '${contextPath}/user/board/goBoardList?cafeId=' + cafeId + '&boardMenuNum=' + boardMenuNum;
	 			} else {
	 				alert('저장에 실패했습니다.');
	 			}
			}
		}
		
		xhr.send(JSON.stringify(data));
	}
	
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
	 				var cafeId = form.cafeId.value;
	 				var boardMenuNum = form.boardMenuNum.value;
	 				
	 				location.href = '${contextPath}/user/board/goBoardList?cafeId=' + cafeId + '&boardMenuNum=' + boardMenuNum;
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
	
	function searchBoardList(page) {
		var form = boardListForm;
		
		form.page.value = page;
		form.submit();
	}
</script>      