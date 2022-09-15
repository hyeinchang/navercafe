<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="skinLocation" value="${contextPath}/resources/img/sample/skin"/>

  	<!-- Page Wrapper -->
    <div id="wrapper">
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
					
            	<!-- Page Heading -->
               	<h1 class="h3 text-gray-800 cstmTitle">카페 스킨</h1>
               	
               	<!-- cstmContent1 -->
               	<div class="cstmContent1" style="width:650px;">
               		<div>
               			<ul>
               				<c:forEach var="skin" items="${skinList}">
               				<li><img src="${skinLocation}/skin_${skin}.png" width="100px" height="100px"></li>
               				</c:forEach>
               			</ul>
               		</div>
               		
               		
               		
               		
              
             		
             		<div class="btnArea">
             			<a href="#" class="btn btn-primary btn-icon-split">
                              <span class="icon text-white-50">
                                   <i class="fas fa-check"></i>
                              </span>
                              <span class="text">저장하기</span>
                          </a>
             		</div>
               	</div>
				<!-- End of cstmContent1 -->	
					
            </div>
            <!-- End of Main Content -->
