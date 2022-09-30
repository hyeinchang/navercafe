<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	  <div class="content pull-right col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${cafeDTO.cafeLayout > 0 ? '' : 'style="float:right;"'}>
		${cafeMember.cafeUserNickname }
		${cafeMember.userId }
		${cafeDTO.cafeId }
		  <section class="section1">
		    <div class="container clearfix">
		      <div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
		        <div class="col-lg-8 col-md-8 col-sm-8">
		          <h4 class="title">글작성</h4>
		          <div id="message"></div>
		          <form class="contact-form php-mail-form" role="form" action="write" method="POST">
						<input type="hidden" name="cafeId" value="${cafeDTO.cafeId }">
						<input type="hidden" name="userId" value="${cafeMember.userId }">
		            <div class="form-group">
		              	제목 : <input type="text" name="boardTitle" class="form-control" id="contact-subject" data-rule="minlen:4" data-msg="제목을 4자이상 입력해 주세요">
		              <div class="validate"></div>
		            </div>
		
		            <div class="form-group">
		              <textarea class="form-control" name="boardContent" id="boardContent"  rows="5" data-rule="required" data-msg="글내용을 입력해 주세요"></textarea>
		              <div class="validate"></div>
		            </div>
		
		            <div class="loading"></div>
		            <div class="error-message"></div>
		            <div class="sent-message">Your message has been sent. Thank you!</div>
		
		            <div class="form-send">
		              <button type="submit" class="btn btn-large btn-primary">글 작성</button>
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
		elPlaceHolder: "boardContent",
		sSkinURI: "${contextPath}/resources/plugin/smart_editor2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
	
	//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	function submitContents(elClickedObj) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["boardContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
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
		oEditors.getById["boardContent"].exec("PASTE_HTML", [sHTML]);
	}
</script>      