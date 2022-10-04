<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

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
               	<div class="cstmContent1" style="">
               	
               		<form name="titleForm">
               			<input type="hidden" name="cafeId" value="${cafeDTO.cafeId}">
               			<input type="hidden" name="cafeTitleNum" value="${cafeDTO.cafeTitleNum}">
               			<div class="card mb-4">
							<div class="card-header">
								<b>카페 타이틀 이미지 업로드</b>
							</div>
							<div class="card-body" id="fileArea">
								<div class="form-group">
		                    		<div class="previewArea">
			               				<div class="fileUpload">
			               					<div title="업로드하실 파일을 드래그해주십시오.">
									            <span class="fileAdd">+</span>
									        </div>
									        <input type="file" id="titleImage" name="titleImage" onchange="previewImage()">
			               				</div>
			               				
			               				<div class="preview">
			               					<c:choose>
			               						<c:when test="${cafeDTO.cafeTitleNum ne null && cafeDTO.cafeTitleNum > 0}">
										    	<img src="${contextPath}/file/download?cafeTitleNum=${cafeDTO.cafeTitleNum}" id="previewImg">
				               					</c:when>
				               					<c:otherwise>
				               					<img src="" id="previewImg" style="display:none;">
				               					</c:otherwise>
			               					</c:choose>
			               				</div>
               						</div>
	                       		</div>
							</div>
						</div>
       				</form>
       				
       				<div class="btnArea">
             			<a href="javascript:saveTitle()" class="btn btn-primary btn-icon-split">
                              <span class="icon text-white-50">
                                   <i class="fas fa-check"></i>
                              </span>
                              <span class="text">저장하기</span>
                         </a>
						<c:if test="${cafeDTO.cafeTitleNum ne null && cafeDTO.cafeTitleNum > 0}">
						<a href="javascript:deleteTitle()" class="btn btn-danger btn-icon-split">
                              <span class="icon text-white-50">
                                   <i class="fas fa-trash"></i>
                              </span>
                              <span class="text">타이틀삭제</span>
                        </a>
						</c:if>
             		</div>
               	</div>
				<!-- End of cstmContent1 -->	
					
            </div>
            <!-- End of Main Content -->
      		
<script type="text/javascript">
document.body.onload = setFileAreaEvent;

// 카페 타이틀 저장
function saveTitle() {
	var titleForm = document.titleForm;
	var titleImage = document.getElementById('titleImage');
	var xhr = new XMLHttpRequest();
	
	if(titleImage.files.length == 0) {
		alert('타이틀 이미지 파일을 등록해주십시오.');
		return;
	}
	
	xhr.open('post', '${contextPath}/admin/deco/saveTitle', true);
	xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200) {
 			var message = '';
 			
 			if(Number(xhr.response) == 1) {
 				message = '저장되었습니다.';
 				location.reload();
 			} else {
 				message = '저장에 실패했습니다.';
 			}
 			
 			alert(message);
		}
	}
	
	xhr.send(new FormData(titleForm));
}

//카페 타이틀 삭제
function deleteTitle() {
	var titleForm = document.titleForm;
	
	titleForm.action = '${contextPath}/admin/deco/deleteTitle';
	titleForm.method = 'post';
	titleForm.submit();
}

//드래그 파일 영역에 이벤트 설정
function setFileAreaEvent() {
 	var fileArea = document.getElementById('fileArea');

 	// 파일 드래그 영역에 파일이 들어왔을 때
 	fileArea.ondragover = function() {
     	event.preventDefault();
	}

 	// 파일 드래그 영역에 파일을 드롭했을 때
 	fileArea.ondrop = function() {
     	event.preventDefault();
     	saveDragFiles(event.dataTransfer.files);
 	}
}

//이미지 미리보기
function previewImage() {
	var titleImage = document.getElementById('titleImage');
	
	if(validateFile(titleImage.files)) {
		var imageFile = titleImage.files[0];
		var fileReader = new FileReader();
		
		fileReader.readAsDataURL(imageFile);
		fileReader.onload = function() {
	 		var previewImg = document.getElementById('previewImg');
			
	 		previewImg.style.display = '';
			previewImg.src = fileReader.result;
			previewImg.alt = imageFile.name;
		}
	} else {
		titleImage.files = null;
		titleImage.value = '';
	}
}

//드래그 파일 영역에 드롭된 파일을 input에 저장
function saveDragFiles(files) {
	if(validateFile(files)) {
    	var titleForm = document.titleForm;
    	var titleImage = titleForm.titleImage;
    	
    	file = files[0];
     	titleImage.files = files;
     	previewImage();
 	}
}

//드롭한 파일 유효성 확인
function validateFile(files) {
	var file = null;
	
	// 파일여부 확인
	if(!files || files.length == 0) {
		alert('파일이 아닙니다.');
	    return false;
	}

	// 한 개의 파일만 업로드
	if(files.length > 1) {
		alert('한개의 파일만 업로드할 수 있습니다.');
		return false;
	}

	file = files[0];

	// 이미지 파일만 업로드
	if(file.type.toLowerCase().indexOf('image') < 0) {
		alert('이미지 파일이 아닙니다.');
		return false;
	}
	
	return true;
}
</script>           
