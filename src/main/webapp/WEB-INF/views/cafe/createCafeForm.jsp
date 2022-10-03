<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

  <section class="section1 cafe_layout_area">
    <div class="container clearfix">
      <div class="">
       	<h4>
          <span>카페 만들기</span>
        </h4>
      </div>
      <div class="col-lg-12 col-md-12 col-sm-12 clearfix">

        <form id="createCafeForm" class="main_form" action="./createCafe" name="createCafeForm" method="post" enctype="multipart/form-data">
        	<input type="hidden" name="cafeIdCheck" value="N">
        	<input type="hidden" name="userId" value="${loginId}">
        	
        	<h5 class="title">카페 기본 정보</h5>
        	<div class="infoLine">
        		<label for="cafeId" class="infoLabel">카페 아이디 <span class="required">*</span></label>
          		<input type="text" name="cafeId" id="cafeId" class="form-control-inline" placeholder="카페 아이디를 입력해주십시오."
          			data-length="3~100" data-format="numAndEng" data-text="카페 아이디" 
          			onchange="changeCafeIdCheckFlag()" onkeypress="if(event.keyCode == 13)checkCafeId()">
          		<input type="button" value="중복확인" class="button" style="margin-left:10px;"
          			onclick="checkCafeId()">
        	</div>
        	<div class="infoLine">
        		<label for="cafeName" class="infoLabel">카페 이름 <span class="required">*</span></label>
          		<input type="text" name="cafeName" id="cafeName" class="form-control-inline" placeholder="카페 이름을 입력해주십시오."
          			data-length="1~200" data-format="" data-text="카페 이름">
        	</div>
        	
          	<div class="clearfix"></div>
          	<div class="divider"></div>

        	<h5 class="title">카페 추가 정보</h5>
       		<div class="infoLine">
       			<label class="infoLabel">카페 아이콘 </label>
       			<div class="SectionCreateCafeIcon">
	          		<div class="thmb">
	          	  		<span title="카페아이콘 등록">
	          		  		<img src="${contextPath}/resources/img/cafeicon_default_112x112.png" width="112" height="112" alt="카페 아이콘" id="iconImg">
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
          		
          	
        	<div class="clearfix"></div>
        	<div class="divider"></div>

        	<h5 class="title">카페 가입 정보</h5>
        	
      		<div class="infoLine">
       			<label for="cafeJoinInformation" class="infoLabel">카페 가입 안내</label>
       			<textarea id="cafeJoinInformation" name="cafeJoinInformation" class="form-control" placeholder="카페 가입 안내를 입력해주십시오." style="width:100%;"
       				data-length="0~2000" data-format="" data-text="카페 가입 정보"></textarea>
       			<ul class="infoUl">
       				<li>입력한 내용은 멤버의 카페 가입 시 안내 문구로 활용됩니다.</li>
					<li>HTML 태그는 사용하실 수 없습니다.</li>
				</ul>	
       		</div>
      		<div class="infoLine">
      			<label class="infoLabel">가입 방식</label>
      			<div class="checkArea">
      				<div>
      					<label  for="joinApplyY" >
			          		<input type="radio" id="joinApplyY" name="cafeJoinApply" value="N" checked="">
			            	<strong>가입 신청 시 바로 가입할 수 있습니다.</strong>
			       		</label>
      				</div>
      				<div>
      					<label for="joinApplyN">
			          		<input type="radio" id="joinApplyN" name="cafeJoinApply" value="Y">
			            	<strong>가입 신청 시 운영진 승인을 거쳐 가입할 수 있습니다.</strong>
			       		</label>
      				</div>
      			</div>
      		</div>
          	<div class="infoLine">
      			<label class="infoLabel">가입 질문</label>
      			<div class="checkArea">
      				<div>
      					<label for="joinQuestionY">
			          		<input type="radio" id="joinQuestionY" name="cafeJoinQuestion" value="N" checked=""
			          			onchange="showJoinQuestionInput()">
			            	<strong>가입 질문을 사용하지 않습니다.</strong>
			       		</label>
      				</div>
      				<div>
      					<label for="joinQuestionN">
			          		<input type="radio" id="joinQuestionN" name="cafeJoinQuestion" value="Y"
			          			onchange="showJoinQuestionInput()">
			            	<strong>가입 질문을 사용합니다.</strong>
			       		</label>
      				</div>
      				<div id="joinQuestionArea" style="display:none;">
	      				<ul id="joinQuestionUl" class="infoUl" style="display:none;"></ul>
	      				<button type="button" onclick="addQuestion()">
	      					<span>질문 추가하기</span>
	      				</button>
	      				<ul class="infoUl">
	      					<li>
	      						가입 질문은 3개까지 가능하며, 답변 내용은 <em>전체 멤버 관리</em>의 멤버별 상세 정보 보기에서 확인 할 수 있습니다.
	      					</li>
	                    	<li>
		                  		 카페 멤버의 개인정보(성명, 연락처, 주소, 학교, 직장명, 출생지 등)를 확인할 수 있는 질문은 타인의 사생활을 침해할 수 있으며,<br>
		                   		 카페 운영 목적과 무관하게 임의로 수집 및 이용한 개인정보는 법률적 문제가 발생할 수 있으므로 카페 가입 질문은 최소한의 내용으로 작성해주시기 바랍니다.
	                		</li>
	                	</ul>
      				</div>
      				
      			</div>
      		</div>
      		<div class="infoLine">
      			<label class="infoLabel">가입조건 성별</label>
      			<div class="checkArea">
      				<label for="joinGenderBoth" class="checkLable-inline">
		          		<input type="radio" id="joinGenderBoth" name="cafeJoinGender" value="both" checked="">
		            	<strong>모두</strong>
		       		</label>
		       		<label for="joinGenderM" class="checkLable-inline">
		          		<input type="radio" id="joinGenderM" name="cafeJoinGender" value="male">
		            	<strong>남자만</strong>
		       		</label>
		       		<label for="joinGenderF" class="checkLable-inline">
		          		<input type="radio" id="joinGenderF" name="cafeJoinGender" value="female">
		            	<strong>여자만</strong>
		       		</label>
      			</div>
      		</div>
      		
      		<div class="infoLine">
      			<label class="infoLabel">가입조건 연령</label>
      			<div class="checkArea">
      				<label for="joinAgeAll" class="checkLable-inline">
		          		<input type="radio" id="joinAgeAll" name="cafeJoinAge" value="all" checked="">
		            	<strong>모두</strong>
		       		</label>
		       		<label for="joinAgeNotAll">
			       		<input type="radio" id="joinAgeNotAll" name="cafeJoinAge" value="">
			       		<select class="form-control-inline joinAge" style="width:80px;" onchange="setJoinAgeValue()">
							<option value="">선택</option>
						</select>
						년 부터 
	          			<select class="form-control-inline joinAge" style="width:80px;" onchange="setJoinAgeValue()">
							<option value="">선택</option>
						</select>
						년 까지 출생한 사람만
					</label>
					<div>
					카페 운영 목적에 따라 "가입조건 연령"을 설정할 수 있습니다.
					이는 띠 모임, 동창 등 특정 연령(대)의 커뮤니티 활동을 지원하는 기능 입니다.<br>
					단, 음란물이나 기타 청소년에게 유해한 정보를 공유하는 것은 자제 부탁 드립니다.
					</div>
      			</div>
      		</div>
       	  
			<h5 class="title">정책동의</h5>
			<div class="infoLine">
				<label class="checkbox-inline">
                    <input id="agreeCheck" type="checkbox" value="Y">
                    <strong>카페 개인정보보호정책에 동의합니다.</strong>
                </label>
			</div>

          	<br><br>
        	<button type="button" class="button large btn-block" onclick="createCafe()">카페 만들기</button>
        </form>
      
      </div>
      <!-- end content -->
    </div>
    <!-- end container -->
  </section>
  
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
	var form = document.createCafeForm;
	
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
	var form = document.createCafeForm;
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
					return false;
				}
				
				if(length < min) {
					if(dataFormat == 'numAndEng') {
						alert(dataText.appendER() + ' ' + min + '자 이상으로 입력해주십시오.');
					} else {
						alert(dataText.appendER() + ' '+ min + ' byte 이상으로 입력해주십시오.\n * 현재 ' + length + ' byte');
					}
					
					element.focus();
					return false;
				}
				
				if(length > max) {
					if(dataFormat == 'numAndEng') {
						alert(dataText.appendER() + ' ' + max + '자 이하로 입력해주십시오.');
					} else {
						alert(dataText.appendER() + ' ' + max + '  byte 이하로 입력해주십시오.\n * 현재 ' + length + ' byte');
					}
					
					element.focus();
					return false;
				}
			}
		}
		
		// 입력 값 형식 확인
		if(dataFormat && dataFormat.length > 0) {
			if(dataFormat == 'numAndEng') {
				if(!value.isNumAndEng()) {
					alert(dataText.appendER() + ' 영문/숫자 형식으로 입력해주십시오.');
					element.focus();
					return false;
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
		return false;
	}
	
	return true;
}

// 카페 아이디 중복 확인
function checkCafeId() {
	var form = document.createCafeForm;
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
	document.createCafeForm.cafeIdCheck.value = 'N';
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
	var fileInput = document.createCafeForm.iconImage;
	
	iconImg.src = orgSrc;
	fileInput.files = null;
	fileInput.value = '';
}

function showJoinQuestionInput() {
	var form = document.createCafeForm;
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