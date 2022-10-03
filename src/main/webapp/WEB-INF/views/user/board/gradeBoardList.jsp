<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<style type="text/css">
	/* 필터링 (검색) */
	div.dataTables_filter {
		text-align : right !important;
	}
	/* 표시 건수수 설정 */
	div.dataTables_length {
		text-align : right !important;
	}
	/* 페이징 설정*/
	div.dataTables_paginate {
		text-align : center !important;
	}
</style>
<script	src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script>
	jQuery(function($) {
		$("#myTable").DataTable({
			lengthChange: true,// 표시 건수기능 숨기기
			searching: true,// 검색 기능 숨기기
			ordering: true,// 정렬 기능 숨기기
			info: false,// 정보 표시 숨기기
			paging: true,// 페이징 기능 숨기기
			responsive: true, //
			order : [[0, "desc"]], //0번항목 내림차순 정렬(글번호)
			// 열 넓이 설정
			columnDefs: [
				// visible 숨김, orderable 정렬기능
				{ orderable: true, 	visible: true,  targets: 0, width: 50 },
				{ orderable: true, visible: true, targets: 1, width: 50 },
				{ orderable: true, visible: true, targets: 2, width: 50 },
				{ orderable: true, visible: true, targets: 3, width: 50 },
				{ orderable: true, 	visible: true, targets: 4, width: 50 },
				{ orderable: true, visible: true, targets: 5, width: 50 },
				{ orderable: true, visible: true, targets: 6, width: 50 },
				{ orderable: true, 	visible: true, targets: 7, width: 50 }
			],
			lengthMenu: [ 5, 10, 15, 20, 30, 40, 50 ],// 표시 건수 단위 설정
			// 기본 표시 건수를 15건으로 설정
			displayLength: 15,
			stateSave: false,// 현재 상태를 보존
			dom : '<"col-sm-11"f><"col-sm-11"l><"col-sm-6"r><"col-sm-11"t><"col-sm-6"i><"col-sm-11"p>',// 위치 설정값
			language : { // datatables가 우리나라거 아니라서 한글로 convert해줘야한다.
				search : '',
				paginate : {
					previous : '이전',
					next : '다음',
					last : '마지막',
					first : '처음'
				},
				emptyTable : '데이터가 없습니다.',
				infoEmpty : "데이터 없음",
				info : '_START_부터  _END_까지  / 총데이터 : _TOTAL_',
				infoEmpty : '데이터 0 부터 0 까지 0 총데이터',
				lengthMenu : '_MENU_개씩',
				loadingRecords : '로딩중..',
				processing : '작업중..',
				zeroRecords: "검색결과가 없습니다."
			}
		});
		
		var table = $('#myTable').DataTable();
		
		$('#myInput').on( 'keyup', function () {
		    table.search( this.value ).draw();
		} );
		$('#myTable_filter label').prepend('<select id="select" class="form-control-inline" style="vertical-align:middle;margin-rigth:5px;"></select>');
		$('#myTable > thead > tr').children().each(function (indexInArray, valueOfElement) { 
			var seleced = valueOfElement.innerText == '제목' ? ' selected' : '';
	        $('#select').append('<option' + seleced + '>'+valueOfElement.innerHTML+'</option>');
	    });
		$('#myTable_filter input').addClass('form-control-inline');
		$('#myTable_length select').attr('class','form-control-inline');
		$('.dataTables_filter input').unbind().bind('keyup', function () {
	        var colIndex = document.querySelector('#select').selectedIndex;
	        
	        table.column(colIndex).search(this.value).draw(); // 컬럼 숨기면 검색 인덱스 +1
	    });	
		$('#myTable_length label').prepend($('#myTable_filter label'));
		
		var form = document.writeBoardForm;
		var maxGrade = 5;
		var cafeUserGrade = form.cafeUserGrade.value;
		
		if(maxGrade > Number(cafeUserGrade)) {
			$('#myTable_length').prepend('<button type="button" id="gradeBtn" class="boardBtn">등업 신청하기</button>');
			var gradeBtn = document.getElementById('gradeBtn');
			gradeBtn.onclick = writeBoard;
		}
			
	});
	
</script>
	<div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${_cafeDTO.cafeLayout eq 'left' ? '' : 'style="float:right;"'}>
       	<section class="section1">
		    <div class="container clearfix">
		      <div class="title">
		       	<h4>
		          <span>${boardMenuName}</span>
		        </h4>
		      </div>
		      <div class="col-lg-10 col-md-8 col-sm-8 clearfix">
		      	<table class="table table-bordered" id="myTable">
					<thead>
						<tr>
							<th>신청자</th>
							<th>신청등급</th>
							<th>현재등급</th>
							<th>방문수</th>
							<th>게시글수</th>
							<th>댓글수</th>
							<th>가입일</th>
							<th>신청일</th>
						</tr>
					</thead>
					<c:forEach var="board" items="${boardList}">
						<tr>
							<td>
								<c:if test="${ board.cafeUesrImageNum == 0}">
			              			<img src="<%=request.getContextPath()%>/resources/img/프로필.jpg"
			              			width="40px" class="img-circle alignleft" alt="">
			              		</c:if>
								<c:if test="${ board.cafeUesrImageNum  != 0 }">
									<img src="test_download?fileImageNum=${board.cafeUesrImageNum}" 
									width="40px" class="img-circle alignleft" alt="">
								</c:if>
								<br>
								${board.cafeUserNickname}
							</td>
							<td>${board.upCutName}</td>
							<td>${board.cutName}</td>
							<td>${board.cafeUserVisit}</td>
							<td>${board.cafeUserWrite}</td>
							<td>${board.cafeUserReply}</td>
							<td>${board.cafeUserRegdate}</td>
							<td>${board.boardSaveDate}</td> 	
						</tr>
					</c:forEach>
				</table>
				
		      </div>
		      <!-- end content -->
		    </div>
		    <!-- end container -->
		  </section>
      </div>
      <!-- end content -->
<form name="writeBoardForm" method="post">
	<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
	<input type="hidden" name="userId" value="${_cafeDTO.loginId}"> 
	<input type="hidden" name="boardMenuNum" value="${_cafeDTO.menuDTO.boardMenuNum}">
    <input type="hidden" name="boardTitle" value="등업게시글">
    <input type="hidden" name="cafeUserGrade" value="${_cafeDTO.loginUser.cafeUserGrade}">
</form>	     
<script type="text/javascript">
function writeBoard() {
	var form = document.writeBoardForm;
	var maxGrade = 5;
	var cafeUserGrade = form.cafeUserGrade.value;
	
	if(Number(cafeUserGrade) >= maxGrade) {
		alert('카페 회원 최고 등급은 등업신청이 불가능합니다.');
		return;
	}
	
	if(confirm('등업신청 하시겠습니까?')) {
		var xhr = new XMLHttpRequest();
		var cafeId = form.cafeId.value;
		var userId = form.userId.value;
		var editorDirectory = 'board';
		var data = getData();
		
		xhr.open('post', '${contextPath}/user/board/writeBoard', false);
		xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
		xhr.setRequestHeader('Content-Type', 'application/json');
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
	 			var message = '';
	 			
	 			if(Number(xhr.response) == 1) {
	 				location.reload();
	 			} else {
	 				alert('저장에 실패했습니다.');
	 			}
			}
		}
		
		xhr.send(JSON.stringify(data));
	}
}

function getData() {
	var form = document.writeBoardForm;
	var data = new Object();
	
	for(var i=0;i<form.length;i++) {
		var element = form[i];
		
		if(element.name && element.value) {
			data[element.name] = element.value;
		}
	}
	
	return data;
}
</script>	      