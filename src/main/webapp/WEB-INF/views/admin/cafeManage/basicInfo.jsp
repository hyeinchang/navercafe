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
			        	
			        	<div class="infoLine">
			        		<label for="cafeId" class="infoLabel">카페 주소 <span class="required">*</span></label>
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
			       				data-length="0~2000" data-format="" data-text="카페 소개"></textarea>
			       			<p>입력한 내용이 카페 메인, 검색결과등의 카페리스트에 반영 됩니다.</p>
			       		</div>	
			          		
			          	
			        	
			          	<br><br>
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
<script type="text/javascript">
document.body.onload = function() {
	setJoinAgeSelect();
}

// 가입조건 연령 select 최소와 최대 출생년도 설정
function setJoinAgeSelect() {
	var joinAgeList = document.getElementsByClassName('joinAge');

	for(var i=0;i<joinAgeList.length;i++) {
		var joinAge = joinAgeList[i];
		
		if(joinAge.length <= 1) {
			var minYear = 1950; 
			var maxYear = new Date().getFullYear();
			
			for(var y=maxYear;y>=minYear;y--) {
				var option = document.createElement('option');
				
				option.innerText = y;
				option.value =y;
				
				joinAge.appendChild(option);
			}
		}
	}
}

function setJoinAgeValue() {
	var joinAgeNotAll = document.getElementById('joinAgeNotAll');
	
	if(joinAgeNotAll.checked) { 
		var joinAgeList = document.getElementsByClassName('joinAge');
		var joinAgeMin = joinAgeList[0];
		var joinAgeMax = joinAgeList[1];
		var min = joinAgeMin.value;
		var max = joinAgeMax.value;
		
		if(min != '' && max != '') {
			if(Number(min) > Number(max)) {
				alert('가입조건 연령 최소 연도가 최대 연도보다 큽니다.');
				joinAgeMin.focus();
				return;
			}
			joinAgeNotAll.value = joinAgeMin.value + '~' + joinAgeMax.value;
		}
	}
}

function createCafe() {
	var form = document.basicCafeForm;
	
	if(!formCheck()) {
		return;
	}
	
	var xhr = new XMLHttpRequest();
	
	xhr.open('post', '${contextPath}/cafe/createCafe', true);
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			var result = JSON.parse(xhr.response);
			
			if(Number(result.resultCode) == 1) {
				location.href ='${contextPath}/user/main?cafeId='+result.cafeId;
			} else {
				alert(result.message);
			}
		}
	}
	xhr.send(new FormData(form));
}

function formCheck() {
	var form = document.basicCafeForm;
	var cafeIdCheck = form.cafeIdCheck;
	var joinAgeNotAll = document.getElementById('joinAgeNotAll');
	var cafeJoinQuestion = form.cafeJoinQuestion;
	var agreeCheck = document.getElementById('agreeCheck');
	
	if(cafeIdCheck.value != 'Y') {
		alert('카페 아이디 중복확인을 해주십시오.');
		form.cafeId.focus();
		return false;
	}
	
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
	
	// 가입 질문
	if(cafeJoinQuestion.value == 'N') {
		var joinQuestionUl = document.getElementById('joinQuestionUl');
		
		while(joinQuestionUl.children.length != 0) {
			var li = joinQuestionUl.children[i];
			var targetLi = joinQuestionUl.children[0];
			
			joinQuestionUl.removeChild(targetLi);
		}
	} else {
		var joinQuestionUl = document.getElementById('joinQuestionUl');
		
		if(joinQuestionUl.children.length == 0) {
			alert('가입 질문을 등록해주십시오.');
			document.getElementById('joinQuestionY').focus();
			return false;
		}
			
	}
	
	// 가입 연령
	if(joinAgeNotAll.checked) {
		var joinAgeList = document.getElementsByClassName('joinAge');
		var joinAgeMin = joinAgeList[0];
		var joinAgeMax = joinAgeList[1];
		var min = joinAgeMin.value;
		var max = joinAgeMax.value;
		
		if(min != '' && max != '') {
			if(Number(min) > Number(max)) {
				alert('가입조건 연령 최소 연도가 최대 연도보다 큽니다.');
				joinAgeMin.focus();
				return false;
			}
		} else {
			if(min == '') {
				alert('가입조건 연령 최소 연도를 선택해주십시오.');
				joinAgeMin.focus();
				return false;
			}
			
			if(max == '') {
				alert('가입조건 연령 최대 연도를 선택해주십시오.');
				joinAgeMax.focus();
				return false;
			}
		}
		
		joinAgeNotAll.value = joinAgeMin.value + '~' + joinAgeMax.value;
	}
	
	if(!agreeCheck.checked) {
		alert('카페 개인정보보호정책에 동의해주십시오.');
		agreeCheck.focus();
		return;
	}
	
	return true;
	
}

// 카페 아이디 중복 확인
function checkCafeId() {
	var form = document.basicCafeForm;
	var cafeId = form.cafeId;
	var xhr = new XMLHttpRequest();
	
	if(cafeId.value == '') {
		alert('카페 아이디를 입력해주십시오.');
		cafeId.focus();
		return;
	}
	
	if(!cafeId.value.isNumAndEng()) {
		alert('카페 아이디는 영문, 숫자로만 등록가능합니다.');
		cafeId.focus();
		return;
	}
	
	if(cafeId.value.getBytes() > 200) {
		alert('카페 아이디는 200자 이하로 등록가능합니다.');
		cafeId.focus();
		return;
	}
	
	xhr.open('get', '${contextPath}/cafe/checkCafeId?cafeId=' + cafeId.value);
	xhr.setRequestHeader('Content-Type', 'text/plain');
	xhr.onreadystatechange = function() {
		if(xhr.readyState == 4 && xhr.status == 200) {
			if(Number(xhr.response) > 0) {
				alert('사용할 수 없는 아이디입니다.');
				cafeId.focus();
				form.cafeIdCheck.value = 'N';
			} else {
				alert('사용가능한 아이디입니다.');
				form.cafeIdCheck.value = 'Y';
			}
		}
	}
	xhr.send();
}

function changeCafeIdCheckFlag() {
	document.basicCafeForm.cafeIdCheck.value = 'N';
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
	}	
}

function deleteIcon() {
	var iconImg = document.getElementById('iconImg');
	var orgSrc= '${contextPath}/resources/img/cafeicon_default_112x112.png';
	var fileInput = document.basicCafeForm.iconImage;
	
	iconImg.src = orgSrc;
	fileInput.files = null;
	fileInput.value = '';
}

function showJoinQuestionInput() {
	var form = document.basicCafeForm;
	var cafeJoinQuestion = form.cafeJoinQuestion;
	var joinQuestionArea = document.getElementById('joinQuestionArea');
	
	if(cafeJoinQuestion.value == 'Y') {
		joinQuestionArea.style.display = '';
	} else {
		joinQuestionArea.style.display = 'none';
	}
	
}

function addQuestion() {
	var joinQuestionUl = document.getElementById('joinQuestionUl');
	var length = joinQuestionUl.children.length;
	var maxQuestion = 3;
	var newLi = null;
	var newLabel = null;
	var newInput = null;
	var newButton = null;
	var text = '';
	
	joinQuestionUl.style.display = '';
	
	if(length == maxQuestion) {
		return;
	}
	
	newLi = document.createElement('li');
	newLabel = document.createElement('label');
	newInput = document.createElement('input');
	newButton = document.createElement('button');
	
	text = '가입 질문 ' + ++length;
	newLabel.innerText = text +'. ';
	newInput.type = 'text';
	newInput.name = 'cafeQuestionContent';
	newInput.className = 'form-control-inline';
	newInput.placeholder = text + '의 내용을 입력해주십시오.'
	newInput.dataset.text = text;
	newInput.dataset.length = '1~200';
	newInput.dataset.format = '';
	newButton.type = 'button';
	newButton.className = 'btn btn-danger';
	newButton.onclick = deleteQuestion;
	newButton.innerText = '삭제';
	
	newLi.appendChild(newLabel);
	newLi.appendChild(newInput);
	newLi.appendChild(newButton);
	
	joinQuestionUl.appendChild(newLi);
}

function deleteQuestion() {
	var joinQuestionUl = document.getElementById('joinQuestionUl');
	var targetLi = this.parentElement;
	
	joinQuestionUl.removeChild(targetLi);
	
	for(var i=0;i<joinQuestionUl.children.length;i++) {
		var li = joinQuestionUl.children[i];
		var text = li.children[0];
		var input = li.children[1];
		var order = i+1;
		
		text.innerText = text.innerText.replace(/\d/gi, order);
		input.placeholder = input.placeholder.replace(/\d/gi, order);
		input.dataset.text = input.dataset.text.replace(/\d/gi, order);
	}
}
</script>