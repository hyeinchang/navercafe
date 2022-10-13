<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
  <footer class="footer" style="padding:0;box-shadow:none;background:none;">
    <div class="container" style="display:none;">
      <div class="widget col-lg-3 col-md-3 col-sm-12">
        <h4 class="title">About us</h4>
        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry"s standard dummy text ever since the 1500s..</p>
        <a class="button small" href="#">read more</a>
      </div>
      <!-- end widget -->
      <div class="widget col-lg-3 col-md-3 col-sm-12">
        <h4 class="title">Recent Posts</h4>
        <ul class="recent_posts">
          <li>
            <a href="home1.html#">
						<img src="${contextPath}/resources/MaxiBiz/img/recent_post_01.png" alt="" />Our New Dashboard Is Here</a>
            <a class="readmore" href="#">read more</a>
          </li>
          <li>
            <a href="home1.html#">
						<img src="${contextPath}/resources/MaxiBiz/img/recent_post_02.png" alt="" />Design Is In The Air</a>
            <a class="readmore" href="#">read more</a>
          </li>
        </ul>
        <!-- recent posts -->
      </div>
      <!-- end widget -->
      <div class="widget col-lg-3 col-md-3 col-sm-12">
        <h4 class="title">Get In Touch</h4>
        <ul class="contact_details">
          <li><i class="fa fa-envelope-o"></i> info@yoursite.com</li>
          <li><i class="fa fa-phone-square"></i> +34 5565 6555</li>
          <li><i class="fa fa-home"></i> Some Fine Address, 887, Madrid, Spain.</li>
          <li><a href="#"><i class="fa fa-map-marker"></i> View large map</a></li>
        </ul>
        <!-- contact_details -->
      </div>
      <!-- end widget -->
      <div class="widget col-lg-3 col-md-3 col-sm-12">
        <h4 class="title">Flickr Stream</h4>
        <ul class="flickr">
          <li><a href="#"><img alt="" src="${contextPath}/resources/MaxiBiz/img/flickr_01.jpg"></a></li>
          <li><a href="#"><img alt="" src="${contextPath}/resources/MaxiBiz/img/flickr_02.jpg"></a></li>
          <li><a href="#"><img alt="" src="${contextPath}/resources/MaxiBiz/img/flickr_03.jpg"></a></li>
          <li><a href="#"><img alt="" src="${contextPath}/resources/MaxiBiz/img/flickr_04.jpg"></a></li>
          <li><a href="#"><img alt="" src="${contextPath}/resources/MaxiBiz/img/flickr_05.jpg"></a></li>
          <li><a href="#"><img alt="" src="${contextPath}/resources/MaxiBiz/img/flickr_06.jpg"></a></li>
          <li><a href="#"><img alt="" src="${contextPath}/resources/MaxiBiz/img/flickr_07.jpg"></a></li>
          <li><a href="#"><img alt="" src="${contextPath}/resources/MaxiBiz/img/flickr_08.jpg"></a></li>
        </ul>
      </div>
      <!-- end widget -->
    </div>
    <!-- end container -->

    <div class="copyrights">
      <div class="container">
        <div class="col-lg-6 col-md-6 col-sm-12 columns footer-left">
          <p>Copyright © 2014 - All rights reserved.</p>
          <div class="credits">
            <!--
              You are NOT allowed to delete the credit link to TemplateMag with free version.
              You can delete the credit link only if you bought the pro version.
              Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/maxibiz-bootstrap-business-template/
              Licensing information: https://templatemag.com/license/
            -->
            Created with MaxiBiz template by <a href="https://templatemag.com/">TemplateMag</a>
          </div>
        </div>
        <!-- end widget -->
        <div class="col-lg-6 col-md-6 col-sm-12 columns text-right">
          <div class="footer-menu right">
            <ul class="menu">
              <li><a href="index.html">Home</a></li>
              <li><a href="about.html">About</a></li>
              <li><a href="#">Sitemap</a></li>
              <li><a href="#">Site Terms</a></li>
              <li><a href="contact">Contact</a></li>
            </ul>
          </div>
        </div>
        <!-- end large-6 -->
      </div>
      <!-- end container -->
    </div>
    <!-- end copyrights -->
  </footer>
  <!-- end footer -->
  <div class="dmtop" style="overflow: hidden;">Scroll to Top</div>

  <!-- JavaScript Libraries -->
  <!-- <script src="${contextPath}/resources/MaxiBiz/lib/jquery/jquery.min.js"></script> -->
  <script src="${contextPath}/resources/MaxiBiz/lib/bootstrap/js/bootstrap.min.js"></script>
  <script src="${contextPath}/resources/MaxiBiz/lib/php-mail-form/validate.js"></script>
  <script src="${contextPath}/resources/MaxiBiz/lib/prettyphoto/js/prettyphoto.js"></script>
  <script src="${contextPath}/resources/MaxiBiz/lib/isotope/isotope.min.js"></script>
  <script src="${contextPath}/resources/MaxiBiz/lib/hover/hoverdir.js"></script>
  <script src="${contextPath}/resources/MaxiBiz/lib/hover/hoverex.min.js"></script>
  <script src="${contextPath}/resources/MaxiBiz/lib/unveil-effects/unveil-effects.js"></script>
  <script src="${contextPath}/resources/MaxiBiz/lib/owl-carousel/owl-carousel.js"></script>
  <script src="${contextPath}/resources/MaxiBiz/lib/jetmenu/jetmenu.js"></script>
  <script src="${contextPath}/resources/MaxiBiz/lib/animate-enhanced/animate-enhanced.min.js"></script>
  <script src="${contextPath}/resources/MaxiBiz/lib/jigowatt/jigowatt.js"></script>
  <script src="${contextPath}/resources/MaxiBiz/lib/easypiechart/easypiechart.min.js"></script>

  <!-- Template Main Javascript File -->
  <script src="${contextPath}/resources/MaxiBiz/js/main.js"></script>
  
  <form name="cafeForm" method="get">
  	<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
  	<input type="hidden" name="boardMenuNum" value="${_cafeDTO.menuDTO.boardMenuNum}">
  </form>
<script type="text/javascript">
  function changeCafeMenu(path, menuNum) {
	  var form = document.cafeForm;
	  var boardMenuNum = form.boardMenuNum;
	  
	  if(menuNum) {
		  boardMenuNum.value = menuNum;
		  
		  if(boardMenuNum.value != '') {
			  var boardReadAuth = '${_cafeDTO.menuDTO.boardReadAuth}';
			  var cafeUserGrade = '${_cafeDTO.loginUser.cafeUserGrade}';

			  if(Number(boardReadAuth) > Number(cafeUserGrade)) {
				  alert('권한이 없습니다.');
				  return;
			  }
		  }
	  } else {
		  form.removeChild(boardMenuNum);
	  }
	  
	  form.action = path;
	  form.submit();
  }
  
  function changeCafe(cafeId) {
	  location.href = '${pageContext.request.contextPath}/user/main?cafeId=' + cafeId;
  }
  
  function checkLoginForm() {
	  var xhr = new XMLHttpRequest();
	  var data = new Object();
	  loginForm = document.loginForm;
	  
	  if(loginForm.id.value == '') {
		  alert('아이디를 입력해주십시오.');
		  loginForm.id.focus();
		  return;
	  }
	  
	  if(loginForm.password.value == '') {
		  alert('비밀번호를 입력해주십시오.');
		  loginForm.password.focus();
		  return;
	  }
	  
	  data.id = loginForm.id.value;
	  data.password = loginForm.password.value;
	  
	  xhr.open('post', '${contextPath}/cafe/login');
	  xhr.setRequestHeader('Content-Type', 'application/json');
	  xhr.onreadystatechange = function() {
		  if(xhr.readyState == 4 && xhr.status == 200) {
			  if(xhr.response == 'false') {
				  alert('등록되지 않은 회원입니다.');
			  } else {
				  location.reload();
			  }
		  }
	  }
	  xhr.send(JSON.stringify(data));
  }
</script>
</body>
</html>