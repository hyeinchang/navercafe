<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<<<<<<< HEAD
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
=======
	<div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${_cafeDTO.cafeLayout eq 'left' ? '' : 'style="float:right;"'}>
       	<section class="section1">
		    <div class="container clearfix">
		      <div class="title">
		       	<h4>
		          <span>카페 글쓰기</span>
		        </h4>
		      </div>
		      <br>
		      <div class="col-lg-8 col-md-8 col-sm-8 clearfix">
		      	<form class="contact-form" name="writeBoardForm" role="form" action="contactform/contactform.php" method="post">
		      		<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
					<input type="hidden" name="userId" value="${_cafeDTO.loginId}">
					
		            <div class="form-group">
		            <c:choose>
		              <c:when test="${_cafeDTO.menuDTO.boardMenuNum eq null ||  _cafeDTO.menuDTO.boardMenuNum == 0}">
		              <select class="form-control" name="boardMenuNum" 
		              	style="padding: 10px 12px;height: auto;cursor:pointer;"
		              	onchange="checkBoardType()">
		              	<option value="">게시판을 선택해주세요.</option>
		              	<c:forEach var="boardType" items="${_cafeDTO.cafeMenuList}">
		              	<c:if test="${boardType.boardWriteAuth <= _cafeDTO.loginUser.cafeUserGrade 
		              		&& boardType.boardMenuType ne 4}">
		              	<option value="${boardType.boardMenuNum}" 
		              		data-board-type="${boardType.boardMenuType}">${boardType.boardMenuName}</option>
		              	</c:if>
		              	</c:forEach>
		              </select>
		              </c:when>
		              <c:otherwise>
		               <input type="hidden" name="boardMenuNum" value="${_cafeDTO.menuDTO.boardMenuNum}">
		               <input type="text" name="boardMenuName" class="form-control" placeholder="제목을 입력해주세요."
		              	data-length="1~200" data-format="" readonly value="${_cafeDTO.menuDTO.boardMenuName}">
		              </c:otherwise>
		            </c:choose>
		             
		              <div class="validate"></div>
		            </div>
		           
		            <div class="form-group">
		              <input type="text" name="boardTitle" class="form-control" placeholder="제목을 입력해주세요."
		              	data-length="1~200" data-format="">
>>>>>>> a70101aa115492857243e689061e99c2eeaaacd2
		              <div class="validate"></div>
		            </div>
		
		            <div class="form-group">
<<<<<<< HEAD
		              <textarea class="form-control" name="boardContent" id="boardContent"  rows="5" data-rule="required" data-msg="글내용을 입력해 주세요"></textarea>
=======
		              <textarea class="form-control" name="boardContent" id="boardContent"></textarea>
>>>>>>> a70101aa115492857243e689061e99c2eeaaacd2
		              <div class="validate"></div>
		            </div>
		
		            <div class="loading"></div>
		            <div class="error-message"></div>
		            <div class="sent-message">Your message has been sent. Thank you!</div>
		
		            <div class="form-send">
<<<<<<< HEAD
		              <button type="submit" class="btn btn-large btn-primary">글 작성</button>
=======
		              <button type="button" class="button" onclick="writeBoard()">게시글 등록</button>
>>>>>>> a70101aa115492857243e689061e99c2eeaaacd2
		            </div>
		          </form>
<<<<<<< HEAD
		        </div>
		
		
		        <div class="clearfix"></div>
		        <div class="divider"></div>
=======
				
>>>>>>> a70101aa115492857243e689061e99c2eeaaacd2
		      </div>
		      <!-- end content -->
		    </div>
		    <!-- end container -->
		  </section>
<<<<<<< HEAD
 	  </div>
=======
      </div>
>>>>>>> a70101aa115492857243e689061e99c2eeaaacd2
      <!-- end content -->
<script type="text/javascript" src="${contextPath}/resources/plugin/smart_editor2/js/HuskyEZCreator.js" charset="utf-8"></script>  
<script type="text/javascript" src="${contextPath}/resources/js/smarteditor_custom.js" charset="utf-8"></script>     
<script type="text/javascript">
	var contentAreaId = 'boardContent';
	var oEditors = [];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
<<<<<<< HEAD
		elPlaceHolder: "boardContent",
=======
		elPlaceHolder: contentAreaId,
>>>>>>> a70101aa115492857243e689061e99c2eeaaacd2
		sSkinURI: "${contextPath}/resources/plugin/smart_editor2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
	
<<<<<<< HEAD
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
=======
	// textArea에 이미지 첨부
	function pasteHTML_custom(sHTML){
		oEditors.getById[contentAreaId].exec("PASTE_HTML", [sHTML]);
	}
	
	function writeBoard() {
		var form = document.writeBoardForm;
>>>>>>> a70101aa115492857243e689061e99c2eeaaacd2
		
		if(formCheck()) {
			var xhr = new XMLHttpRequest();
			var cafeId = form.cafeId.value;
			var userId = form.userId.value;
			var editorDirectory = 'board';
			var data = getData();
			
			editorDirectory += '/' + cafeId + '/' + userId;
			
			updateEditorContent(contentAreaId, '${contextPath}', editorDirectory);
			
			xhr.open('post', '${contextPath}/user/board/writeBoard', false);
			xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
			xhr.setRequestHeader('Content-Type', 'application/json');
			
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200) {
		 			var message = '';
		 			
		 			if(Number(xhr.response) == 1) {
		 				location.href = '${contextPath}/user/board/goBoardList?cafeId=' + cafeId + '&boardMenuNum=' + data.boardMenuNum;
		 			} else {
		 				alert('저장에 실패했습니다.');
		 			}
				}
			}
			
			xhr.send(JSON.stringify(data));
		}
	}
	
<<<<<<< HEAD
	// textArea에 이미지 첨부
	function pasteHTML(filepath){
		var sHTML = '<img src="${contextPath}/resources/upload/'+filepath+'">';
		oEditors.getById["boardContent"].exec("PASTE_HTML", [sHTML]);
=======
	function formCheck() {
		var form = document.writeBoardForm;
		var boardMenuNum = form.boardMenuNum;
		var title = form.boardTitle;
		var titleLength = title.value.getBytes();
		

		if(boardMenuNum.value == '') {
			alert('게시판을 선택해주십시오.');
			boardMenuNum.focus();
			return false;
		}
		
		if(titleLength == 0) {
			alert('제목을 입력해주십시오.');
			title.focus();
			return false;
		}
		
		if(titleLength > 200) {
			alert('제목을 200 byte 이하로 입력해주십시오.\n * 현재 ' + titleLength + ' byte');
			title.focus();
			return false;
		}
		
		return true;
>>>>>>> a70101aa115492857243e689061e99c2eeaaacd2
	}
	
	function checkBoardType() {
		var form = document.writeBoardForm;
		var boardMenuNum = form.boardMenuNum;
		var boardType = 0;
		
		for(var i=0;i<boardMenuNum.length;i++) {
			var option = boardMenuNum[i];
			
			if(option.selected) {
				boardType = option.dataset.boardType;
				break;
			}
		}
		
		console.log(boardType);
	}
	
	function getData() {
		var form = document.writeBoardForm;
		var data = new Object();
		
		for(var i=0;i<form.length;i++) {
			var element = form[i];
			
			if(element.name && element.value) {
				data[element.name] = element.value;
			}
		}
		
		return data;
	}
</script>	      