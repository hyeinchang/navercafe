<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="editorDirectory" value="front"/>

  	<!-- Page Wrapper -->
    <div id="wrapper">
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
					
            	<!-- Page Heading -->
               	<h1 class="h3 text-gray-800 cstmTitle">smarteditor2 테스트 페이지</h1>
               	
               	<!-- cstmContent1 -->
               	<div class="cstmContent1" style="width:800px;">
               	
               		<form class="user" name="testForm">
               			<input type="hidden" name="cafeId" value="${cafeDTO.cafeId}">
                        <div class="form-group">
                        	<label>카페 대문</label>
                        	<div style="min-height:500px;"> <!-- smarteditor 최소 높이 설정을 위해 해당 textarea 부모 노드에 min-height 스타일 부여 -->
                        		<textarea id="testContent" name="testContent" class="form-control"></textarea>
                        	</div>
                        </div>
                    </form>
             		
             		<div class="btnArea">
             			<a href="javascript:saveTest()" class="btn btn-primary btn-icon-split">
                              <span class="icon text-white-50">
                                   <i class="fas fa-check"></i>
                              </span>
                              <span class="text">저장하기</span>
                        </a>
             		</div>
               	</div>
				<!-- End of cstmContent1 -->	
					
            </div>
            <!-- End of Main Content -->

<script type="text/javascript" src="${contextPath}/resources/plugin/smart_editor2/js/HuskyEZCreator.js" charset="utf-8"></script>  
<script type="text/javascript" src="${contextPath}/resources/js/smarteditor_custom.js" charset="utf-8"></script>     
<script type="text/javascript">
	var contentAreaId = 'cafeFront';
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
	
	// 카페 대문 저장
	function saveTest() {
		var testForm = document.testForm;
		var xhr = new XMLHttpRequest();
		var data = new Object();
		var cafeId = testForm.cafeId.value;
		var editorDirectory = 'test';
		
		if(cafeId && cafeId.length > 0) {
			editorDirectory += '/' + cafeId;
		}
		
		updateEditorContent(contentAreaId, '${contextPath}', editorDirectory);
		
		data.cafeId = cafeId;
		data.cafeFront = testForm.cafeFront.value;
		
		xhr.open('post', '${contextPath}/admin/test/smarteditor/save', false);
		xhr.setRequestHeader('Content-Type', 'application/json');
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
	 			var data = JSON.parse(xhr.response);
	 			var message = '';
	 			
	 			if(data.result == 1) {
	 				message = '저장되었습니다.';
	 			} else {
	 				message = '저장에 실패했습니다.';
	 			}
	 			
	 			alert(message);
			}
		}
		
		xhr.send(JSON.stringify(data));
	}
	
	function deleteFront() {
		
	}
</script>