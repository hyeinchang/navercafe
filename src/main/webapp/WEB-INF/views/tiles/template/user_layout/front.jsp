<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="address" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}"/>
  
  <section class="section1" style="padding: 30px 0 0 0;">
    <div class="container clearfix">
    <c:choose>
    <c:when test="${cafeDTO.cafeTitle eq null || cafeDTO.cafeTitle.length() == 0}">
      <div class="default-title">
	  	<div class="site-title">
            <a href="${contextPath}" title="">
              <h4>Ca<span>fe</span></h4>
            </a>
          </div>
		<h1>${cafeDTO.cafeName}</h1>
		<a href="${address}${contextPath}/user/main?cafeId=${cafeDTO.cafeId}">${address}${contextPath}/main?cafeId=${cafeDTO.cafeId}</a>
	  </div>
	</c:when>  
	<c:otherwise>
	  <div class="setting-title">
		<a href="${contextPath}/user/main?cafeId=${cafeDTO.cafeId}">
		  <img src="${cafeDTO.cafeTitle}">
		</a>
	  </div>
	</c:otherwise>
    </c:choose>
	</div>
  </section>	

  <section class="section1">
    <div class="container clearfix">
      