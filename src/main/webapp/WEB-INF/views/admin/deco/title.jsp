<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="skinLocation" value="${contextPath}/resources/img/sample/skin"/>
<style>
#fileArea, .preview > .noImage {height: 300px; border: 1px solid #e3e6f0; margin: 0 auto; background: #fff;  border-radius: 10px; padding-top:20px;color: #ddd;}
#fileArea p, .preview > .noImage p {font-size: 30px; width: 100%; text-align: center; font-weight: bold;}
#textArea {width: 800px; height: 300px; border: 1px solid black; margin: 15px auto; background: #fff; overflow: auto;}
#uploadArea {width: 800px; height: 200px; border: 1px solid black; margin: 15px auto; background: #fff; overflow: auto;}
.fileDataUl {padding : 0;}
.fileDataUl>li {list-style : none;}
.previewArea {width:100%; max-height: 500px;overflow:auto;}
.previewArea > div {display: inline-block;width:500px;vertical-align:top;}
.previewArea > div:not(:last-child) {margin-right:20px;}
.previewArea img {width:500px;}

span.pointer1 {display:inline-block;}
span.pointer1::after {content: "";width: 20px;height: 5px; background: #000; display: inline-block;margin: -3px 0 0 -5px; vertical-align: middle;}
span.pointer1::before {content: "";display: inline-block;  border-top: 6px solid transparent;border-right: 14px solid #000; border-bottom: 6px solid transparent; }
</style>

  	<!-- Page Wrapper -->
    <div id="wrapper">
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
					
            	<!-- Page Heading -->
               	<h1 class="h3 text-gray-800 cstmTitle">카페 타이틀</h1>
               	<p class="mb-4">이미지 최적 사이즈는 가로 1140px, 세로 50~340px 입니다.</p>
              
               	<!-- cstmContent1 -->
               	<div class="cstmContent1" style="width:1200px;">
               	
               		<form name="titleForm">
               			<input type="hidden" name="cafeId" value="${cafeDTO.cafeId}">
               			<div class="card mb-4">
							<div class="card-header">
								<b>카페 타이틀 이미지 업로드</b>
							</div>
							<div class="card-body">
								<div class="form-group">
		                    		<div class="previewArea">
			               				<div class="preview">
			               					<h3>미리보기</h3>
			               					<!-- <img src="${cafeDTO.cafeTitle}"> -->
			               					<div class="noImage">
									            <p>등록된 이미지가 없습니다.</p>
									        </div>
			               				</div>
               			
			               				<div class="fileUpload">
			               					<h3>파일업로드</h3>
			               					 <div id="fileArea">
									            <p>파일 드래그 영역</p>
									        </div>
			               				</div>
               						</div>
	                       		</div>
							</div>
						</div>
               			
				       
				        <div id="textArea"></div>
				        <div id="uploadArea"></div>
    					
       				</form>
       				
       				<div class="btnArea">
             			<a href="javascript:saveSkin()" class="btn btn-primary btn-icon-split">
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
             
<script type="text/javascript">
var dragFileList = new Array();
var dragTarget = null;
var fileArea = document.getElementById('fileArea');
console.log(fileArea);

fileArea.ondragover = function(e) {
	e.preventDefault();
	this.style.background = '#cdf';
	this.style.color = '#fff';
	
	 var files = e.dataTransfer.files.length > 0 && e.dataTransfer.files;
	 console.log(e.dataTransfer.files);
}

fileArea.ondrop = function(e) {
	e.preventDefault();
	//console.log(event);
}

fileArea.ondragleave = function(e) {
	this.style.background = '';
	this.style.color = '';
	e.preventDefault();
	console.log('....2');
	//console.log(event);
}
</script>           
