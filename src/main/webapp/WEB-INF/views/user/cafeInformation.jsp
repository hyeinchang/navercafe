<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="address" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${contextPath}?cafeId=${_cafeDTO.cafeId}"/>
	<div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${_cafeDTO.cafeLayout eq 'left' ? '' : 'style="float:right;"'}>
       	<section class="section1">
		    <div class="container clearfix">
		      <div class="">
		       	<h4>
		          <span>카페 소개</span>
		        </h4>
		      </div>
		      <div class="col-lg-8 col-md-8 col-sm-8 clearfix">
				<table class="tbl_cafe_info">
					<caption style="display:none;">
						<span class="blind">카페상세소개표</span>
					</caption>
					<colgroup>
						<col width="150">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<th scope="row">카페 이름</th>
							<td><strong class="cafe_name">${_cafeDTO.cafeName}</strong></td>
						</tr>
						<tr>
							<th scope="row">카페 주소</th>
							<td><a href="${address}" target="_top">${address}</a></td>
						</tr>
						<tr>
							<th scope="row">카페아이콘
							</th>
							<td>
							<c:choose>
		          	  			<c:when test="${_cafeDTO.cafeIconNum eq null || _cafeDTO.cafeIconNum == 0}">
		          	  			<img class="infoCafeIcon" src="${contextPath}/resources/img/cafeicon_default_112x112.png" alt="카페아이콘 없음">
		          	  			</c:when>
		          	  			<c:otherwise>
		          	  			<a href="${contextPath}/file/download?cafeIconNum=${_cafeDTO.cafeIconNum}">
									<img class="infoCafeIcon" src="${contextPath}/file/download?cafeIconNum=${_cafeDTO.cafeIconNum}" alt="카페아이콘">
								</a>
		          	  			</c:otherwise>
		          	  		</c:choose>
								
							</td>
						</tr>
						<tr class="tr_line">
							<td colspan="2"></td>
						</tr>
						<tr>
							<th scope="row">카페 매니저</th>
							<td>
								<a href="#" class="m-tcol-c" onclick=" return false;">${_cafeDTO.userId}</a>
							</td>
						</tr>
						<tr>
							<th scope="row">카페 설립일</th>
							<td>
								<span class="txt_history">Since <fmt:formatDate value="${_cafeDTO.cafeRegdate}" pattern="YYYY.MM.dd."/></span>
							</td>
						</tr>
						<tr>
							<th scope="row">카페 설명</th>
							<td>${_cafeDTO.cafeExplanation}</td>
						</tr>
						<tr>
							<th scope="row">가입 방식</th>
							<td>
							<c:choose>
								<c:when test="${_cafeDTO.cafeJoinApply eq 'N'}">
								가입 신청 시 바로 가입
								</c:when>
								<c:otherwise>
								운영진 승인 후 가입
								</c:otherwise>
							</c:choose>
							
							</td>
						</tr>
						<tr>
							<th scope="row">카페 활동</th>
							<td>카페멤버 : <span class="count"><fmt:formatNumber value="${_cafeDTO.countMap.totalCafeMember}" pattern="###,###,###"/></span>명&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								전체 게시글 : <span class="count"><fmt:formatNumber value="${_cafeDTO.countMap.totalBoardCount}" pattern="###,###,###"/></span>개&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								전체 조회수 : <span class="count"><fmt:formatNumber value="${_cafeDTO.countMap.totalBoardHit}" pattern="###,###,###"/></span>회&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</td>
						</tr>
					</tbody>
				</table>
		     
		      </div>
		      <!-- end content -->
		    </div>
		    <!-- end container -->
		  </section>
      </div>
      <!-- end content -->