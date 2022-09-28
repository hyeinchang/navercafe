<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="adminPath" value="${contextPath}/resources/admin"/>
<!DOCTYPE html>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

<!-- Custom fonts for this template-->
<%-- <link href="${adminPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css"> --%>
<script src="https://kit.fontawesome.com/28aa2ee417.js" crossorigin="anonymous"></script>
<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- Custom styles for this template-->
<link href="${adminPath}/css/sb-admin-2.min.css" rel="stylesheet"> 
<link href="${adminPath}/css/sb-admin-2.css" rel="stylesheet">


        <!-- Bootstrap core JavaScript-->
<script src="${adminPath}/vendor/jquery/jquery.min.js"></script>
<script src="${adminPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="${adminPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${adminPath}/js/sb-admin-2.min.js"></script>

<!-- 구글 라인차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<!-- datatables.net -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
<link href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css" />

<!-- 2022-09-16 chi9148 custom css 추가 -->
<link href="${contextPath}/resources/admin/css/custom_admin.css" rel="stylesheet">

<!-- 2022-09-16 chi9148 공통 js 추가 -->
<script src="${adminPath}/js/common.js"></script>
  
</head> 

<body id="page-top">
<div class="modalMask" onclick="hideModal()" title="닫기">
	<div class="modalBody">
		<div class="modalContent"></div>
		<div class="closeModal">닫기X</div>
	</div>	 
</div>
