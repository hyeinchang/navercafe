<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="address" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}"/>

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
               	
               		<form class="user">
                         <div class="form-group">
                        	<label>카페 대문</label>
                            <textarea id="cafeFront" name="cafeFront" class="form-control" placeholder="카페 대문 내용을 입력해주십시오."></textarea>
                        </div>
                     </form>
             		
             		<div class="btnArea">
             			<a href="#" class="btn btn-primary btn-icon-split">
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
<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "cafeFront",
		sSkinURI: "${contextPath}/resources/plugin/smart_editor2/SmartEditor2Skin.html",
		fCreator: "createSEditor2"
	});
	
	//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	function submitContents(elClickedObj) {
		// 에디터의 내용이 textarea에 적용된다.
		oEditors.getById["cafeFront"].exec("UPDATE_CONTENTS_FIELD", [ ]);
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
		oEditors.getById["cafeFront"].exec("PASTE_HTML", [sHTML]);
	}
</script>