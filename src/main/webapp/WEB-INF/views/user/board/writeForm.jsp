<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

	<div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${_cafeDTO.cafeLayout eq 'left' ? '' : 'style="float:right;"'}>
       	<section class="section1">
		    <div class="container clearfix">
		      <div class="title">
		       	<h4>
		          <span>카페 글쓰기</span>
		        </h4>
		      </div>
		    
		      <div class="col-lg-8 col-md-8 col-sm-8 clearfix">
		      	<form class="contact-form" name="writeBoardForm" role="form" action="contactform/contactform.php" method="post">
		      		<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
					<input type="hidden" name="userId" value="${_cafeDTO.loginId}">
					
		            <div class="form-group">
		            <c:if test="${_cafeDTO.isCafeManager eq 'true'}">
		            	 <div style="text-align:right;">
			              	<label>
			              		<input type="checkbox" name="boardNoticeCheck" value="Y"> 공지글
			              		<input type="hidden" name="boardNotice" value="N">
			              	</label>
		            	</div>
		            </c:if>
		            <c:if test="${_cafeDTO.isCafeManager ne 'true'}">
		           	<input type="hidden" name="boardNotice" value="N">
		            </c:if>
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
		               <input type="text" name="boardMenuName" class="form-control"
		              	data-length="1~200" data-format="" readonly value="${_cafeDTO.menuDTO.boardMenuName}">
		              </c:otherwise>
		            </c:choose>
		              
		              <div class="validate"></div>
		            </div>
		           
		            <div class="form-group">
		              <input type="text" name="boardTitle" class="form-control" placeholder="제목을 입력해주세요."
		              	data-length="1~200" data-format="">
		              <div class="validate"></div>
		            </div>
		
		            <div class="form-group">
		              <textarea class="form-control" name="boardContent" id="boardContent"></textarea>
		              <div class="validate"></div>
		            </div>
		
		            <div class="loading"></div>
		            <div class="error-message"></div>
		            <div class="sent-message">Your message has been sent. Thank you!</div>
		
		            <div class="form-send">
		              <button type="button" class="button" onclick="writeBoard()">게시글 등록</button>
		            </div>
		          </form>
				
		      </div>
		      <!-- end content -->
		    </div>
		    <!-- end container -->
		  </section>
      </div>
      <!-- end content -->
<script type="text/javascript" src="${contextPath}/resources/plugin/smart_editor2/js/HuskyEZCreator.js" charset="utf-8"></script>  
<script type="text/javascript" src="${contextPath}/resources/js/smarteditor_custom.js" charset="utf-8"></script>     
<script type="text/javascript">
	var contentAreaId = 'boardContent';
	var oEditors = [];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: contentAreaId,
		sSkinURI: "${contextPath}/resources/plugin/smart_editor2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
	
	// textArea에 이미지 첨부
	function pasteHTML_custom(sHTML){
		oEditors.getById[contentAreaId].exec("PASTE_HTML", [sHTML]);
	}
	
	function writeBoard() {
		var form = document.writeBoardForm;
		
		if(formCheck()) {
			var xhr = new XMLHttpRequest();
			var cafeId = form.cafeId.value;
			var userId = form.userId.value;
			var editorDirectory = 'board';
			var data = new Object();
			
			editorDirectory += '/' + cafeId + '/' + userId;
			
			updateEditorContent(contentAreaId, '${contextPath}', editorDirectory);
			
			data = getData();
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
	
	function formCheck() {
		var form = document.writeBoardForm;
		var boardMenuNum = form.boardMenuNum;
		var title = form.boardTitle;
		var titleLength = title.value.getBytes();
		var boardNoticeCheck = form.boardNoticeCheck;
		
		if(boardNoticeCheck && boardNoticeCheck.checked) {
			form.boardNotice.value = 'Y';
		}

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
