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
  <style type="text/css">
  	.userViewDiv{display: flex;padding-bottom: 10px;}
  	.one{width:3%; }
	.two{width:50%; text-align:left;}
	.three{width:30%;}
  </style>
</head>

<body>

		<div align="center">
		
		<h1>${getUserViewList.userId}~ 님의 게시글 더보기 화면</h1>  
		<div class="userViewDiv">     
				<div class="three">
				
				</div>
	         	<div class=one>
	         		<a href="#">
	          		<c:if test="${ getUserViewList.cafeUserImage == 'nan' }">
	          			<img src="<%=request.getContextPath()%>/resources/img/프로필.jpg"
	          			width="40px" class="img-circle alignleft" alt="">
	          		</c:if>
					<c:if test="${ getUserViewList.cafeUserImage  != 'nan' }">
						<img src="download?file=${getUserViewList.cafeUserImage}" 
						width="50" class="img-circle alignleft" alt="">
					</c:if>
	           		</a>
	            </div>
	            
				<div class="two">
					<a href="#">${getUserViewList.cafeUserNickname}(${getUserViewList.userId})</a><br>
				            방문 ${getUserViewList.cafeUserVisit}	
				            작성글 ${getUserViewList.cafeUserWrite}  
				            작성 댓글 ${getUserViewList.cafeUserReply}
				</div>
				
	       </div>
			<table border="1" width="1200px;">
		     		<tr>
		     			<th>보드 번호~~</th><th>제목~~~ </th>
		     			<th>날짜~~~</th><th>조회수~~</th>
		     		</tr>
		     		<tr>
		     			<th>보드 번호~~</th><th>제목~~~ </th>
		     			<th>날짜~~~</th><th>조회수~~</th>
		     		</tr>
		     		<tr>
		     			<th>보드 번호~~</th><th>제목~~~ </th>
		     			<th>날짜~~~</th><th>조회수~~</th>
		     		</tr>
	    		 </table>
	     

     
     <hr><hr><hr>
     </div>
     
     
     
     
     


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