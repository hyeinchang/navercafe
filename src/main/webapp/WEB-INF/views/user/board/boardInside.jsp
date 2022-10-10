<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<style type="text/css">
	.test{
		display: block;
		width:90%;
		margin: 0; auto;
	}
	
	.name-topList{
	  width        : 200px;     /* 너비는 변경될수 있습니다. */
	  text-overflow: ellipsis;  /* 위에 설정한 100px 보다 길면 말줄임표처럼 표시합니다. */
	  white-space  : nowrap;    /* 줄바꿈을 하지 않습니다. */
	  overflow     : hidden;    /* 내용이 길면 감춤니다 */
	  display      : block;     /* ie6이상 현재요소를 블럭처리합니다. */
	  color :black;
	  font-size: 20pt;
	  text-align: center;
	}
	.name-prefixList{
	  width : 70%;
	  text-overflow: ellipsis;
	  white-space : nowrap;
	  overflow : hidden;  
	  display : block;   
	  color :black;
	  font-size: 20pt;
	  text-align: center;
	}
	
#bbpress-forums ul li{list-style: none;}

/* ////////////////////////////////페이징 ///////////////////////////////////// */
.page{display:flex;}
.page-one{width:55%; text-align:right;}
.page-two{width:45%; text-align:right;}
.before-next-nav{text-align:right; width:50%;}
.modify_delete{
	text-align:left;width:50%;
}

/* /////////////////////////////////////////    게시판    //////////////////////////////////////// */

li.bbp-forum-info-test,
li.bbp-topic-title-test {
	float: left;
	text-align: center;
	width: 40%;
}

li.bbp-forum-info-allBoard,
li.bbp-topic-title-allBoard{
	/* float: left; */
	text-align: left;
	width: 50%;
	font-size: 10pt;
}

li.bbp-forum-topic-count-test{
	float: left;
	text-align: center;
	width: 20%;
}

.board-title{width:70%;float: left;text-align: left;}
.board-nickname{width:15%;float: left;text-align: left;}
.board-date{width:15%;float: left;text-align: left;}

li.bbp-topic-voice-count-test,
li.bbp-forum-reply-count-test,
li.bbp-topic-reply-count-test,
li.bbp-forum-likeCount-test,
li.bbp-forum-num-test{
	float: left;
	text-align: center;
	width: 10%;
}

li.bbp-forum-freshness-test,
li.bbp-topic-freshness-test{
	text-align: center;
	float: left;
	width: 10%;
}
/* bbpress 부분 */
#bbpress-forums li.bbp-header-header{background-color:#141618!important;color:#fff!important;padding:20px!important;}

#bbpress-forums li.bbp-header-content{background-color:white!important;color:black!important;padding:12px!important;
					border-top: 1px solid #ddd;border-bottom: 1px solid #ddd;}
#bbpress-forums li.bbp-header-grade-list{background-color:white!important;color:black!important;padding:20px!important;
					border-top: 1px solid #ddd;border-bottom: 1px solid #ddd;}
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
	padding:20px;
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
.board-board{ padding:10px;}

#del_next{
	display: flex;
}

h5.title_sub{margin: 0; border-bottom: 1px solid #ddd;padding:20px 0;}
h5.title_sub label:not(:last-child) {margin-right: 10px;}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	/* function readURL(input){
		var file = input.files[0]//파일에 대한 정보
		if(file != ''){
			var reader = new FileReader();
			reader.readAsDataURL(file);//읽고
			reader.onload = function (e){//로드한 값을 표현한다
				$('#preview').attr('src',e.target.result);
			}
		}
	} */

	 function replyClick(obj){
		document.getElementById(-obj.id).style="display:block";
		/* document.getElementById(-obj.id).innerHTML = 
		+"<form action='saveReply' class='row' method='post' enctype='multipart/form-data'>"
		+"<input type='hidden' name='userId' value='${sessionUser.userId}'>"
  		+"<input type='hidden' name='boardNum' value='${userBoard.boardNum}'>"
		+"<div class='col-lg-12 col-md-12 col-sm-12 col-xs-12'>"
	    +"<span style='font-weight: bold;'>${sessionUser.cafeUserNickname}</span>"
	    +"<textarea class='form-control' name='replyContent' id='comments' rows='6' placeholder='댓글을 남겨보세요'></textarea>"
		+"<div class='post-meta-test'>"
		+"<div class='reply-one'>"
		+"<input type='file' name='replyImgName'>"
		+"</div>"
		+"<div class='reply-two'>"
		+"<input type='submit' value='등록' id='submit' class='button small'>"
		+"</div>"
		+"</div>"
	    +"</div>"
	    +"</form>" */
	}
	
	function back(obj){
		document.getElementById(-obj.id).style="display:none";
	}
	
	
	function replyModifyClick(obj){
		console.log(document.getElementByClassName(-obj.value))
		document.getElementByClassName(-obj.value).style="display:block";
	}
	function replyModifyBack(){
		console.log(document.getElementByClassName(-obj.value))
		document.getElementByClassName(-obj.value).style="display:none";
	}
	
	
	
	function test(){
		const result=confirm('삭제하시겠습니까?');
		if (result) {
	    	console.log('삭제')
	    } else {
	    	console.log('대기')
		}
	}

	</script>
	<div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${_cafeDTO.cafeLayout eq 'left' ? '' : 'style="float:right;"'}>
       	<section class="section1">
		    <div class="container clearfix">
		      <div class="title">
		       	<h4>
		          <span>${_cafeDTO.menuDTO.boardMenuName}</span>
		        </h4>
		      </div>
		      <div class="col-lg-9 col-md-9 col-sm-9 clearfix">
		      	
		      	<header class="page-header blog-title">
		          	<!-- <a href="#"><h5 style="color:green;">${boardMenuType.boardMenuName} ></h5></a> -->
		          	
		            <h3 class="general-title">${userBoard.boardTitle}</h3>
		            
		            <div class="post-meta-test">
		              
		              	<div class="div-one">
		              		<a href="#">
		              		<c:choose>
			              	<c:when test="${replyreply.CAFE_USER_IMAGE_NUM eq null || replyreply.CAFE_USER_IMAGE_NUM == 0}">
		              			<img src="${contextPath}/resources/img/프로필.jpg"
		              			width="40px" class="profileImg" alt="">
		              		</c:when>
							<c:otherwise>
								<img src="${contextPath}/file/download?file/cafeUserImageNum=${replyreply.CAFE_USER_IMAGE_NUM}" 
								width="40px" class="profileImg" alt="">
							</c:otherwise>
							</c:choose>
			              	</a>
		                </div>
		                
						<div class="div-two">
							${cafeUserInfo.cafeUserNickname }<br>
			                ${userBoard.boardSaveDate} 조회 ${userBoard.hit }
						</div>
						<div class="div-three">
			                	<a href="#">
			                	<img src="${contextPath}/resources/img/댓글아이콘.png" width="25px" alt="">
			                		댓글 ${replyCount}
			                	</a>
			            </div>
		            </div>
		        </header>
		        
		        <div class="board-post-desc">
		          	${userBoard.boardContent}
			   	</div>
		      	
		      
		        	
	          	<h5 class="title_sub">
	          		<label>
		          	<c:if test="${like=='F'}">
		          		<a href="likeChk?boardNum=${userBoard.boardNum}&userId=${sessionUser.userId}&cafeId=${boardMenuType.cafeId}&boardMenuNum=${boardMenuType.boardMenuNum}">
		       		 		<img src="${contextPath}/resources/img/빨간하트.jpg" width="25px" alt="">
		       		 	</a> 
		        	</c:if>
		        	<c:if test="${like=='T'}">
		        		<a href="likeChk?boardNum=${userBoard.boardNum}&userId=${sessionUser.userId}&cafeId=${boardMenuType.cafeId}&boardMenuNum=${boardMenuType.boardMenuNum}">
		       		 		<img src="${contextPath}/resources/img/빈하트.jpg" width="25px" alt="">
		       		 	</a> 
		        	</c:if>
		         		좋아요 ${userBoard.boardLikes}  
	         		</label>
	         		<label>
		          		<img src="${contextPath}/resources/img/댓글아이콘.png" width="25px" alt=""> 
		          		댓글 ${replyCount}
	          		</label>
	          	</h5>
		     	
		     	<ul class="comment-list">
		          
	          	<c:forEach var="reply" items="${replyList}">
	          		<c:if test="${reply.REPLY_STEP == 0}"><!--댓글 이라면-->
		            <li>
		              <!-- 수정 클릭시 생성되는 div  --><!-- 얘도 article로? -->
                      	<div class="${-reply.REPLY_NUM}" style="display:none;">
                      		<form id="comments_form" action="saveReply?groupNum=${reply.REPLY_NUM}" class="row" 
								method="post" enctype="multipart/form-data">
						  		<input type="hidden" name="userId" value="${_cafeDTO.loginUser.userId}">
						  		<input type="hidden" name="boardNum" value="${userBoard.boardNum}">
							    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							    										
							      <p><span style="font-weight:1000; font-size: 20pt;">${sessionUser.cafeUserNickname}</span></p>
							      <textarea class="form-control" name="replyContent" id="comments" rows="6">
							      	${reply.REPLY_CONTENT}
			                   		<c:if test="${reply.CAFE_USER_IMAGE_NUM != 0}">
			                   			<img src="download?fileNum=${reply.CAFE_USER_IMAGE_NUM}" 
										width="30%">
	                   				</c:if>
							      </textarea>
							      
								  <div class="post-meta-test">
								  	<div class="reply-one">
										<input type="file" name="replyImgName">
										<!--사진 아이콘을 누르면 input type file을 누른 효과를 준다?  -->
										<!-- <img id="preview" src="#" width=100 height=100 alt="선택된 이미지가 없습니다"> -->
								  		<!-- 여기가 범인 두번 실행됨  -->
								  	</div>
								  	<div class="reply-two"> 
								  		<input type="button" value="취소" onclick="back(this)" class="${reply.REPLY_NUM}" class="button small">
								  		<input type="submit" value="등록" id="submit" class="button small">
								  	</div>
								  </div>
							      <hr>
							    </div>
							  </form>
                      	</div>
		               
		                <div class="comment-content">
		                <a href="#">
			              	<c:choose>
			              	<c:when test="${replyreply.CAFE_USER_IMAGE_NUM eq null || replyreply.CAFE_USER_IMAGE_NUM == 0}">
		              			<img src="${contextPath}/resources/img/프로필.jpg"
		              			width="40px" class="profileImg" alt="">
		              		</c:when>
							<c:otherwise>
								<img src="${contextPath}/file/download?file/cafeUserImageNum=${replyreply.CAFE_USER_IMAGE_NUM}" 
								width="40px" class="profileImg" alt="">
							</c:otherwise>
							</c:choose>
				          </a>
		                  <strong class="comment-author">
	                        ${reply.CAFE_USER_NICKNAME} <small class="comment-meta">${reply.REPLY_SAVEDATE}</small>
	                        <!-- loginId == 관리자 계정 ||  -->
	                        <c:choose>		
								<c:when test="${loginId == reply.USER_ID}">
									<a href="deleteBoardReply?replyNum=${reply.REPLY_NUM}">
										삭제 
									</a>
									<%-- <h5>들어온 쒜끼${sessionUser.userId} 게시물 주인쒜끼${reply.USER_ID}</h5> --%>
								</c:when>
								<c:when test="${sessionUser.userId == reply.USER_ID}">		
									<a>수정</a>
									<%-- onclick="replyModifyClick(this)" class="${reply.REPLY_NUM}" style="cursor:pointer" --%>
									<%-- <h5>들어온 쒜끼${sessionUser.userId} 게시물 주인쒜끼${reply.USER_ID}</h5> --%>
								</c:when>
							</c:choose>
	                        <%-- <a href="modifyBoardReply?replyNum=${reply.REPLY_NUM}">
										수정
									</a> --%>
	                       
	                  	  </strong>
	                   		${reply.REPLY_CONTENT}<br>
	                   		<c:if test="${reply.CAFE_USER_IMAGE_NUM != 0}">
	                   			<img src="download?fileNum=${reply.CAFE_USER_IMAGE_NUM}" 
								width="30%">
	                   		</c:if>
	                   		
	                   		
	                      	<p>
	                      		<a onclick="replyClick(this)" id="${reply.REPLY_NUM}" style="cursor:pointer">
	                      		<b>답글 쓰기</b> <!--그룹:${reply.REPLY_GROUP}  --></a>
	                      	</p>

	                      	
	                      			<!-- 답글 쓰기 클릭시 생성되는 div  -->
	                      	<div id="${-reply.REPLY_NUM}" style="display:none;">
	                      		<form id="comments_form" action="saveReply?groupNum=${reply.REPLY_GROUP}&step=1" class="row" 
								  		method="post" enctype="multipart/form-data">
								  		<input type="hidden" name="userId" value="${sessionUser.userId}">
								  		<input type="hidden" name="boardNum" value="${userBoard.boardNum}">
								  		<input type="hidden" name="boardMenuNum" value="${userBoard.boardMenuNum}">
										<input type="hidden" name="cafeId" value="${boardMenuType.cafeId}">
								    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								    										
								      <p><span style="font-weight:1000; font-size: 20pt;">${sessionUser.cafeUserNickname}</span></p>
								      <textarea class="form-control" name="replyContent" id="comments" 
								      rows="6" placeholder="답글을 남겨보세요"></textarea>
								      
									  <div class="post-meta-test">
									  	<div class="reply-one">
											<input type="file" name="replyImgName">
											<!--사진 아이콘을 누르면 input type file을 누른 효과를 준다?  -->
											<!-- <img id="preview" src="#" width=100 height=100 alt="선택된 이미지가 없습니다"> -->
									  		<!-- 여기가 범인 두번 실행됨  -->
									  	</div>
									  	<div class="reply-two"> 
									  		<input type="button" value="취소" onclick="back(this)" id="${reply.REPLY_NUM}" class="button small">
									  		<input type="submit" value="등록" id="submit" class="button small">
									  	</div>
									  </div>
								      
								      <hr>
								    </div>
								  </form>
	                      	</div>
	                      	
	                      	<!--  		답글view		 -->
	                      	<c:forEach var="replyreply" items="${replyList}">
	                      		<c:if test="${reply.REPLY_NUM == replyreply.REPLY_GROUP && replyreply.REPLY_STEP == 1}">
	                      			
	                      			<li>
					              <article class="comment" style="color:black;">
					              	<a href="#">
						              		<c:if test="${replyreply.CAFE_USER_IMAGE_NUM == 0}">
						              			<img src="${contextPath}/resources/img/프로필.jpg"
						              			width="40px" class="profileImg" alt="">
						              		</c:if>
											<c:if test="${replyreply.CAFE_USER_IMAGE_NUM  != 0 }">
												<img src="${contextPath}/file/download?file/cafeUserImageNum=${replyreply.CAFE_USER_IMAGE_NUM}" 
												width="40px" class="profileImg" alt="">
											</c:if>
						              	</a>
					               
					               	<!-- style="border:solid 1px gray; "-->
					                <div class="comment-content">
					                  <h4 class="comment-author">
				                        ${replyreply.CAFE_USER_NICKNAME} <small class="comment-meta">${replyreply.REPLY_SAVEDATE}</small>
				                       <!-- loginId == 관리자 계정 ||  -->
				                       	<c:choose>			
											<c:when test="${loginId == replyreply.USER_ID}">
												<a href="deleteBoardReply?replyNum=${replyreply.REPLY_NUM}">
													삭제 
												</a>
												<%-- <h5>들어온 쒜끼${loginId} 게시물 주인쒜끼${replyreply.USER_ID}</h5> --%>
											</c:when>
											<c:when test="${loginId == replyreply.USER_ID}">
												<a href="modifyBoardReply?replyNum=${replyreply.REPLY_NUM}">
													수정
												</a>
												<%-- <h5>들어온 쒜끼${loginId} 게시물 주인쒜끼${replyreply.USER_ID}</h5> --%>
											</c:when>
										</c:choose>
				                       
				                       
				                       
				                       
				                  	  </h4>
				                   		${replyreply.REPLY_CONTENT}<br>
				                   		<c:forEach var="file" items="${fileList}">
				                   			<c:if test="${file.replyNum == replyreply.REPLY_NUM}">
				                   				<img src="download?fileNum=${replyreply.REPLY_NUM}" 
												width="30%">
				                   			</c:if>
				                   		</c:forEach>

				                   		
				                      	<p>
				                      		<a onclick="replyClick(this)" id="${replyreply.REPLY_NUM}" style="cursor:pointer">
				                      		<b>답글 쓰기</b> 그룹:${replyreply.REPLY_GROUP}</a>
				                      	</p>
				                      	
				                      			<!-- 답글 쓰기 클릭시 생성되는 div  -->
				                      	<div id="${-replyreply.REPLY_NUM}" style="display:none;">
				                      		<form id="comments_form" action="saveReply?groupNum=${replyreply.REPLY_GROUP}&step=1" class="row" 
											  		method="post" enctype="multipart/form-data">
											  		<input type="hidden" name="userId" value="${sessionUser.userId}">
											  		<input type="hidden" name="boardNum" value="${userBoard.boardNum}">
											  		<input type="hidden" name="boardMenuNum" value="${userBoard.boardMenuNum}">
											  		<input type="hidden" name="cafeId" value="${boardMenuType.cafeId}">
											    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
											    										
											      <p><span style="font-weight:1000; font-size: 20pt;">${sessionUser.cafeUserNickname}</span></p>
											      <textarea class="form-control" name="replyContent" id="comments" 
											      rows="6" placeholder="답글을 남겨보세요"></textarea>
											      
												  <div class="post-meta-test">
												  	<div class="reply-one">
														<input type="file" name="replyImgName">
												  	</div>
												  	<div class="reply-two"> 
												  		<input type="button" value="취소" onclick="back(this)" id="${replyreply.REPLY_NUM}" class="button small">
												  		<input type="submit" value="등록" id="submit" class="button small">
												  	</div>
												  </div>
											      
											      <hr>
											    </div>
											  </form>
				                      	</div>
				                      	</div>
				                      	</article>
	                   			   	</li>

	                      			
	                      		</c:if>
	                      	</c:forEach>

		                </div>

		              </article>
		              <!-- End .comment -->
		            </li>
		            </c:if>
	            </c:forEach>
	          </ul>
	          <!-- End .comment-list -->
	          <!--reply num 값을 가져와서 아이디 부여하고 클릭시 reply num 에 맞게 답글창 생성  -->
		      	
	
		          
		      </div>
		      <!-- end content -->
		    </div>
		    <!-- end container -->
		  </section>
      </div>
      <!-- end content -->
<form name="boardListForm">
	<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
	<input type="hidden" name="boardMenuNum" value="${_cafeDTO.menuDTO.boardMenuNum}">
</form>      
<script type="text/javascript">
	function goWriteForm() {
		var form = document.boardListForm;
		
		form.action = '${contextPath}/user/board/writeForm';
		form.submit();
	}
</script>