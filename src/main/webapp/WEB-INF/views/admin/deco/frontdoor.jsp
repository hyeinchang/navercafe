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
               	<h1 class="h3 text-gray-800 cstmTitle">카페 대문</h1>
               	
               	<!-- cstmContent1 -->
               	<div class="cstmContent1" style="width:650px;">
               	
               		<form class="user" name="frontForm">
                        <div class="form-group">
                        	<label>카페 대문</label>
                            <textarea id="cafeFront" name="cafeFront" class="form-control" placeholder="카페 대문 내용을 입력해주십시오."></textarea>
                        </div>
                    </form>
             		
             		<div class="btnArea">
             			<a href="javascript:saveFront()" class="btn btn-primary btn-icon-split">
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
	var oEditors = [];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "cafeFront",
		sSkinURI: "${contextPath}/resources/plugin/smart_editor2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
	
	// textArea에 이미지 첨부
	function pasteHTML_custom(src, index){
		sHTML = '<img src="'+ src + '" class="tempImage" data-index="' + index + '">';
		oEditors.getById["cafeFront"].exec("PASTE_HTML", [sHTML]);
	}
	
	function saveFront() {
		updateEditorContent('cafeFront', '${contextPath}', 'front');
	}
</script>