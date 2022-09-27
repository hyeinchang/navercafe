<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>MaxiBiz Bootstrap Business Template</title>
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <meta content="" name="keywords">
  <meta content="" name="description">

  <!-- Favicons -->
  <link href="<%=request.getContextPath() %>/resources/img/favicon.png" rel="icon">
  <link href="<%=request.getContextPath() %>/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Ruda:400,900,700" rel="stylesheet">

  <!-- Bootstrap CSS File -->
  <link href="<%=request.getContextPath() %>/resources/lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Libraries CSS Files -->
  <link href="<%=request.getContextPath() %>/resources/lib/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/resources/lib/prettyphoto/css/prettyphoto.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/resources/lib/hover/hoverex-all.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/resources/lib/jetmenu/jetmenu.css" rel="stylesheet">
  <link href="<%=request.getContextPath() %>/resources/lib/owl-carousel/owl-carousel.css" rel="stylesheet">

  <!-- Main Stylesheet File -->
  <link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet">
  <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/colors/blue.css">

  <link href="<%=request.getContextPath() %>/resources/css/bbpress.css" rel="stylesheet">

  <!-- =======================================================
    Template Name: MaxiBiz
    Template URL: https://templatemag.com/maxibiz-bootstrap-business-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<body>

	<div align="center">
		<h1> 카페 회원 목록 </h1><h2><a href="goRegCafeMember">카페 회원 추가</a></h2>
	     <table border="1" width="1200px;">
	     	<tr>
	     		<th>카페아이디/고유번호</th><th>회원아이디</th><th>닉네임</th>
	     		<th>프로필사진</th><th>회원등급</th><th>방문횟수</th>
	     		<th>글작성횟수</th><th>댓글작성횟수</th><th>출석체크횟수</th>
	     		<th>카페 가입일</th>
	     	</tr>
	     	<c:forEach var="cafeMemberList" items="${cafeMemberList}">
	     		<tr>
	     			<th>${cafeMemberList.cafeId }</th>
	     			<th>${cafeMemberList.userId }</th>
	     			<th>${cafeMemberList.cafeUserNickname}</th>
		     		<th>${cafeMemberList.cafeUserImage}
		     			<img width="40px;" src="download?fileNum=${cafeMemberList.cafeUserImage}"></th>
		     		<th>${cafeMemberList.cafeUserGrade }</th>
		     		<th>${cafeMemberList.cafeUserVisit }</th>
		     		<th>${cafeMemberList.cafeUserWrite }</th>
		     		<th>${cafeMemberList.cafeUserReply }</th>
		     		<th>${cafeMemberList.cafeUserVisitCheck }</th>
		     		<th>${cafeMemberList.cafeUserRegdate }</th>
	     		</tr>
	     	</c:forEach>
	     </table>
     </div>
     
     <div align="center">
	     <h1>로그인(세션 생성용)</h1>
	     <form action="logChk" method="post">
	     	카페유저 아이디만 입력 : <input type="text" name="userId">
	     	<input type="submit" value="로그인">
	     </form>
	     <h2>세션아이디 : ${sessionId}  <input type="button" value="로그아웃" onclick="location.href='logout'"></h2>
     </div>
     
     <hr><hr><hr>
     	
     
     
     
     
     
     


  <div class="dmtop">Scroll to Top</div>

  <!-- JavaScript Libraries -->
  <script src="<%=request.getContextPath() %>/resources/lib/jquery/jquery.min.js"></script>
  <script src="<%=request.getContextPath() %>/resources/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="<%=request.getContextPath() %>/resources/lib/php-mail-form/validate.js"></script>
  <script src="<%=request.getContextPath() %>/resources/lib/prettyphoto/js/prettyphoto.js"></script>
  <script src="<%=request.getContextPath() %>/resources/lib/isotope/isotope.min.js"></script>
  <script src="<%=request.getContextPath() %>/resources/lib/hover/hoverdir.js"></script>
  <script src="<%=request.getContextPath() %>/resources/lib/hover/hoverex.min.js"></script>
  <script src="<%=request.getContextPath() %>/resources/lib/unveil-effects/unveil-effects.js"></script>
  <script src="<%=request.getContextPath() %>/resources/lib/owl-carousel/owl-carousel.js"></script>
  <script src="<%=request.getContextPath() %>/resources/lib/jetmenu/jetmenu.js"></script>
  <script src="<%=request.getContextPath() %>/resources/lib/animate-enhanced/animate-enhanced.min.js"></script>
  <script src="<%=request.getContextPath() %>/resources/lib/jigowatt/jigowatt.js"></script>
  <script src="<%=request.getContextPath() %>/resources/lib/easypiechart/easypiechart.min.js"></script>

  <!-- Template Main Javascript File -->
  <script src="<%=request.getContextPath() %>/resources/js/main.js"></script>


</body>
</html>