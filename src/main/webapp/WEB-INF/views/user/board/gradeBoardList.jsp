<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style type="text/css">
/*//////////////////////////////////   등업 게시판   ////////////////////////////////  */
.grade-button{background-color: white;color:black; border:1px solid black;}
.grade-board-list{padding:10px;}


.bbp-forum-test-nickname img{width:15%;}


.grade-board{display: flex; padding:10px;}
.grade-one{width:50%;}
.grade-two{width:50%; text-align: right;}
.grade-result{padding-top:50px;}

.bbp-forum-test-nickname{float: left;text-align:left;width: 15%;}

.bbp-forum-test-grade,.bbp-forum-test-nowGrade{float: left;text-align:left;width: 12.5%;}

.bbp-forum-test-visit-count,.bbp-forum-test-board-count,
.bbp-forum-test-reply-count,.bbp-forum-test-joindate,
.bbp-forum-test-request{float: left;text-align:left;width: 10%;}
.bbp-forum-test-joindate,.bbp-forum-test-request{
float: left;text-align:left;width: 15%;
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

ul{
	list-style: none;
}


</style>

<div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${_cafeDTO.cafeLayout eq 'left' ? '' : 'style="float:right;"'}>
<section class="section1">

<div class="container clearfix">
	      <div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix"
	      style="background-color:#F5F5F5;">
					<h1>등업 게시판입니다</h1>

		        <!-- SLIDE POST -->
		        <article class="blog-wrap-test">

		         <div class="grade-board">
		         	<div class="grade-one">
		         		<h4>등업 게시판</h4><p>등업게시판</p> 
		         		<button class="grade-button">등업 신청하기</button>
		         	</div>
		         	<div class="grade-two">
		         		<button class="grade-button">우리카페 등급보기</button>
		         		<div class="grade-result"><a href="#">결과보기</a></div>
		         	</div>
			     </div>  
			     

			     
		<div class="grade-board-list">  

			<div id="bbpress-forums">
	              <ul class="forum-titles" style="background-color:black;color:white;
	              padding:20px 30px 30px 35px; margin:0 auto;">
	                <li class="bbp-forum-test-nickname">신청자</li>
	                <li class="bbp-forum-test-grade">신청등급</li>
	                <li class="bbp-forum-test-nowGrade">현재등급</li>
	                <li class="bbp-forum-test-visit-count">방문수</li>
	                <li class="bbp-forum-test-board-count">게시글수</li>
	                <li class="bbp-forum-test-reply-count">댓글수</li>
	                <li class="bbp-forum-test-joindate">가입일</li>
	                <li class="bbp-forum-test-request">신청일</li>
	              </ul>
	        </div>

		     <div id="bbpress-forums">

	          <ul class="bbp-forums">
		          <c:forEach var="gradeList" items="${getGradeList}">
		          		<li class="bbp-header-grade-list">
			              <ul class="forum-titles-test">
			               <li class="bbp-forum-test-nickname">
			                <c:if test="${ gradeList.CAFE_USER_IMAGE== 0}">
		              			<img src="<%=request.getContextPath()%>/resources/img/프로필.jpg"
		              			width="40px" class="img-circle alignleft" alt="">
		              		</c:if>
							<c:if test="${ gradeList.CAFE_USER_IMAGE  != 0 }">
								<img src="test_download?fileImageNum=${gradeList.CAFE_USER_IMAGE}" 
								width="40px" class="img-circle alignleft" alt="">
							</c:if>
			               	${gradeList.CAFE_USER_NICKNAME}
			               </li>
			                <li class="bbp-forum-test-grade">${gradeList.GRADE_UP}</li>
			                <li class="bbp-forum-test-nowGrade">${gradeList.GRADE_NOW}</li>
			                <li class="bbp-forum-test-visit-count">${gradeList.VISIT}</li>
			                <li class="bbp-forum-test-board-count">${gradeList.BOARD_COUNT}</li>
			                <li class="bbp-forum-test-reply-count">${gradeList.REPLY_COUNT}</li>
			                <li class="bbp-forum-test-joindate">${gradeList.REGDATE}</li>
			                <li class="bbp-forum-test-request">${gradeList.APPLY_DATE}</li>
			              </ul>
			            </li>  	
		          </c:forEach>
			          	
	            
	          </ul>
	          
	          <!-- .forums-directory -->
			</div>
		</div>
 </article>         
					<!--	페이징  -->
			  <div class="paging" align="center">
				  <ul class="pagination">
				    <li><a href="#">1</a></li>
				    <li><a href="#">2</a></li>
				    <li><a href="#">3</a></li>
				  </ul>
			  </div>
		</div>
	</div>
</section>
</div>