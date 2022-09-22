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
               	
               		<form class="user" name="testForm" action="${contextPath}/admin/test/smarteditor/save" method="post">
               			<input type="hidden" name="cafeId" value="${cafeDTO.cafeId}">
                        <div class="form-group">
                        	<label>testContent</label>
                        	<div style="min-height:500px;"> <!-- smarteditor 최소 높이 설정을 위해 해당 textarea 부모 노드에 min-height 스타일 부여 -->
                        		<textarea id="testContent" name="content" class="form-control"></textarea>
                        	</div>
                        </div>
                    </form>
             		
             		<div class="btnArea">
             			<a href="javascript:saveTest_ajax()" class="btn btn-primary btn-icon-split">
                              <span class="icon text-white-50">
                                   <i class="fas fa-check"></i>
                              </span>
                              <span class="text">저장하기(비동기)</span>
                        </a>
                        <a href="javascript:saveTest()" class="btn btn-primary btn-icon-split">
                              <span class="icon text-white-50">
                                   <i class="fas fa-check"></i>
                              </span>
                              <span class="text">저장하기(동기)</span>
                        </a>
             		</div>
               	</div>
				<!-- End of cstmContent1 -->	
					
            </div>
            <!-- End of Main Content -->

<script type="text/javascript" src="${contextPath}/resources/plugin/smart_editor2/js/HuskyEZCreator.js" charset="utf-8"></script>  
<script type="text/javascript" src="${contextPath}/resources/js/smarteditor_custom.js" charset="utf-8"></script>     
<script type="text/javascript">
	var contentAreaId = 'testContent';	// 에디터를 적용할 textarea id
	var oEditors = [];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: contentAreaId,	// 에디터에 textarea id 설정
		sSkinURI: "${contextPath}/resources/plugin/smart_editor2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
	
	// textArea에 이미지 첨부
	function pasteHTML_custom(sHTML){	// 사진 첨부했을때 에디터에 바이너리로 이미지 태그 첨부
		oEditors.getById[contentAreaId].exec("PASTE_HTML", [sHTML]);
	}
	
	// 비동기 방식으로 저장
	function saveTest_ajax() {
		var testForm = document.testForm;
		var data = new Object();
		var cafeId = testForm.cafeId.value;
		var editorDirectory = 'test';
		
		// 카페아이디로 D:/navercafe/upload/test 하위에 폴더 생성(D:/navercafe/upload/ <- src/main/webapp/config/config.properties에 정의)
		/*
		* src/main/webapp/config/config.properties 내용
		# DB configure
		spring.hikariConfig.driverClassName=oracle.jdbc.driver.OracleDriver
		spring.hikariConfig.url=jdbc:oracle:thin:@localhost:1521:xe
		spring.hikariConfig.username=오라클아이디
		spring.hikariConfig.password=오라클비밀번호
		
		# file upload path
		navercafe.file.upload_path=D:/navercafe/upload
		*/
		// 에디터 이미지 저장 경로 D:/navercafe/upload/{test}/{cafeId}/{오늘 날짜(yyyymmdd)}/이미지명_yyyymmddhhmmss.확장자
		if(cafeId && cafeId.length > 0) {
			editorDirectory += '/' + cafeId;
		}
		
		// 에디터에 있은 값을 에디터 적용된 textarea(숨김 처리)에 옮김
		updateEditorContent(contentAreaId, '${contextPath}', editorDirectory);
		
		// 비동기 방식으로 보낼 객체에 값 대입
		data.cafeId = cafeId;
		data.content = testForm.testContent.value;
		
		// 객체 형태 확인
		console.log('parameter object');
		console.log(data);
		
		console.log('parameter object > stringify');
		console.log(JSON.stringify(data));
		
		/* xhr 객체 사용
		var xhr = new XMLHttpRequest();
		
		xhr.open('post', '${contextPath}/admin/test/smarteditor/saveAjax', false);
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
		
		xhr.send(JSON.stringify(data));*/
		
		
		// jquery 사용
		$.ajax({
			type : 'post'
			, url : '${contextPath}/admin/test/smarteditor/saveAjax'
			, contentType : 'application/json'
			, dataType : 'json'
			, data : JSON.stringify(data)
			, async : true
			, success : function(result) {
				if(Number(result) == 1) {
	 				message = '저장되었습니다.';
	 			} else {
	 				message = '저장에 실패했습니다.';
	 			}
	 			
	 			alert(message);
			}
		});
	}
	
	// 서브밋 방식으로 저장
	function saveTest() {
		var testForm = document.testForm;
		var cafeId = testForm.cafeId.value;
		var editorDirectory = 'test';
		
		// 카페아이디로 D:/navercafe/upload/test 하위에 폴더 생성(D:/navercafe/upload/ <- src/main/webapp/config/config.properties에 정의)
		/*
		* src/main/webapp/config/config.properties 내용
		# DB configure
		spring.hikariConfig.driverClassName=oracle.jdbc.driver.OracleDriver
		spring.hikariConfig.url=jdbc:oracle:thin:@localhost:1521:xe
		spring.hikariConfig.username=오라클아이디
		spring.hikariConfig.password=오라클비밀번호
		
		# file upload path
		navercafe.file.upload_path=D:/navercafe/upload
		*/
		// 에디터 이미지 저장 경로 D:/navercafe/upload/{test}/{cafeId}/{오늘 날짜(yyyymmdd)}/이미지명_yyyymmddhhmmss.확장자
		if(cafeId && cafeId.length > 0) {
			editorDirectory += '/' + cafeId;
		}
		
		// 에디터에 있은 값을 에디터 적용된 textarea(숨김 처리)에 옮김
		updateEditorContent(contentAreaId, '${contextPath}', editorDirectory);
		
		testForm.submit();
	}
	
</script>