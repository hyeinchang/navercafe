<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<style>
.menuForm .menuChoice ul {margin:0; padding:0;}
.menuForm .menuChoice {display: inline-block;vertical-align:top;width:300px;}

.menuForm #leftMenuUl > li.ge_v1, #rightMenuUl > li.ge_v1 {background-position: 12px -303px;}
.menuForm #leftMenuUl > li.ge_v13, #rightMenuUl > li.ge_v13 {background-position: 12px -1284px;}
.menuForm #leftMenuUl > li.ge_v3, #rightMenuUl > li.ge_v3 {background-position: 12px -425px;}
.menuForm #leftMenuUl > li.ge_v6, #rightMenuUl > li.ge_v6 {background-position: 12px -608px;}
.menuForm #leftMenuUl > li.ge_v7, #rightMenuUl > li.ge_v7 {background-position: 12px -669px;}
.menuForm #leftMenuUl > li.ge_v8, #rightMenuUl > li.ge_v8 {background-position: 12px -730px;}
.menuForm #leftMenuUl > li.ge_v9, #rightMenuUl > li.ge_v9 {background-position: 12px -791px;}

/* #rightMenuUl > li.ge_v1 {background-position: 12px -300px;}
#rightMenuUl > li.ge_v13 {background-position: 12px -1281px;}
#rightMenuUl > li.ge_v3 {background-position: 12px -422px;}
#rightMenuUl > li.ge_v6 {background-position: 12px -605px;}
#rightMenuUl > li.ge_v7 {background-position: 12px -666px;}
#rightMenuUl > li.ge_v8 {background-position: 12px -727px;}
#rightMenuUl > li.ge_v9 {background-position: 12px -788px;} */

.menuForm #leftMenuUl > li , #rightMenuUl > li{list-style:none; margin-bottom:10px; display: block; padding: 0 0 0 30px; background: url(${contextPath}/resources/img/sp_ico_menu5.png) no-repeat 10px 0; color: #333;}
.menuForm .menuChoice li:hover {cursor:pointer;color:#4e73df;}    
.menuForm .rightBox {display: inline-block;border: 1px solid #e3e6f0;height: 700px;background:#fff;vertical-align:top;overflow-y:scroll;}
.menuForm .rightBox ul {margin:0; padding:0;}
.menuForm .rightBox .rightMenu {display:inline-block;width:340px;height: 100%;}
.menuForm .rightBox > div {vertical-align:top;padding:1.25rem;}
.menuForm .typeInfoArea {display:inline-block; border-left: 1px solid #e3e6f0;  width:700px;height: 100%;}
.menuForm .typeInfo {display:none;}
.menuForm .typeInfo.active {display:block;}
.menuForm .set_box .set_tit {font-size: 1rem;font-weight: bold;}
.menuForm .set_box .set_lst_type {font-size: 0.9rem;padding-left: 1.4rem;}
.menuForm .set_box .set_p_type{font-size: 0.9rem;}
.menuForm .set_box .detail_area {display:none;font-size: 0.9rem}
.menuForm .set_box .detail_area.active {display:block;}
.menuForm #rightMenuUl li:hover{cursor: grab;}
.menuForm #rightMenuUl li input:hover{cursor: grab;}
.menuForm li .btn {line-height: 15px;font-size: 0.7rem;}
.menuForm li .btn:not(:first-child) {margin-left:5px;}
.menuForm li .btn span.icon {padding:5px 7px;}
.menuForm li .btn span.text {padding:5px;}
</style>
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
               	
               		<form name="menuForm" class="menuForm">
               			<input type="hidden" name="cafeId" value="${cafeDTO.cafeId}">
         
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
                                			<span class="text">메뉴 추가</span>
                         				</a>
		                    			</span>
		                    			<input type="hidden" name="boardMenuName" value="${menuType.boardMenuName}">
		                    			<input type="hidden" name="boardMenuNum" value="">
		                    			<input type="hidden" name="boardMenuDesc" value="${menuType.boardMenuDesc}">
		                    			<input type="hidden" name="boardMenuType" value="${menuType.boardMenuType}">
		                    			<input type="hidden" name="boardWriteAuth" value="${menuType.boardWriteAuth}">
		                    			<input type="hidden" name="boardReplyAuth" value="${menuType.boardReplyAuth}">
		                    			<input type="hidden" name="boardReadAuth" value="${menuType.boardReadAuth}">
		                    			<input type="hidden" name="boardOrder" value="">
		                    			<input type="hidden" name="delFlag" value="N">
		                    		</li>
		                    	</c:forEach>
		                    	</ul>	
							</div>
						</div>
						
						<div class="rightBox">
							<div class="rightMenu">
								<ul id="rightMenuUl">
								<c:forEach var="menu" items="${menuList}" varStatus="status">
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
		                    		<li class="${typeClass}" title="드래그하여 메뉴 순서 변경 가능" onclick="showMenuForm()"
		                    			draggable="true" ondragover="defaultPrevent()" ondragstart="saveMoveManu()" ondrop="changeMenuOder()">
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
		                    			<input type="hidden" name="delFlag" value="N">
		                    		</li>
		                    	</c:forEach>
								</ul>
							</div>
							<div class="typeInfoArea">
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
						</div>
						
       				</form>
       				
       				<div class="btnArea">
             			<a href="javascript:saveTitle()" class="btn btn-primary btn-icon-split">
                              <span class="icon text-white-50">
                                   <i class="fas fa-check"></i>
                              </span>
                              <span class="text">저장하기</span>
                         </a>
						<c:if test="${cafeDTO.titleNum ne null && cafeDTO.titleNum > 0}">
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

// 이벤트의 default event 막음
function defaultPrevent() {
	event.preventDefault();
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
	newLi.onclick = showMenuForm;
	newLi.ondragstart = saveMoveManu;
	newLi.ondragover = defaultPrevent;
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

    sortRightMenuIndex();
}

// 오른쪽 메뉴 인덱스 정렬
function sortRightMenuIndex() {
	var rightMenuUl = document.getElementById('rightMenuUl');
	var rightMenuList = null;
	
	if(!rightMenuUl) {
		return;
	}
	
	rightMenuList = rightMenuUl.children;
	
    for(var i=0;i<rightMenuList.length;i++) {
        var rightMenu = rightMenuList[i];
        var delBtn = rightMenu.children[0];
        var order = i+1;
 
        rightMenu.children.boardOrder.value = order;
        
        while(delBtn.id.indexOf('delMenuBtn_') < 0) {
        	delBtn = delBtn.nextElementSibling;
        }
        
        if(delBtn) {
        	delBtn.href = 'javascript:deleteRightMenu(' + order + ')';
        	delBtn.id = 'delMenuBtn_' + order;
        	console.log(delBtn.id);
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
			
			target.children.boardMenuName.disabled = true;
			target.children.boardMenuName.onclick = null;
			target.children.delFlag.value= 'Y';
			
			if(delBtn) {
				target.removeChild(delBtn);
			}
		}
	}
}

// 메뉴 정보 입력폼을 보여줌
function showMenuForm() {
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
	xhr.onreadystatechange = function() {
		if(this.readyState == 4 && this.status == 200) {
			var typeInput = document.getElementById('typeInput_' + data.boardMenuType);
		
			addActiveClass('typeInfo_' + data.boardMenuType, 'typeInfo');
			
			if(typeInput) {
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
	
	childrenList = li.children;
	
	for(var i=0;i<childrenList.length;i++) {
		var children = childrenList[i];
		
		if(children.name) {
			obj[children.name] = children.value;
		}
	}
	
	return obj;
}
</script>           
