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

.bbp-forum-test-nickname{float: left;text-align:left;width: 20%;}

.bbp-forum-test-grade,.bbp-forum-test-nowGrade{float: left;text-align:left;width: 15%;}

.bbp-forum-test-visit-count,.bbp-forum-test-board-count,
.bbp-forum-test-reply-count,.bbp-forum-test-joindate,
.bbp-forum-test-request{float: left;text-align:left;width: 10%;}
</style>

<div class="content pull-right col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${cafeDTO.cafeLayout > 0 ? '' : 'style="float:right;"'}>
<section class="section1">

<div class="container clearfix">
	      <div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix">
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
	          <ul class="bbp-forums">
	            <li class="bbp-header">
	              <ul class="forum-titles">
	                <li class="bbp-forum-test-nickname">신청자</li>
	                <li class="bbp-forum-test-grade">신청등급</li>
	                <li class="bbp-forum-test-nowGrade">현재등급</li>
	                <li class="bbp-forum-test-visit-count">방문수</li>
	                <li class="bbp-forum-test-board-count">게시글수</li>
	                <li class="bbp-forum-test-reply-count">댓글수</li>
	                <li class="bbp-forum-test-joindate">가입일</li>
	                <li class="bbp-forum-test-request">신청일</li>
	              </ul>
	            </li>
	            <!-- .bbp-header -->
	          </ul>
	          <!-- .forums-directory -->
	        </div>
	        <!-- /bbpress -->
		         
		     <div id="bbpress-forums">
		     
	          <ul class="bbp-forums">
	          
		          <li class="bbp-header-grade-list">
		            	<ul class="forum-titles-test">
	
				            <li class="bbp-forum-test-nickname">
				            <img src="<%=request.getContextPath() %>/resources/img/윌.png" 
				            class="img-circle"> 쪼비</li>
			                <li class="bbp-forum-test-grade">성실멤버</li>
			                <li class="bbp-forum-test-nowGrade">일반멤버</li>
			                <li class="bbp-forum-test-visit-count">9</li>
			                <li class="bbp-forum-test-board-count">1</li>
			                <li class="bbp-forum-test-reply-count">3</li>
			                <li class="bbp-forum-test-joindate">2022.08.24.</li>
			                <li class="bbp-forum-test-request">2022.09.01.</li>
			                
		              	</ul>
		            </li>
	          
		          <c:forEach var="gradeList" items="${getGradeList}">
		          		<li class="bbp-header-grade-list">
			              <ul class="forum-titles-test">
			               <li class="bbp-forum-test-nickname">${gradeList.userId}</li>
			                <li class="bbp-forum-test-grade">${gradeList.gradeUp}</li>
			                <li class="bbp-forum-test-nowGrade">${gradeList.gradeNow}</li>
			                <li class="bbp-forum-test-visit-count">${gradeList.visit}</li>
			                <li class="bbp-forum-test-board-count">${gradeList.boardCount}</li>
			                <li class="bbp-forum-test-reply-count">${gradeList.replyCount}</li>
			                <li class="bbp-forum-test-joindate">${gradeList.regdate}</li>
			                <li class="bbp-forum-test-request">${gradeList.applyDate}</li>
			              </ul>
			            </li>  	
		          </c:forEach>
			          	
	            
	          </ul>
	          
	          <!-- .forums-directory -->
			</div>
		</div>
 </article>         

					<!--	페이징  -->
			  <div class="page-one">
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
