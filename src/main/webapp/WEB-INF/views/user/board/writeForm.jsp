<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	  <div class="content pull-right col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${cafeDTO.cafeLayout > 0 ? '' : 'style="float:right;"'}>
	
		  <section class="section1">
		    <div class="container clearfix">
		      <div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
		        <div class="col-lg-8 col-md-8 col-sm-8">
		          <h4 class="title">Contact Form</h4>
		          <div id="message"></div>
		          <form class="contact-form php-mail-form" role="form" action="contactform/contactform.php" method="POST">
		
		            <div class="form-group">
		              <input type="name" name="name" class="form-control" id="contact-name" placeholder="Your Name" data-rule="minlen:4" data-msg="Please enter at least 4 chars">
		              <div class="validate"></div>
		            </div>
		            <div class="form-group">
		              <input type="email" name="email" class="form-control" id="contact-email" placeholder="Your Email" data-rule="email" data-msg="Please enter a valid email">
		              <div class="validate"></div>
		            </div>
		            <div class="form-group">
		              <input type="text" name="subject" class="form-control" id="contact-subject" placeholder="Subject" data-rule="minlen:4" data-msg="Please enter at least 8 chars of subject">
		              <div class="validate"></div>
		            </div>
		
		            <div class="form-group">
		              <textarea class="form-control" name="content" id="content" placeholder="Your Message" rows="5" data-rule="required" data-msg="Please write something for us"></textarea>
		              <div class="validate"></div>
		            </div>
		
		            <div class="loading"></div>
		            <div class="error-message"></div>
		            <div class="sent-message">Your message has been sent. Thank you!</div>
		
		            <div class="form-send">
		              <button type="submit" class="btn btn-large btn-primary">Send Message</button>
		            </div>
		
		          </form>
		        </div>
		
		
		        <div class="clearfix"></div>
		        <div class="divider"></div>
		
		      </div>
		      <!-- end content -->
		    </div>
		    <!-- end container -->
		  </section>
	  
	  
 	  </div>
      <!-- end content -->
      
<script type="text/javascript" src="${contextPath}/resources/plugin/smart_editor2/js/HuskyEZCreator.js" charset="utf-8"></script>      
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${contextPath}/resources/plugin/smart_editor2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
	
	//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	function submitContents(elClickedObj) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);
		document.getElementById("form").submit();
		// 에디터의 내용에 대한 값 검증은 이곳에서
		// document.getElementById("textAreaContent").value를 이용해서 처리한다.
		
		try {
		elClickedObj.form.submit();
		} catch(e) {
		
		}
	}
	
	// textArea에 이미지 첨부
	function pasteHTML(filepath){
		var sHTML = '<img src="${contextPath}/resources/upload/'+filepath+'">';
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
		setTimeout(function(){
			oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
			}, 10000);
	}
</script>      