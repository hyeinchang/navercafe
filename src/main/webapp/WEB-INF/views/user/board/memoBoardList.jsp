<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<style>
/*//////////////////////////////////   메모 게시판   ////////////////////////////////  */
.memo-board{padding-top:10px;}
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

.post-meta-test{display: flex;padding-bottom: 10px;}
.div-one{width:10%;}
.div-two{width:40%;}
.div-three{width:50%; text-align:right;padding-top:10px;}
.memo-div-two{width:40%;padding-top:10px;}
/* 댓글 쪽 */
.reply-one{width:50%}
.reply-two{width:50%; text-align: right;}
.board-post-desc{
	padding-left:10%; width:90%;
}
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
.board-board{border:1px solid silver; padding:10px;}

</style>

<script>
function replyClick(obj){
	document.getElementById(-obj.id).style="display:block; padding-left: 30px;";
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
		            <form name="comments_form" id="comments_form" action="memoSave" class="row" method="post">
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
		        <c:forEach var="memoList" items="${boardList}">
		         	<div class="board-board">
			          <header class="page-header blog-title">
			            <div class="post-meta-test">
			              	<div class="div-one">
				              	<a href="#">
				              		<c:if test="${memoList.cafeUesrImageNum == 0 }">
				              			<img src="<%=request.getContextPath()%>/resources/img/프로필.jpg"
				              			width="40px;" class="img-circle alignleft">
				              		</c:if>
									<c:if test="${memoList.cafeUesrImageNum != 0 }">
										<img src="download?fileNum=${memoList.cafeUesrImageNum}" 
										width="40px;" class="img-circle alignleft">
									</c:if>
				              	</a>
			                </div>
							<div class="memo-div-two">
								<a href="#">${memoList.cafeUserNickname}</a>
								수정 | 삭제
							</div>
							<div class="div-three">
				                	${memoList.boardSaveDate}
				            </div>
			            </div>
			          </header>
			          <div class="board-post-desc">
			          	<p>
			         		${memoList.boardContent}
						</p>
						${memoList.boardNum}<br>
						<a onclick="replyClick(this)" id="${memoList.boardNum}" style="cursor:pointer">
						∧ 댓글  ${0 }
						</a><!--memoNum의 아이디 그룹을 갖고있는 수만큼 표시  -->
			          </div>
			          
			          <!-- 댓글 클릭시 생성되는 div  -->
			       	 	
			          <div id="${-memoList.boardNum}" style="display:none;" >
			          		<hr><!--  	근데 메모는 답글들 먼저 보여주고. 답글view		 -->
		                      	<c:forEach var="memoReply" items="${memoReplyList}">
		                      		<c:if test="${memoList.boardNum == memoReply.MEMO_REPLY_GROUP}">
		                      			<li>
						              <article class="comment" style="color:black;">
						              	<a href="#">
							              		<c:if test="${ memoReply.CAFE_USER_IMAGE_NUM== 0}">
							              			<img src="<%=request.getContextPath()%>/resources/img/프로필.jpg"
							              			width="40px" class="img-circle alignleft" alt="">
							              		</c:if>
												<c:if test="${ memoReply.CAFE_USER_IMAGE_NUM  != 0 }">
													<img src="download?fileNum=${memoReply.CAFE_USER_IMAGE_NUM}" 
													width="40px" class="img-circle alignleft" alt="">
												</c:if>
							              	</a>
						               
							               	<!-- style="border:solid 1px gray; "-->
							                <div class="comment-content">
							                  <h4 class="comment-author">
						                        ${memoReply.CAFE_USER_NICKNAME} <small class="comment-meta">${memoReply.REPLY_SAVEDATE}</small>
						                  	  </h4>
						                   		${memoReply.MEMO_REPLY_CONTENT}<br>
						                   		<!-- 내용에 이미지가 있다면 보여주고 -->
						                   		
						                   		<c:forEach var="file" items="${fileList}">
						                   			<c:if test="${file.memoReplyNum == replyreply.MEMO_REPLY_NUM}">
						                   				<img src="download?fileNum=${replyreply.MEMO_REPLY_NUM}" 
														width="30%">
						                   			</c:if>
						                   		</c:forEach>	                   		
						                   		
						                      </div>
					                      </article>
		                   			   	</li>
		                      		</c:if>
		                      	</c:forEach>
			          
			          
			          
                     		<form id="comments_form" action="saveMemoReply?groupNum=${memoList.boardNum}" class="row" 
						  		method="post" enctype="multipart/form-data">
						  		<input type="hidden" name="userId" value="${sessionUser.userId}">
						  		<input type="hidden" name="cafeId" value="${cafeId}">
						    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
						    										
						      <p><span style="font-weight:1000; font-size: 20pt;">${sessionUser.cafeUserNickname}</span></p>
						      <textarea class="form-control" name="memoReplyContent" id="comments" 
						      rows="6" placeholder="답글을 남겨보세요"></textarea>
						      
							  <div class="post-meta-test">
							  	<div class="reply-one">
									<input type="file" name="replyImgName">
									<!--사진 아이콘을 누르면 input type file을 누른 효과를 준다?  -->
									<!-- <img id="preview" src="#" width=100 height=100 alt="선택된 이미지가 없습니다"> -->
							  		<!-- 여기가 범인 두번 실행됨  -->
							  	</div>
							  	<div class="reply-two"> 
							  		<input type="button" value="취소" onclick="back(this)" id="${memoList.boardNum}" class="button small">
							  		<input type="submit" value="등록" id="submit" class="button small">
							  	</div>
							  </div>
						      
						      <hr>
						    </div>
						  </form>
						  
                      	</div>		
	          
				</div>
		     </c:forEach>
		     <!-- end 메모 작성글 들 -->
		     
		     	<!--	페이징  -->
				  <div class="paging" align="center">
					  <ul class="pagination">
					    <li><a href="#">1</a></li>
					    <li><a href="#">2</a></li>
					    <li><a href="#">3</a></li>
					  </ul>
				  </div>
				
		      </div>
		      <!-- end content -->
		    </div>
		    <!-- end container -->
		  </section>
      </div>
      <!-- end content -->

<script type="text/javascript">
	function writeBoard() {
		var form = document.comments_form;
		var xhr = new XMLHttpRequest();
		var cafeId = form.cafeId.value;
		var userId = form.userId.value;
		var data = new Object();
		
		data = getData();
		xhr.open('post', '${contextPath}/user/board/writeBoard', false);
		xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
		xhr.setRequestHeader('Content-Type', 'application/json');
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
	 			var message = '';
	 			
	 			if(Number(xhr.response) == 1) {
	 				location.href = '${contextPath}/user/board/goBoardList?cafeId=' + cafeId + '&boardMenuNum=' + data.boardMenuNum;
	 			} else {
	 				alert('저장에 실패했습니다.');
	 			}
			}
		}
		
		xhr.send(JSON.stringify(data));
	}
	
	function getData() {
		var form = document.comments_form;
		var data = new Object();
		
		for(var i=0;i<form.length;i++) {
			var element = form[i];
			
			if(element.name && element.value) {
				data[element.name] = element.value;
			}
		}
		
		return data;
	}
</script>      