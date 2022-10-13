<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>MaxiBiz Bootstrap Business Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="${contextPath}/resources/MaxiBiz/img/favicon.png" rel="icon">
  <link href="${contextPath}/resources/MaxiBiz/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Ruda:400,900,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="${contextPath}/resources/MaxiBiz/lib/bootstrap/css/bootstrap.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="${contextPath}/resources/MaxiBiz/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="${contextPath}/resources/MaxiBiz/lib/prettyphoto/css/prettyphoto.css" rel="stylesheet">
  <link href="${contextPath}/resources/MaxiBiz/lib/hover/hoverex-all.css" rel="stylesheet">
  <link href="${contextPath}/resources/MaxiBiz/lib/jetmenu/jetmenu.css" rel="stylesheet">
  <link href="${contextPath}/resources/MaxiBiz/lib/owl-carousel/owl-carousel.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="${contextPath}/resources/MaxiBiz/css/style.css" rel="stylesheet">
  <c:choose>
  <c:when test="${_cafeDTO eq null || _cafeDTO.cafeSkin eq null}">
   <link rel="stylesheet" href="${contextPath}/resources/MaxiBiz/css/colors/default.css">
  </c:when>
  <c:otherwise>
   <link rel="stylesheet" href="${contextPath}/resources/MaxiBiz/css/colors/${_cafeDTO.cafeSkin}.css">	
  </c:otherwise>
  </c:choose>
 
  <!-- =======================================================
    Template Name: MaxiBiz
    Template URL: https://templatemag.com/maxibiz-bootstrap-business-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
  
  <!-- 2022-08-26 chi9148 custom css 추가 -->
  <link href="${contextPath}/resources/css/custom_user.css" rel="stylesheet">
  
  <!-- 2022-09-28 chi9148 common js 추가 -->
  <script type="text/javascript" src="${contextPath}/resources/js/common.js"></script>
  
  <!-- 2022-10-13 chi9148 jquery-ui & bootstrap datapicker 추가 -->
  <script src="${contextPath}/resources/MaxiBiz/lib/jquery/jquery.min.js"></script>
  <script src="${contextPath}/resources/jquery-ui-1.13.2/jquery-ui.js"></script>
  <link rel="stylesheet" href="${contextPath}/resources/bootstrap-datepicker-1.9.0-dist/css/bootstrap-datepicker3.standalone.css">
  <script type="text/javascript" src="${contextPath}/resources/bootstrap-datepicker-1.9.0-dist/js/bootstrap-datepicker.min.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/bootstrap-datepicker-1.9.0-dist/locales/bootstrap-datepicker.ko.min.js"></script>
</head>

<body>
  <div class="topbar clearfix">
    <div class="container">
      <div class="col-lg-12 text-right">
        <div class="social_buttons" style="opacity:0;">
          <a href="#" data-toggle="tooltip" data-placement="bottom" title="로그아웃"><img src="${contextPath}/resources/img/cstm_logout_white.png" alt="로그아웃" style="    margin: 0 0 5px;
    height: 18px;"></a>
          <!-- <a href="#" data-toggle="tooltip" data-placement="bottom" title="Facebook"><i class="fa fa-facebook"></i></a>
          <a href="#" data-toggle="tooltip" data-placement="bottom" title="Twitter"><i class="fa fa-twitter"></i></a>
          <a href="#" data-toggle="tooltip" data-placement="bottom" title="Google+"><i class="fa fa-google-plus"></i></a>
          <a href="#" data-toggle="tooltip" data-placement="bottom" title="Dribbble"><i class="fa fa-dribbble"></i></a>
          <a href="#" data-toggle="tooltip" data-placement="bottom" title="RSS"><i class="fa fa-rss"></i></a> -->
        </div>
      </div>
    </div>
    <!-- end container -->
  </div>
  <!-- end topbar -->

  <header class="header">
    <div class="container">
      <div class="site-header clearfix">
        <div class="col-lg-3 col-md-3 col-sm-12 title-area">
          <div class="site-title" id="title">
            <a href="${contextPath}" title="">
              <h4>NA<span>VER</span></h4>
            </a>
          </div>
        </div>