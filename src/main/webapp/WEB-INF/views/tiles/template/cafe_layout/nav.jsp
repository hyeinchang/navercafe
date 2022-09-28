<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!-- title area -->
		<div class="search-bar" style="margin-top:0;display:none;">
          <form action="" method="get">
            <fieldset>
              <input type="image" src="${contextPath}/resources/MaxiBiz/img/pixel.gif" class="searchsubmit" alt="">
              <input type="text" class="search_text showtextback" name="s" id="s" value="Search...">
            </fieldset>
          </form>
        </div>
        <div class="col-lg-9 col-md-12 col-sm-12" style="display:none;">
          <div id="nav" class="right">
            <div class="container clearfix">
              <ul id="jetmenu" class="jetmenu blue">
                <li class="active"><a href="index.html">Home</a>
                </li>
                <li><a href="#">Pages</a>
                  <ul class="dropdown">
                    <li><a href="javascript:changeLocation('/main2');">About Us</a></li>
                    <li><a href="javascript:changeLocation('/main');">Services</a></li>
                    <li><a href="team-members.html">Team Members</a></li>
                    <li><a href="testimonials.html">Testimonials</a></li>
                    <li><a href="404.html">404 Error</a></li>
                    <li><a href="faq.html">FAQ Page</a></li>
                    <li><a href="left-sidebar.html">Left Sidebar</a></li>
                    <li><a href="right-sidebar.html">Right Sidebar</a></li>
                    <li><a href="fullwidth.html">Full Width</a></li>
                    <li><a href="login.html">Login</a></li>
                    <li><a href="register.html">Register</a></li>
                    <li><a href="contact.html">Contact</a></li>
                  </ul>
                </li>
                <li><a href="#">Shop</a>
                  <ul class="dropdown">
                    <li><a href="digital-download.html">Products Page</a></li>
                    <li><a href="single-product.html">Single Product</a></li>
                    <li><a href="checkout.html">Checkout</a></li>
                    <li><a href="account.html">Account Page</a></li>
                    <li><a href="support.html">Support Center</a></li>
                  </ul>
                </li>
                <li><a href="#">Portfolio</a>
                  <ul class="dropdown">
                    <li><a href="single-portfolio-1.html">Single Portfolio 1</a></li>
                    <li><a href="single-portfolio-2.html">Single Portfolio 2</a></li>
                    <li><a href="portfolio-2.html">Portfolio (2 Columns)</a></li>
                    <li><a href="portfolio-3.html">Portfolio (3 Columns)</a></li>
                    <li><a href="gallery-portfolio.html">Gallery</a></li>
                    <li><a href="masonry-grid-portfolio.html">Masonry Grid Style</a></li>
                  </ul>
                </li>
                <li><a href="#">Blog</a>
                  <ul class="dropdown">
                    <li><a href="blog-left-sidebar.html">Blog Left Sidebar</a></li>
                    <li><a href="blog-right-sidebar.html">Blog Right Sidebar</a></li>
                    <li><a href="single-with-sidebar.html">Single with Sidebar</a></li>
                  </ul>
                </li>
            	<li><a href="#">Color</a>
            	  <ul class="dropdown">
            	    <li><a href="${contextPath}/changeColor?color=asphalt">asphalt</a></li>
            	    <li><a href="${contextPath}/changeColor?color=brown">brown</a></li>
            	    <li><a href="${contextPath}/changeColor?color=mustard">mustard</a></li>
            	    <li><a href="${contextPath}/changeColor?color=pomegranate">pomegranate</a></li>
            	    <li><a href="${contextPath}/changeColor?color=turquoise">turquoise</a></li>
            	    <li><a href="${contextPath}/changeColor?color=yellow">yellow</a></li>
            	  </ul>
            	</li>
              </ul>
            </div>
          </div>
          <!-- nav -->
        </div>
        <!-- title area -->
      </div>
      <!-- site header -->
    </div>
    <!-- end container -->
  </header>
  <!-- end header -->