<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				{ visible: false, orderable: true, targets: 0, width: 0 },// 1번째 항목 넓이를 10px로 설정
				{ orderable: false, targets: 1, width: 180 },// 2번째 항목 넓이를 30px로 설정
				{ orderable: false, targets: 2, width: 5 },// 3번째 항목 넓이를 30px로 설정
				{ orderable: false, targets: 3, width: 5 },// 4번째 항목 넓이를 30px로 설정
				{ orderable: true, targets: 4, width: 5 },// 5번째 항목 넓이를 30px로 설정
			],
			lengthMenu: [ 5, 10, 15, 20, 30, 40, 50 ],// 표시 건수 단위 설정
			// 기본 표시 건수를 15건으로 설정
			displayLength: 15,
			stateSave: false,// 현재 상태를 보존
			dom : '<"col-sm-11"f><"col-sm-11"l><"col-sm-6"r><"col-sm-11"t><"col-sm-6"i><"col-sm-11"p>',// 위치 설정값
			language : { // datatables가 우리나라거 아니라서 한글로 convert해줘야한다.
				search : '검색',
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
		
		$('#myTable_filter').prepend('<select id="select"></select>');
		$('#myTable > thead > tr').children().each(function (indexInArray, valueOfElement) { 
	        $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
	    });
		
		$('.dataTables_filter input').unbind().bind('keyup', function () {
	        var colIndex = document.querySelector('#select').selectedIndex;
	        table.column(colIndex+1).search(this.value).draw(); // 컬럼 숨기면 검색 인덱스 +1
	    });
		console.log();
	});
	
</script>
<h1>넘어온 카페 아이디:${cafeId}</h1>
<div class="content pull-right col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${cafeDTO.cafeLayout > 0 ? '' : 'style="float:right;"'}>
	<div class="container clearfix">
		<div class="content col-lg-12 col-md-12 col-sm-12 clearfix">
			<div class="col-lg-10 col-md-12 col-sm-8">
				<h1>전체 게시판</h1>
				<table class="table table-bordered" id="myTable">
					<thead>
						<tr>
							<th>글번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>
					<c:forEach var="dto" items="${boardList}">
						<tr>
							<th>${dto.BOARD_NUM}</th>
							<th>
							<a href="goBoardInside?boardNum=${dto.BOARD_NUM }
							&cafeId=${cafeId}&boardMenuNum=${dto.BOARD_MENU_NUM}">
							${dto.BOARD_TITLE} </a></th>
							<th>${dto.USER_Id}</th>
							<th>${dto.BOARD_SAVEDATE}</th>
							<th>${dto.HIT}</th>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>

