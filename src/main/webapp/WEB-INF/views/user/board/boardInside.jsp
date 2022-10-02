<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
.before-next-nav{text-align:right;}

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

</script>

<div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${_cafeDTO.cafeLayout eq 'left' ? '' : 'style="float:right;"'}>
  <section class="section1">
    <div class="container clearfix">
	      <div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix">
			
			<div class="before-next-nav">
				<c:choose>
					<c:when test="${Preview == false}">
						<button onclick="location.href='goBoardInside?boardNum=${userBoard.boardNum+1}'">∨다음글</button>
					</c:when>
					<c:when test="${Next == false}">
						<button onclick="location.href='goBoardInside?boardNum=${userBoard.boardNum-1}'">∧이전글</button>
					</c:when>
					<c:otherwise>
						<button onclick="location.href='goBoardInside?boardNum=${userBoard.boardNum-1}'">∧이전글</button>
						<button onclick="location.href='goBoardInside?boardNum=${userBoard.boardNum+1}'">∨다음글</button>
					</c:otherwise>
				</c:choose>
				
				<button onclick="location.href='goBoardList'">목록</button>
			</div>
			
			
		        <!-- SLIDE POST -->
		        <article class="blog-wrap-test">
		         
		         <div class="board-board">
				
			          <header class="page-header blog-title">
			          	<a href="#"><h5 style="color:green;">${boardMenuType.boardMenuName} ></h5></a>
			          	
			            <h3 class="general-title">${userBoard.boardTitle}</h3>
			            
			            <div class="post-meta-test">
			              
			              	<div class="div-one">
			              		<a href="#">
				              		<c:if test="${ cafeUserInfo.cafeUserImageNum == 0 }">
				              			<img src="<%=request.getContextPath()%>/resources/img/프로필.jpg"
				              			width="40px" class="img-circle alignleft" alt="">
				              		</c:if>
									<c:if test="${ cafeUserInfo.cafeUserImageNum  != 0 }">
										<img src="download?fileNum=${cafeUserInfo.cafeUserImageNum }" 
										width="40px" class="img-circle alignleft" alt="">
									</c:if>
				              	</a>
			                </div>
			                
							<div class="div-two">
								<a href="#">${cafeUserInfo.cafeUserNickname }</a><br>
				                ${userBoard.boardSaveDate} 조회 ${userBoard.hit }
							</div>
							<div class="div-three">
				                	<a href="#">
				                	<img src="<%=request.getContextPath() %>/resources/img/댓글아이콘.png" width="25px" alt="">
				                	댓글 ${replyCount}
				                	</a>
				            </div>
			            </div>
			            
			          </header>
		
			          <div class="board-post-desc">
			          	<p>
			          	${userBoard.boardContent}
			          	</p>
			           	 
			          </div>
		        
				<hr>
				
		        <div class="more-more">
		          <div class="more-one">
		          
		          	<a href="#">
	              		<c:if test="${ cafeUserInfo.cafeUserImageNum == 0 }">
	              			<img src="<%=request.getContextPath()%>/resources/img/프로필.jpg"
	              			width="50" class="img-circle alignleft" alt="">
	              		</c:if>
						<c:if test="${ cafeUserInfo.cafeUserImageNum != 0 }">
							<img src="download?fileNum=${cafeUserInfo.cafeUserImageNum}" 
							width="50" class="img-circle alignleft" alt="">
						</c:if>
	              	</a>

		          </div>
		          <div class="more-two">
		          	<a href="userViewList?userId=${cafeUserInfo.userId}">
		          	<b>${cafeUserInfo.cafeUserNickname}</b>님의 게시글 더보기</a>
		          </div>
		        </div>
		        
			
				
		        <div id="comments_wrapper">
		        	
		          <h4 class="title">
		          	<c:if test="${like=='F'}">
		        		<a href="likeChk?boardNum=${userBoard.boardNum}&userId=${sessionUser.userId}">
		       		 		<img src="<%=request.getContextPath()%>/resources/img/빨간하트.jpg" width="25px" alt="">
		       		 	</a> 
		        	</c:if>
		        	<c:if test="${like=='T'}">
		        		<a href="likeChk?boardNum=${userBoard.boardNum}&userId=${sessionUser.userId}">
		       		 		<img src="<%=request.getContextPath()%>/resources/img/빈하트.jpg" width="25px" alt="">
		       			 </a> 
		        	</c:if>
		         	좋아요 ${userBoard.boardLikes}  
		          	<img src="<%=request.getContextPath() %>/resources/img/댓글아이콘.png" width="25px" alt=""> 
		          	댓글 ${replyCount}</h4>
		          
		          
		          
		          
		          <!-- 					댓글 목록 				 -->
		          <ul class="comment-list">
		          
		          	<c:forEach var="reply" items="${replyList}">
		          		<c:if test="${reply.REPLY_STEP == 0}"><!--댓글 이라면-->
			            <li>
			              <article class="comment">
			              	<a href="#">
			              		<c:if test="${ reply.CAFE_USER_IMAGE_NUM== 0}">
			              			<img src="<%=request.getContextPath()%>/resources/img/프로필.jpg"
			              			width="40px" class="img-circle alignleft" alt="">
			              		</c:if>
								<c:if test="${ reply.CAFE_USER_IMAGE_NUM  != 0 }">
									<img src="download?fileNum=${reply.CAFE_USER_IMAGE_NUM}" 
									width="40px" class="img-circle alignleft" alt="">
								</c:if>
				             </a>
			               
			                	
			                <div class="comment-content">
			                  <h4 class="comment-author">
		                        ${reply.CAFE_USER_NICKNAME} <small class="comment-meta">${reply.REPLY_SAVEDATE}</small>
		                       
		                  	  </h4>
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
							              		<c:if test="${ replyreply.CAFE_USER_IMAGE_NUM== 0}">
							              			<img src="<%=request.getContextPath()%>/resources/img/프로필.jpg"
							              			width="40px" class="img-circle alignleft" alt="">
							              		</c:if>
												<c:if test="${ replyreply.CAFE_USER_IMAGE_NUM  != 0 }">
													<img src="download?fileNum=${replyreply.CAFE_USER_IMAGE_NUM}" 
													width="40px" class="img-circle alignleft" alt="">
												</c:if>
							              	</a>
						               
						               	<!-- style="border:solid 1px gray; "-->
						                <div class="comment-content">
						                  <h4 class="comment-author">
					                        ${replyreply.CAFE_USER_NICKNAME} <small class="comment-meta">${replyreply.REPLY_SAVEDATE}</small>
					                       
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
		          

				
					<!--			댓글작성	댓글작성	댓글작성					  -->
					<div class="clearfix"></div>
					
					
					<div class="comments_form">
					  <h4 class="title">댓글</h4>
					  
					  <form id="comments_form" action="saveReply" class="row" 
					  		method="post" enctype="multipart/form-data">
					  		<input type="hidden" name="userId" value="${sessionUser.userId}">
					  		<input type="hidden" name="boardNum" value="${userBoard.boardNum}">
					    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					    										
					      <p><span style="font-weight:1000; font-size: 20pt;">${sessionUser.cafeUserNickname}</span></p>
					      <textarea class="form-control" name="replyContent" id="comments" 
					      rows="6" placeholder="댓글을 남겨보세요"></textarea>
					      
						  <div class="post-meta-test">
						  	<div class="reply-one">
								<input type="file" name="replyImgName">
								<!--사진 아이콘을 누르면 input type file을 누른 효과를 준다?  -->
								<!-- <img id="preview" src="#" width=100 height=100 alt="선택된 이미지가 없습니다"> -->
						  		<!-- 여기가 범인 두번 실행됨  -->
						  	</div>
						  	<div class="reply-two"> 
						  		<input type="submit" value="등록" id="submit" class="button small">
						  	</div>
						  </div>
					      
					      <hr>
					    </div>
					  </form>
					</div>  
			          
			    </div>
			    
			  </article>
			  

         
		       
		          					<!-- 새로운자유게시판1 등 기준 관련 게시판   -->
		          				
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">   
			<!--전체게시판은 제목 50 작성자20 나머지 10  -->
	         <div id="bbpress-forums">
	          <ul class="bbp-forums" style="margin:0;">
	            <li class="bbp-header-header">
	              <ul class="forum-titles">
	                <li class="bbp-forum-info-allBoard">
	                <!-- 여기서 카페아이디랑 카페유저 아이디 비교해서  if문으로   처리?
	                	안된다 애초에 리스트 가져올때 처리해야 페이징도 되고 원래 그게 맞다-->
	                '${boardMenuType.boardMenuName}' 게시판 글</li>

	              </ul>
	            </li>
	            <!-- .bbp-header -->
	          </ul>
	          <!-- .forums-directory -->
	        </div>
	        
			<div id="bbpress-forums">
	          <ul class="bbp-forums">
	          
	          	<c:forEach var="typeList" items="${boardMenuTypeList}"> 	
		            <li class="bbp-header-content">
		              <ul class="forum-titles-test">
		
		                <li class="board-title" class="name-prefixList">
		                <a href="goBoardInside?boardNum=${typeList.BOARD_NUM}&userId=${typeList.USER_ID}">
		                ${typeList.BOARD_TITLE }</a>
		                </li>
		                <li class="board-nickname">${typeList.CAFE_USER_NICKNAME }</li>
		                <li class="board-date">${typeList.BOARD_SAVEDATE}</li>
		
		              </ul>
		            </li>
	            </c:forEach>
	            
	          </ul>
	          <!-- .forums-directory -->

	          
	          					<!--	페이징  -->
	          <div class="page">
		          <div class="page-one">
			          <ul class="pagination">
			         	<c:forEach var="num" begin="1" end="${repeat}">
							<li><a href="goBoardInside?boardNum=${userBoard.boardNum}
							&num=${num}">${num}</a></li>
						</c:forEach>
			          </ul>
		           </div>
		           
		          <div class="page-two">
		          	<a href="goBoardList">전체보기</a>
		          </div>
	          </div>
	          
	        </div>
	        
      </div>
      <!-- 말머리 영역 끝 -->
	            

							<!--카페 인기글 헤더  -->
					<!-- style="background-color:#F5F5F5;" -->
        <div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
	        <div class="general-title text-center">
	          <h3>이 카페 인기글</h3>
	          <hr>
	        </div>
	        <div class="divider"></div>
        					<!--카페 인기글 이미지  -->

	        <div id="popularitems" class="owl-carousel">
									<!-- 9개만 표현 -->
				<c:forEach var="top6" items="${topList}" begin="1" end="9" step="1">
					<div class="col-lg-12">
		            <div class="he-wrap tpl6 market-item">
					<div class="name-topList">${top6.BOARD_TITLE}</div>
		            	 <c:if test="${ top6.CAFE_USER_IMAGE_NUM== 0}">
				       		  <img class="lazyOwl" style="height: 280px;"
				       		  data-src="<%=request.getContextPath()%>/resources/img/프로필.jpg">
		              	  </c:if>
						  <c:if test="${ top6.CAFE_USER_IMAGE_NUM  != 0 }">
							  <img class="lazyOwl" style="height: 280px;"
							  data-src="download?fileNum=${top6.CAFE_USER_IMAGE_NUM}" alt="">
						  </c:if>
		            	
		              <div class="he-view">
		                <div class="bg a0" data-animate="fadeIn">
		                  <h3 class="a1" data-animate="fadeInDown">
		                  	작성자 <br><Br> ${top6.CAFE_USER_NICKNAME}</h3>
		                  <a href="goBoardInside?boardNum=${top6.BOARD_NUM}&userId=${top6.USER_ID}"
		                  class="dmbutton a2" data-animate="fadeIn">게시글 보러가기</a>
		                </div>
		              </div>
		            </div>
		          </div>
				</c:forEach>
	        </div>
        <!-- 리스트 끝 -->
      </div>
      <!-- 카페 인기글 영역 끝 -->
      
	 </div>
<!-- end comments_Form -->

     	 <div class="divider"></div>
        <!-- div comments -->
      </div>
      <!-- end content -->
      <div id="nav" class="right"></div>
    
	</section>
</div>