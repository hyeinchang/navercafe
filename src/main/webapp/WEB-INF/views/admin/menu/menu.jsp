<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<style>
.menuForm .menuChoice ul {margin:0; padding:0;}
.menuForm .menuChoice {display: inline-block;vertical-align:top;}
.menuForm .menuChoice li.ge_v1 {background-position: 12px -303px;}
.menuForm .menuChoice li.ge_v13 {background-position: 12px -1284px;}
.menuForm .menuChoice li.ge_v3 {background-position: 12px -425px;}
.menuForm .menuChoice li.ge_v6 {background-position: 12px -608px;}
.menuForm .menuChoice li.ge_v7 {background-position: 12px -669px;}
.menuForm .menuChoice li.ge_v8 {background-position: 12px -730px;}
.menuForm .menuChoice li.ge_v9 {background-position: 12px -791px;}
.menuForm .menuChoice li {list-style:none; margin-bottom:10px; display: block; padding: 0 0 0 30px; background: url(${contextPath}/resources/img/sp_ico_menu5.png) no-repeat 10px 0; color: #333;}
.menuForm .menuChoice li:hover {cursor:pointer;color:#4e73df;}    
.menuForm .rightBox {display: inline-block;border: 1px solid #e3e6f0;height: 500px;background:#fff;vertical-align:top;}
.menuForm .rightBox ul {margin:0; padding:0;}
.menuForm .rightBox .rightMenu {display:inline-block;width:300px;height: 100%;}
.menuForm .rightBox > div {vertical-align:top;}
.menuForm .menuInfoArea {display:inline-block; border-left: 1px solid #e3e6f0;  width:500px;height: 100%;padding:10px;}
.menuForm .set_box .set_tit {font-size: 1rem;font-weight: bold;}
.menuForm .set_box .set_lst_type, .menuForm .set_box .set_p_type{font-size: 0.9rem;padding-left: 1.4rem;}
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
		                    	<ul id="leftUl">
		                    		<li class="ge_v1" onclick="addRight(0)">
		                    			<span>통합게시판</span>
		                    		</li>
		                    		<li class="ge_v13" onclick="addRight(1)">
		                    			<span>간편게시판</span>
		                    		</li>
		                    		<!-- <li class="ge_v3" onclick="addRight()">
		                    			<span>상품등록게시판</span>
		                    		</li> -->
		                    		<li class="ge_v6" onclick="addRight(2)">
		                    			<span>스탭게시판</span>
		                    		</li>
		                    		<li class="ge_v7" onclick="addRight(3)">
		                    			<span>등업게시판</span>
		                    		</li>
		                    		<li class="ge_v8" onclick="addRight(4)">
		                    			<span>메모게시판</span>
		                    		</li>
		                    		<li class="ge_v9" onclick="addRight(5)">
		                    			<span>출석부</span>
									</li>
		                    	</ul>	
							</div>
						</div>
						
						<div class="rightBox">
							<div class="rightMenu">
								<ul id="rightUl">
								</ul>
							</div>
							<div class="menuInfoArea">
								<div class="set_box">
									<h3 class="set_tit">통합게시판</h3>
   									<ul class="set_lst_type">
   										<li>용도에 따라 다양한 형태로 사용 가능한 일반 게시판입니다.</li>
   										<li>공지게시판으로 사용하려면 글쓰기 권한을 스탭 이상으로 설정하세요.</li>
   									</ul>
    							</div>
    							<div class="set_box">
    								<h3 class="set_tit">간편게시판</h3>
    								<ul class="set_lst_type">
    									<li>간편하고 빠르게 게시글을 작성할 수 있는 게시판입니다.</li>
    									<li>제목 입력이 필요없는 게시판으로 본문 일부가 제목이 됩니다.</li>
    								</ul>
    							</div>
    							<div class="set_box">
    								<h3 class="set_tit">스탭게시판</h3>
    								<p class="set_p_type">매니저와 스탭만 읽고 쓸 수 있는 게시판입니다.</p>
    							</div>
    							<div class="set_box">
    								<h3 class="set_tit">등업게시판</h3>
    								<p class="set_p_type">멤버들의 등업신청을 한눈에 보고 관리(수락/거절)할 수 있는 게시판입니다.</p>
    							</div>
    							<div class="set_box">
    								<h3 class="set_tit">메모게시판</h3>
    								<ul class="set_lst_type">
    									<li>카페 가입인사나 짧은 메모를 남기는데 가장 적합한 형태입니다.</li>
    									<li>멤버에게만 공개를 체크하시면 가입멤버에게만 보입니다.</li>
    								</ul>
    							</div>
    							<div class="set_box">
    								<h3 class="set_tit">출석부</h3>
    								<ul class="set_lst_type">
    									<li>날짜별로 출석체크를 할 수 있는 게시판입니다.</li>
    									<li>카페당 1개씩 가능하며, 출석미션 등록도 가능합니다.</li>
    									<li>멤버에게만 공개를 체크하시면 가입멤버에게만 보입니다.</li>
    								</ul>
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
	
	xhr.send(new FormData(titleForm));
}

var rightUl = document.getElementById('rightUl');
var moveMenu = null;

// 드래그 이벤트가 들어왔을 때 기본 기능 초기화
rightUl.ondragover = function(e) {
    e.preventDefault();
}

// 오른쪽 메뉴 추가
function addRight(menyType) {
	var leftUl = document.getElementById('leftUl');
    var rightUl = document.getElementById('rightUl');
    var rightMenuList = document.getElementsByClassName('rightMenu');
  	var xhr = new XMLHttpRequest();
    cloneLi.appendChild(deletA);
    rightUl.appendChild(cloneLi);
 
}

// 드래그 이벤트 시작시 moveMenu(전역변수)에 드래그되는 메뉴 대입
function saveMoveManu() {
    moveMenu = event.target;
}

// 메뉴 순서 변경
function changeMenuOder() {
    var rightMenuList = document.getElementsByClassName('rightMenu');
    var targetMenu = event.target;
    var targetIndex = Number(targetMenu.dataset.index);
    var moveIndex = Number(moveMenu.dataset.index);
    var lastIndex = rightMenuList.length - 1;
    var parent = targetMenu.parentElement;

    // 드롭 대상이 되는 메뉴가 아래 있을 경우
    if(targetIndex > moveIndex) {
        targetIndex++;
        if(targetIndex <= lastIndex) {
            parent.insertBefore(moveMenu, parent.children[targetIndex]);
        } else {
            parent.appendChild(moveMenu);
        }
    // 드롭 대상이 되는 메뉴가 위 있을 경우    
    } else {
        parent.insertBefore(moveMenu, parent.children[targetIndex]);
    }

    sortRightMenuIndex();
}

// 오른쪽 메뉴 인덱스 정렬
function sortRightMenuIndex() {
    var rightMenuList = document.getElementsByClassName('rightMenu');

    for(var i=0;i<rightMenuList.length;i++) {
        var rightMenu = rightMenuList[i];
        var deletA = rightMenu.children[0];

        rightMenu.dataset.index = i;
        deletA.href = 'javascript:deleteRightMenu(' + i + ')';
    }

    return rightMenuList.length;
}

// 오른쪽 메뉴 삭제
function deleteRightMenu(index) {
    var rightMenuList = document.getElementsByClassName('rightMenu');
    rightMenuList[index].parentElement.removeChild(rightMenuList[index]);
    sortRightMenuIndex();
}
</script>           
