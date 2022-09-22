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
  
  
<style>
/*//////////////////////////////////   메모 게시판   ////////////////////////////////  */
.memo-board{padding-top:10px;}
.memo-wrap{padding:10px;}
</style>
</head>

<body>



<div class="container clearfix">
	      <div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix">
					<h1>메모 게시판입니다</h1>
		        <!-- SLIDE POST -->
		        <article class="blog-wrap-test">
		        
				<div class="memo-wrap">
				
		         <div class="memo-board">
		            <h4>새로운 메모 게시판</h4>
		            <form id="comments_form" action="" name="comments_form" class="row" method="post">
		              <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
		                <textarea class="form-control" name="comments" id="comments" rows="6" placeholder="글을 입력해 주세요."></textarea>
		                <input type="submit" value="등록" id="submit" class="button small">
		              </div>
		            </form>
			     </div>  
		         
		         <c:forEach var="memoList" items="${mapList}">
		         	<div class="board-board">
			          <header class="page-header blog-title">
			            <div class="post-meta-test">
			              	<div class="div-one">
				              	<a href="#">
				              		<c:if test="${memoList.CAFE_USER_IMAGE == 'nan' }">
				              			<img src="<%=request.getContextPath()%>/resources/img/프로필.jpg"
				              			width="60%" class="img-circle alignleft">
				              		</c:if>
									<c:if test="${memoList.CAFE_USER_IMAGE != 'nan' }">
										<img src="download?file=${memoList.CAFE_USER_IMAGE}" 
										width="60%" class="img-circle alignleft">
									</c:if>
				              	</a>
			                </div>
							<div class="memo-div-two">
								<a href="#">${memoList.CAFE_USER_NICKNAME}</a>
								수정 | 삭제
							</div>
							<div class="div-three">
				                	${memoList.MEMO_SAVEDATE}
				            </div>
			            </div>
			          </header>
			          <div class="board-post-desc">
			          	<p>
			         		${memoList.MEMO_CONTENT}
						</p>
						<a href="#">∧ 댓글 0 </a>
			          </div>
				</div>
		     </c:forEach>

				
			</div>
		 </article>
		          

				<!--	페이징  -->
		  <div class="page-one">
			  <ul class="pagination">
			    <li><a href="#">1</a></li>
			    <li><a href="#">2</a></li>
			    <li><a href="#">3</a></li>
			  </ul>
		  </div>
	</div>
</div>


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