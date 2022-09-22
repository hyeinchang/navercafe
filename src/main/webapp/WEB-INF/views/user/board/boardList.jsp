<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="content pull-right col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${cafeDTO.cafeLayout > 0 ? '' : 'style="float:right;"'}>
	
		  <section class="section1">
		    <div class="container clearfix">
		      <div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
		        <div class="col-lg-8 col-md-8 col-sm-8">


	<div align="center">
		<h1> 전체 게시판 </h1>
	     <table border="1">
	     	<tr>
	     		<th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
	     	</tr>
	     	<c:forEach var="dto" items="${boardList}">
	     		<tr>
	     			<th>
	     				<a href="goBoardInside?boardNum=${dto.boardNum}">
	     					${dto.boardTitle}
	     				</a>
	     			</th>
	     			<th>${dto.userId}</th>
	     			<th>${dto.boardSaveDate}</th>
		     		<th>${dto.hit}</th>
	     		</tr>
	     	</c:forEach>
	     </table>
     </div>
     
     
 </div>
		
		
		        <div class="clearfix"></div>
		        <div class="divider"></div>
		
		      </div>
		      <!-- end content -->
		    </div>
		    <!-- end container -->
		  </section>
	  
	  
 	  </div>
     
     
     
     <!-- <hr><hr><hr> -->
 
  <%-- <div class="dmtop">Scroll to Top</div><script src="<%=request.getContextPath() %>/resources/js/main.js"></script> --%>
