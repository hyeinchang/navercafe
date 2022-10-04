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
               	<h1 class="h3 text-gray-800 cstmTitle">메뉴 관리</h1>
              
               	<!-- cstmContent1 -->
               	<div class="cstmContent1" style="">
               	
               		<!-- menuFormArea -->
               		<div class="menuFormArea">
               			
         				<!-- menuFormArea > menuChoice  -->
               			<div class="card mb-4 menuChoice">
							<div class="card-header">
								<b>메뉴 선택</b>
							</div>
							<div class="card-body">
		                    	<ul id="leftMenuUl">
		                    	<c:forEach var="menuType" items="${menuTypeList}">
		                    		<c:set var="typeClass"/>
		                    		<c:choose>
		                    			<c:when test="${menuType.boardMenuType eq 1}">
		                    				<c:set var="typeClass" value="ge_v1"/>
		                    			</c:when>
		                    			<c:when test="${menuType.boardMenuType eq 2}">
		                    				<c:set var="typeClass" value="ge_v13"/>
		                    			</c:when>
		                    			<c:when test="${menuType.boardMenuType eq 3}">
		                    				<c:set var="typeClass" value="ge_v6"/>
		                    			</c:when>
		                    			<c:when test="${menuType.boardMenuType eq 4}">
		                    				<c:set var="typeClass" value="ge_v7"/>
		                    			</c:when>
		                    			<c:when test="${menuType.boardMenuType eq 5}">
		                    				<c:set var="typeClass" value="ge_v8"/>
		                    			</c:when>
		                    			<c:when test="${menuType.boardMenuType eq 6}">
		                    				<c:set var="typeClass" value="ge_v9"/>
		                    			</c:when>
		                    		</c:choose>
		                    		<li class="${typeClass}">
		                    			<span>
		                    			<a href="javascript:showMenuInfo(${menuType.boardMenuType})" title="메뉴 설명 보기">${menuType.boardMenuName}</a>
		                    			<a href="javascript:addRight(${menuType.boardMenuType})" class="btn btn-success btn-icon-split">
                                			<span class="icon text-white-50">
                                    			<i class="fas">+</i>
                                			</span>
                                			<span class="text">추가</span>
                         				</a>
		                    			</span>
		                    			<input type="hidden" name="boardMenuName" value="${menuType.boardMenuName}">
		                    			<input type="hidden" name="boardMenuNum" value="">
		                    			<input type="hidden" name="boardMenuDesc" value="${menuType.boardMenuDesc}">
		                    			<input type="hidden" name="boardMenuType" value="${menuType.boardMenuType}">
		                    			<input type="hidden" name="boardWriteAuth" value="0">
		                    			<input type="hidden" name="boardReplyAuth" value="0">
		                    			<input type="hidden" name="boardReadAuth" value="0">
		                    			<input type="hidden" name="boardOrder" value="">
		                    			<input type="hidden" name="boardLikesFlag" value="Y">
		                    			<input type="hidden" name="boardReplyFlag" value="Y">
		                    			<input type="hidden" name="boardPrefixesFlag" value="N">
		                    			<input type="hidden" name="boardPublicFlag" value="Y">
		                    			<input type="hidden" name="delFlag" value="N">
		                    		</li>
		                    	</c:forEach>
		                    	</ul>	
							</div>
						</div>
						<!-- end menuFormArea > menuChoice  -->
						
						<!-- menuFormArea > rightBox  -->
						<div class="rightBox">
							<!-- rightBox > rightMenu -->
							<div class="rightMenu">
							
								<!--  menuForm -->
								<form name="menuForm">
									<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
									<ul id="rightMenuUl">
									<c:forEach var="menu" items="${_cafeDTO.cafeMenuList}" varStatus="status">
			                    		<c:set var="typeClass"/>
			                    		<c:set var="order" value="${status.index+1}"/>
			                    		<c:choose>
			                    			<c:when test="${menu.boardMenuType eq 1}">
			                    				<c:set var="typeClass" value="ge_v1"/>
			                    			</c:when>
			                    			<c:when test="${menu.boardMenuType eq 2}">
			                    				<c:set var="typeClass" value="ge_v13"/>
			                    			</c:when>
			                    			<c:when test="${menu.boardMenuType eq 3}">
			                    				<c:set var="typeClass" value="ge_v6"/>
			                    			</c:when>
			                    			<c:when test="${menu.boardMenuType eq 4}">
			                    				<c:set var="typeClass" value="ge_v7"/>
			                    			</c:when>
			                    			<c:when test="${menu.boardMenuType eq 5}">
			                    				<c:set var="typeClass" value="ge_v8"/>
			                    			</c:when>
			                    			<c:when test="${menu.boardMenuType eq 6}">
			                    				<c:set var="typeClass" value="ge_v9"/>
			                    			</c:when>
			                    		</c:choose>
			                    		<li class="${typeClass}" title="드래그하여 메뉴 순서 변경 가능" onclick="showMenuInfoForm()"
			                    			draggable="true" ondragover="dragoverMenu()" ondragleave="dragleaveMenu()" ondragstart="saveMoveManu()" ondrop="changeMenuOder()">
			                    			<span>${menu.boardMenuName}</span>
				                    		<a href="javascript:deleteRightMenu(${order})" id="delMenuBtn_${order}"  class="btn btn-danger btn-icon-split">
		                                        <span class="icon text-white-50">
		                                            <i class="fas fa-trash"></i>
		                                        </span>
		                                        <span class="text">삭제</span>
		                                    </a>
		                                    <input type="hidden" name="boardMenuName" value="${menu.boardMenuName}">
			                    			<input type="hidden" name="boardMenuNum" value="${menu.boardMenuNum}">
			                    			<input type="hidden" name="boardMenuDesc" value="${menu.boardMenuDesc}">
			                    			<input type="hidden" name="boardMenuType" value="${menu.boardMenuType}">
			                    			<input type="hidden" name="boardWriteAuth" value="${menu.boardWriteAuth}">
			                    			<input type="hidden" name="boardReplyAuth" value="${menu.boardReplyAuth}">
			                    			<input type="hidden" name="boardReadAuth" value="${menu.boardReadAuth}">
			                    			<input type="hidden" name="boardOrder" value="${order}">
			                    			<input type="hidden" name="boardLikesFlag" value="${menu.boardLikesFlag}">
			                    			<input type="hidden" name="boardReplyFlag" value="${menu.boardReplyFlag}">
			                    			<input type="hidden" name="boardPrefixesFlag" value="${menu.boardPrefixesFlag}">
			                    			<input type="hidden" name="boardPublicFlag" value="${menu.boardPublicFlag}">
			                    			<input type="hidden" name="delFlag" value="N">
			                    		</li>
			                    	</c:forEach>
									</ul>
								</form>
								<!-- end menuForm -->
								
							</div>
							<!-- end rightBox > rightBox -->
							
							<!-- rightBox > typeInfoArea -->
							<div class="typeInfoArea">
								<div class="set_box typeInfo active">
									<h3 class="set_tit">메뉴 설정 안내</h3>
									<ul class="set_lst_type">
										<li>드래그 앤 드롭으로 게시판 순서를 변경할 수 있습니다.</li>
										<li><span style="color:#4e73df;!important">메뉴를 편집한 후에 저장하기 버튼을 꼭 클릭해야 	변경된 내용이 메뉴에 반영됩니다.</span></li>
									</ul>
								</div>
								<div class="set_box typeInfo" id="typeInfo_1">
									<h3 class="set_tit">통합게시판</h3>
   									<ul class="set_lst_type">
   										<li>용도에 따라 다양한 형태로 사용 가능한 일반 게시판입니다.</li>
   										<li>공지게시판으로 사용하려면 글쓰기 권한을 스탭 이상으로 설정하세요.</li>
   									</ul>
   									<div class="detail_area" id="typeInput_1"></div>
    							</div>
    							<div class="set_box typeInfo" id="typeInfo_2">
    								<h3 class="set_tit">간편게시판</h3>
    								<ul class="set_lst_type">
    									<li>간편하고 빠르게 게시글을 작성할 수 있는 게시판입니다.</li>
    									<li>제목 입력이 필요없는 게시판으로 본문 일부가 제목이 됩니다.</li>
    								</ul>
    								<div class="detail_area" id="typeInput_2"></div>
    							</div>
    							<div class="set_box typeInfo" id="typeInfo_3">
    								<h3 class="set_tit">스탭게시판</h3>
    								<p class="set_p_type">매니저와 스탭만 읽고 쓸 수 있는 게시판입니다.</p>
    								<div class="detail_area" id="typeInput_3"></div>
    							</div>
    							<div class="set_box typeInfo" id="typeInfo_4">
    								<h3 class="set_tit">등업게시판</h3>
    								<p class="set_p_type">멤버들의 등업신청을 한눈에 보고 관리(수락/거절)할 수 있는 게시판입니다.</p>
    								<div class="detail_area" id="typeInput_4"></div>
    							</div>
    							<div class="set_box typeInfo" id="typeInfo_5">
    								<h3 class="set_tit">메모게시판</h3>
    								<ul class="set_lst_type">
    									<li>카페 가입인사나 짧은 메모를 남기는데 가장 적합한 형태입니다.</li>
    									<li>멤버에게만 공개를 체크하시면 가입멤버에게만 보입니다.</li>
    								</ul>
    								<div class="detail_area" id="typeInput_5"></div>
    							</div>
    							<div class="set_box typeInfo" id="typeInfo_6">
    								<h3 class="set_tit">출석부</h3>
    								<ul class="set_lst_type">
    									<li>날짜별로 출석체크를 할 수 있는 게시판입니다.</li>
    									<li>카페당 1개씩 가능하며, 출석미션 등록도 가능합니다.</li>
    									<li>멤버에게만 공개를 체크하시면 가입멤버에게만 보입니다.</li>
    								</ul>
    								<div class="detail_area" id="typeInput_6"></div>
    							</div>
							</div>
							<!-- end rightBox > typeInfoArea -->
							
						</div>
						<!-- end menuFormArea > rightBox  -->
						
       				</div>
       				<!-- end menuFormArea -->
       				
       				<div class="btnArea">
             			<a href="javascript:saveBoardMenu()" class="btn btn-primary btn-icon-split">
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
// 저장하기
function saveBoardMenu() {
	var form = document.menuForm;
	form.action = '${contextPath}/admin/menu/saveBoardMenu';
	form.method = 'post';
	form.submit();
}
// 메뉴 삭제 버튼 생성
function createMenuDelBtn(order) {
	var a = document.createElement('a');
	var iconSpan = document.createElement('span');
	var i =  document.createElement('i');
	var textSpan = document.createElement('span');
	
	a.href = 'javascript:deleteRightMenu(' + order + ')';
	a.id = 'delMenuBtn_' + order;
	a.className = 'btn btn-danger btn-icon-split';
	iconSpan.className = 'icon text-white-50';
	i.className = 'fas fa-trash';
	textSpan.className = 'text';
	textSpan.innerText = '삭제';
	
	iconSpan.appendChild(i);
	a.appendChild(iconSpan);
	a.appendChild(textSpan);
	
	return a;
}

// 같은 클래스 요소 중 특정 id의 요소에만 active class 추가
function addActiveClass(targetId, className) {
	var classElementList = document.getElementsByClassName(className);
	var addClassName = 'active';
	
	for(var i=0;i<classElementList.length;i++) {
		var element = classElementList[i];
		var classNameList = element.className.split(/\s/gi);
		var resultClassName = '';
		
		for(var j=0;j<classNameList.length;j++) {
			var className = classNameList[j];
			
			if(className == addClassName) {
				continue;
			}
		
			if(className.length > 0) {
				resultClassName += resultClassName.length > 0 ? ' ' : '';
				resultClassName += className;
			}
		}
		
		if(element.id == targetId) {
			resultClassName += resultClassName.length > 0 ? ' ' : '';
			resultClassName += addClassName;
		} 
		
		element.className = resultClassName;
	}
}

// 메뉴 설명 보기
function showMenuInfo(type) {
	addActiveClass('typeInfo_' + type, 'typeInfo');
	addActiveClass('', 'detail_area');
}

// 오른쪽 메뉴 추가
function addRight(type) {
	var rightMenuUl = document.getElementById('rightMenuUl');
	var leftMenuUl = document.getElementById('leftMenuUl');
	var menuText = document.createElement('span');
	var order = rightMenuUl.children.length+1;
	var target = null;
	var newLi = null;
	var nameInput = null;
	var delBtn = null;
	
	for(var i=0;i<leftMenuUl.children.length;i++) {
		var leftMenu = leftMenuUl.children[i];
		
		if(Number(leftMenu.children.boardMenuType.value) == Number(type)) {
			target = leftMenu;
			break;
		}
	}
	
	if(!target) {
		return;
	}
	
	newLi = target.cloneNode(true);
	newLi.title= "드래그하여 메뉴 순서 변경 가능"
	newLi.onclick = showMenuInfoForm;
	newLi.ondragstart = saveMoveManu;
	newLi.ondragleave= dragleaveMenu;
	newLi.ondragover = dragoverMenu;
	newLi.ondrop = changeMenuOder;
	newLi.draggable = true;
	
	nameInput = newLi.children.boardMenuName;
	nameInput.value = '새로운 ' + nameInput.value;
	
	menuText.innerText = nameInput.value;

	delBtn = createMenuDelBtn(order);
	
	newLi.children.boardOrder.value = order;
	newLi.removeChild(newLi.children[0]);
	newLi.insertBefore(menuText, newLi.children[0]);
	newLi.appendChild(delBtn);
	
	rightMenuUl.appendChild(newLi);
}

// 이동 타겟 메뉴에 드래그 이벤트가 들어왔을 경우
function dragoverMenu() {
	event.preventDefault();
	var target = event.target;
	
	while(target.nodeName != 'LI') {
		target = target.parentElement;
	}
	
	target.style.borderBottom = '1px dashed #ccc';
	target.style.opacity = '0.7';
}


// 이동 타겟 메뉴에 드래그 이벤트가 나갔을 경우
function dragleaveMenu() {
	event.preventDefault();
	var target = event.target;
	
	while(target.nodeName != 'LI') {
		target = target.parentElement;
	}
	
	target.style.borderBottom = '';
	target.style.opacity = '';
}

// 드래그 이벤트 시작시 해당 li에 특정 클래스 부여
function saveMoveManu() {
	var targetId = 'moving_li';
	var target = event.target;
	
	while(target.nodeName != 'LI') {
		target = target.parentElement;
	}
	
	target.id = targetId;
}

// 메뉴 순서 변경
function changeMenuOder() {
	var targetId = 'moving_li';
    var rightMenuUl = document.getElementById('rightMenuUl');
    var targetMenu = event.target;
    var moveMenu = document.getElementById(targetId);
	
    moveMenu.removeAttribute('id');
    
	while(targetMenu.nodeName != 'LI') {
		targetMenu = targetMenu.parentElement;
	}
    
    var targetOrder = Number(targetMenu.children.boardOrder.value);
    var moveOrder = Number(moveMenu.children.boardOrder.value);
    var lastOrder = rightMenuUl.children.length;
    var parent = targetMenu.parentElement;

    // 드롭 대상이 되는 메뉴가 아래 있을 경우
    if(targetOrder > moveOrder) {
        if(targetOrder <= lastOrder) {
            parent.insertBefore(moveMenu, parent.children[targetOrder]);
        } else {
            parent.appendChild(moveMenu);
        }
    // 드롭 대상이 되는 메뉴가 위 있을 경우    
    } else {
        parent.insertBefore(moveMenu, parent.children[targetOrder-1]);
    }
    
    targetMenu.style.borderBottom = '';
    targetMenu.style.opacity = '';

    sortRightMenuIndex();
}

// 오른쪽 메뉴 순서 정렬
function sortRightMenuIndex() {
	var rightMenuUl = document.getElementById('rightMenuUl');
	var rightMenuList = null;
	
	if(!rightMenuUl) {
		return;
	}
	
	rightMenuList = rightMenuUl.children;
	
    for(var i=0;i<rightMenuList.length;i++) {
    	var rightMenu = rightMenuList[i];
    	var presentOrder = rightMenu.children.boardOrder.value;
    	var menuInfoForm = document.getElementById('menuInfoForm_'+presentOrder);
        var delBtn = null;
        var order = i+1;
 
        rightMenu.children.boardOrder.value = order;
        
        if(rightMenu.children[0]) {
        	delBtn = rightMenu.children[0];
        	
        	 while(delBtn && (!delBtn.id || delBtn.id.indexOf('delMenuBtn_') < 0)) {
             	delBtn = delBtn.nextElementSibling;
             }
             
             if(delBtn) {
             	delBtn.href = 'javascript:deleteRightMenu(' + order + ')';
             	delBtn.id = 'delMenuBtn_' + order;
             }
        }
        
        if(menuInfoForm) {
        	menuInfoForm.id = 'menuInfoForm_'+order;
		}
    }
}

// 오른쪽 메뉴 삭제
function deleteRightMenu(order) {
	if(confirm('메뉴를 삭제하시겠습니까?')) {
		var rightMenuUl = document.getElementById('rightMenuUl');
		var target = null;
		
		for(var i=0;i<rightMenuUl.children.length;i++) {
			var rightMenu = rightMenuUl.children[i];
			
			if(Number(rightMenu.children.boardOrder.value) == Number(order)) {
				target = rightMenu;
				break;
			}
		}
		
		if(target) {
			var delBtn = document.getElementById('delMenuBtn_'+order);
			var menuInfoForm = document.getElementById('menuInfoForm_'+order);
			
			target.onclick = null;
			target.children[0].style.textDecoration = 'line-through';
			target.children.delFlag.value= 'Y';
			
			if(delBtn) {
				target.removeChild(delBtn);
			}
			
			if(menuInfoForm) {
				menuInfoForm.parentElement.removeChild(menuInfoForm);
				addActiveClass('', 'typeInfo');
			}
		}
	}
}

// 메뉴 정보 입력폼을 보여줌
function showMenuInfoForm() {
	var xhr = new XMLHttpRequest();
	var target = event.target;
	var data = null;

	while(target.nodeName != 'LI') {
		if(target.id.indexOf('delMenuBtn_') > -1) {
			return;
		}
		target = target.parentElement;
	}
	
	data = getMenuObject(target);
	
	xhr.open('post', '${contextPath}/admin/menu/boardInput');
	xhr.setRequestHeader('Content-Type', 'application/json');
	xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
	xhr.onreadystatechange = function() {
		if(this.readyState == 4 && this.status == 200) {
			var typeInput = document.getElementById('typeInput_' + data.boardMenuType);
		
			addActiveClass('typeInfo_' + data.boardMenuType, 'typeInfo');
			
			if(typeInput) {
				var menuInfoForm = document.menuInfoForm;
				
				if(menuInfoForm) {
					menuInfoForm.parentElement.removeChild(menuInfoForm);
				}
	
				typeInput.innerHTML = this.response;
				addActiveClass(typeInput.id, 'detail_area');
			}
			
		}
	}
	
	xhr.send(JSON.stringify(data));
}

// 해당 메뉴의 정보를 object 형식으로 반환
function getMenuObject(li) {
	var obj = new Object();
	var childrenList = null;
	
	if(!li) {
		return obj;
	}
	
	obj.cafeId = document.menuForm.cafeId.value;
	
	childrenList = li.children;
	
	for(var i=0;i<childrenList.length;i++) {
		var children = childrenList[i];
		
		if(children.name) {
			obj[children.name] = children.value;
		}
	}
	
	return obj;
}

// 사용자가 입력한 값을 menuForm에 복사
function changeMenuValue() {
	var rightMenuUl = document.getElementById('rightMenuUl');
	var thisElement = event.target;
	var form = document.menuInfoForm;
	var index = Number(form.id.replace(/\D/gi, ''))-1;
	var target = rightMenuUl.children[index].children[thisElement.name];
	
	if(target.name == 'boardMenuName') {
		target.parentElement.children[0].innerText = target.value;
	}
	
	if(thisElement.type == 'checkbox') {
		var checkFlag = '';
		
		if(thisElement.value == 'Y') {
			checkFlag = thisElement.checked ? 'Y' : 'N';
		} else {
			checkFlag = thisElement.checked ? 'N' : 'Y';
		}
		
		target.value = checkFlag;
	} else {
		target.value = thisElement.value;
	}
}
</script>           
