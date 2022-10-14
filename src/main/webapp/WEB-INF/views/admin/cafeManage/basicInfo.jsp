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
               	<h1 class="h3 text-gray-800 cstmTitle">기본정보</h1>
               	
               	<!-- cstmContent1 -->
               	<div class="cstmContent1 cafe_layout_area">
               		<form id="basicCafeForm" class="main_form" action="./createCafe" name="basicCafeForm" method="post" enctype="multipart/form-data">
			        	<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
			        	<input type="hidden" name="cafeIconNum" value="${_cafeDTO.cafeIconNum}">
			        	<input type="hidden" name="iconDelete" value="N">
			        	
			        	<div class="infoLine">
			        		<label for="cafeId" class="infoLabel">카페 주소</label>
			          		${address}/main?cafeId=<span id="cafeIdTxt">${_cafeDTO.cafeId}</span>
			        	</div>
			        	<div class="infoLine">
			        		<label for="cafeName" class="infoLabel">카페 이름 <span class="required">*</span></label>
			          		<input type="text" name="cafeName" id="cafeName" class="form-control-inline" placeholder="카페 이름을 입력해주십시오."
			          			data-length="1~200" data-format="" data-text="카페 이름" value="${_cafeDTO.cafeName}">
			        	</div>
			        	
			       		<div class="infoLine">
			       			<label class="infoLabel">카페 아이콘 </label>
			       			<div class="SectionCreateCafeIcon">
				          		<div class="thmb">
				          	  		<span title="카페아이콘 등록">
				          	  		<c:choose>
				          	  			<c:when test="${_cafeDTO.cafeIconNum eq null || _cafeDTO.cafeIconNum == 0}">
				          	  			<img src="${contextPath}/resources/img/cafeicon_default_112x112.png" width="112" height="112" alt="카페 아이콘" id="iconImg">
				          	  			</c:when>
				          	  			<c:otherwise>
				          	  			<img src="${contextPath}/file/download?cafeIconNum=${_cafeDTO.cafeIconNum}" width="112" height="112" alt="카페 아이콘" id="iconImg">
				          	  			<input type="hidden" value="${_cafeDTO.cafeIconNum}" name="cafeIconNum">
				          	  			</c:otherwise>
				          	  		</c:choose>
				          			</span>
				          			<div style="display:inline-block;margin-left:20px;vertical-align:top;">
				          				<div>우리 카페를 표현할 카페 아이콘을 등록해주세요.<br>
										등록하신 아이콘은 카페에서 활용됩니다.<br>
										</div><br>
										<div>
											<input type="file" name="iconImage" class="form-control-inline" onchange="previewIcon()">
											<button type="button" class="btn btn-danger" onclick="deleteIcon()">삭제</button>
										</div>
				          			</div>
				          		</div>
							</div>
			       		</div>
			       	
			       		<div class="infoLine">
			       			<label for="cafeExplanation" class="infoLabel">카페 소개 </label>
			       			<textarea id="cafeExplanation" name="cafeExplanation" class="form-control" placeholder="카페 소개를 입력해주십시오." style="width:100%;"
			       				data-length="0~2000" data-format="" data-text="카페 소개">${_cafeDTO.cafeExplanation}</textarea>
			       			<p>입력한 내용이 카페 메인, 검색결과등의 카페리스트에 반영 됩니다.</p>
			       		</div>	
			          	
			        	<div class="infoLine">
			      			<label class="infoLabel">가입 방식</label>
			      			<div class="checkArea">
			      				<div>
			      					<label  for="joinApplyY" >
						          		<input type="radio" id="joinApplyY" name="cafeJoinApply" value="N"${_cafeDTO.cafeJoinApply eq 'N' ? ' checked' : ''}>
						            	<span>가입 신청 시 바로 가입할 수 있습니다.</span>
						       		</label>
			      				</div>
			      				<div>
			      					<label for="joinApplyN">
						          		<input type="radio" id="joinApplyN" name="cafeJoinApply" value="Y"${_cafeDTO.cafeJoinApply eq 'Y' ? ' checked' : ''}>
						            	<span>가입 신청 시 운영진 승인을 거쳐 가입할 수 있습니다.</span>
						       		</label>
			      				</div>
			      			</div>
			      		</div>
			        </form>
               		
             		<div class="btnArea">
             			<a href="javascript:saveCafeBasic()" class="btn btn-primary btn-icon-split">
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
function saveCafeBasic() {
	var form = document.basicCafeForm;
	
	if(!formCheck()) {
		return;
	}
	
	var xhr = new XMLHttpRequest();
	
	xhr.open('post', '${contextPath}/admin/saveCafeBasic', true);
	xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			if(Number(xhr.response) == 1) {
				alert('저장되었습니다.');
			} else {
				alert('저장에 실패했습니다.');
			}
		}
	}
	xhr.send(new FormData(form));
}

function formCheck() {
	var form = document.basicCafeForm;
	
	for(var i=0;i<form.length;i++) {
		var element = form[i];
		
		if(!element.name) {
			continue;
		}
		
		var value = element.value;
		var dataLength = element.dataset.length;
		var dataText = element.dataset.text;
		var dataFormat = element.dataset.format;
		
		// 입력 값 문자 길이 확인
		if(dataLength && dataLength.length > 0) {
			if(dataLength.indexOf('~') > -1) {
				var range = dataLength.split('~');
				var min = Number(range[0]);
				var max = Number(range[1]);
				var length = value.getBytes();
	
				if(min > 0 && length == 0) {
					alert(dataText.appendER() + ' 입력해주십시오.');
					element.focus();
					return;
				}
				
				if(length < min) {
					if(dataFormat == 'numAndEng') {
						alert(dataText.appendER() + ' ' + min + '자 이상으로 입력해주십시오.');
					} else {
						alert(dataText.appendER() + ' '+ min + ' byte 이상으로 입력해주십시오.\n * 현재 ' + length + ' byte');
					}
					
					element.focus();
					return;s
				}
				
				if(length > max) {
					if(dataFormat == 'numAndEng') {
						alert(dataText.appendER() + ' ' + max + '자 이하로 입력해주십시오.');
					} else {
						alert(dataText.appendER() + ' ' + max + '  byte 이하로 입력해주십시오.\n * 현재 ' + length + ' byte');
					}
					
					element.focus();
					return;s
				}
			}
		}
		
		// 입력 값 형식 확인
		if(dataFormat && dataFormat.length > 0) {
			if(dataFormat == 'numAndEng') {
				if(!value.isNumAndEng()) {
					alert(dataText.appendER() + ' 영문/숫자 형식으로 입력해주십시오.');
					element.focus();
					return;
				}
			}
		}
		
	} // for
	
	return true;
	
}

function previewIcon() {
	var fileInput = event.target;
	var file = fileInput.files[0];
	
	if(file.type.indexOf('image') < 0) {
		alert('이미지 파일이 아닙니다.');
		fileInput.files = null;
		fileInput.value = '';
		fileInput.focus();
	} else {
		var iconImg = document.getElementById('iconImg');
		var fileReader = new FileReader();
		
		fileReader.readAsDataURL(file);
		fileReader.onload = function() {
			iconImg.src = fileReader.result;
		}
		document.basicCafeForm.iconDelete.value = 'N';
	}	
}

function deleteIcon() {
	var iconImg = document.getElementById('iconImg');
	var orgSrc= '${contextPath}/resources/img/cafeicon_default_112x112.png';
	var fileInput = document.basicCafeForm.iconImage;
	
	iconImg.src = orgSrc;
	fileInput.files = null;
	fileInput.value = '';
	document.basicCafeForm.iconDelete.value = 'Y';
}
</script>