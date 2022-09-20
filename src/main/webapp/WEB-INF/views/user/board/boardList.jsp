<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

${boardList.size() }
	<div align="center">
		<h1> 전체 게시판 </h1>
	     <table border="1" width="1200px;">
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
     
     <!-- <hr><hr><hr> -->
 
  <%-- <div class="dmtop">Scroll to Top</div><script src="<%=request.getContextPath() %>/resources/js/main.js"></script> --%>
