<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="address" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}"/>

  	<!-- Page Wrapper -->
    <div id="wrapper">
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
					
            	<!-- Page Heading -->
               	<h1 class="h3 text-gray-800 cstmTitle">기본정보</h1>
               	
               	<!-- cstmContent1 -->
               	<div class="cstmContent1">
               	
               		<form class="user">
                    	<div class="form-group">
                    		<label>카페 아이디</label>
                        	<input type="text" class="form-control form-control-user" placeholder="카페 아이디를 입력해주십시오." style="margin-right: 10px">
                            <a href="#" class="btn btn-success btn-icon-split">
                                <span class="icon text-white-50">
                                    <i class="fas fa-check"></i>
                                </span>
                                <span class="text">중복확인</span>
                         	</a>
                        </div>
                        <div class="form-group">
                    		<label>카페 주소</label>
                        	${address}/main?cafeId=<span id="cafeIdTxt"></span>
                        </div>
                        <div class="form-group">
                        	<label>카페 이름</label>
                            <input type="text" class="form-control form-control-user" placeholder="카페 이름을 입력해주십시오.">
                        </div>
                         <div class="form-group">
                        	<label>카페 소개</label>
                            <textarea class="form-control" placeholder="카페 소개를 입력해주십시오." cols="50" rows="5"></textarea>
                        </div>
                     </form>
             		
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
         