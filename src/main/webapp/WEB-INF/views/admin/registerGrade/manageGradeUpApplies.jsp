<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!-- Content Wrapper -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"> </script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>

<style>
	.nav-pills .nav-item .active {
		font-weight: bold;
	}
</style>

<script>

$(document).ready(function () {
	
    $('#gradeUpApplies').DataTable({
    	
	"columnDefs": [
        { orderable: false, "width": "10px", "targets": 0 },
        { orderable: true, "targets": 1 }
      ],
    "order": [[ 3, 'desc' ]], 	// 방문일 기준 기본 정렬값 desc 설정 
    "autoWidth": false,
    language : {
        "decimal":        "",
        "emptyTable":     "등업 신청글이 없습니다.",
        "info":           " 총 _TOTAL_ 명 중 _START_ - _END_ 명 ",
        "infoEmpty":      "",
        "infoFiltered":   "",
        "infoPostFix":    "",
        "thousands":      ",",
        "lengthMenu":     "멤버 _MENU_ 명 정렬",
        "loadingRecords": "로딩중...",
        "processing":     "",	
        "search":         "검색:",
        "zeroRecords":    "찾으신 정보가 없습니다",
        "paginate": {
            "first":      "첫번째",
            "last":       "마지막",
            "next":       "다음",
            "previous":   "이전"
        },
        "aria": {
            "sortAscending":  ": activate to sort column ascending",
            "sortDescending": ": activate to sort column descending"
        }
    }
    	
    });
    
    	// 체크박스 전체선택 
		$(".registerBan-cb-all").change(function() {
			if ( this.checked ) {
				$('.registerBan-cb-all').prop('checked', true)
				$('.registerBan-cb-item:not(:checked').prop('checked', true)
			}
			else {
				$('.registerBan-cb-all').prop('checked', false)
				$('.registerBan-cb-item:checked').prop('checked', false)
			}
		});
			
		$(".registerBan-cb-item").change(function() {
			if ( this.checked ) {
				let allChecked = $('.registerBan-cb-item:not(:checked').length == 0;
				$('.registerBan-cb-all').prop('checked', allChecked);
			} else {
				let allChecked = $('.registerBan-cb-item:not(:checked').length == 0;
				$('.registerBan-cb-all').prop('checked', allChecked);				
			}
		});
    
});
    
</script>

<script>

	function manageMember(id) {
		let checkObj = $(".registerBan-cb-item:checked");
		let checkObjval = "";
		
		
		if (checkObj.length == 1) {
			checkObjval = checkObj[0].value;
		}	else if (checkObj.length > 1) {
				for (var i = 0; i < checkObj.length; i++) {
					if (checkObj[i].checked === true) {
						checkObjval += checkObj[i].value + "/";
				}
			}
			checkObjval = checkObjval.substring(0, checkObjval.length-1);
			console.log(checkObjval);
		} else {
			alert('멤버를 선택하세요')
			return;
		}

		if(id === 'gradeUp') {
			console.log('등급업!')
			$('#gradeUpMembers').val(checkObjval);
			document.getElementById('f-gradeUp').submit();
		} else if (id === "gradeReject") {
			console.log('승급거절 ㅜㅜ')
			$('#gradeRejectMembers').val(checkObjval);
			document.getElementById('f-gradeReject').submit();
		} 
		
		return;
		
	}
	
</script>


<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
<div id="content">

           <!-- Page Heading -->
				<h1 class="h3 text-gray-800 cstmTitle">멤버 등급 관리</h1>
               	<hr>
				<div class="card mb-4 py-0 border-bottom-dark col-md-6" >
					<div class="card-body">
						<ul class="nav nav-pills nav-fill">
							<li class="nav-item"> 
								<a class="nav-link" href="${contextPath }/admin/manageMembersGrade?cafeId=${cafeId}">등급 조건 관리</a> 
							</li>
							<li class="nav-item"> 
								<a class="nav-link active" aria-current="page" href="${contextPath }/admin/manageGradeUpApplies?cafeId=${cafeId}">등급 신청 관리</a> 
							</li>
						</ul>
					</div>
				</div>
				
				               	
          		<form name="f1" id="f1" method="post" action="modifyRegisterInfo">
               	<div class="form-group">
               		<ul>
		               	<li> 등업 신청한 멤버를 보면서 등업을 수락하거나 거절할 수 있습니다. </li>
		               	<li> 등업 게시판에 표시되는 게시글 수는 신청 시점이 아닌 현재 시점 수치입니다.</li>
	               	</ul>
               	<hr>
				</div>
           
	<table id="gradeUpApplies" class="display compact" style="width:100%">
        <thead>
            <tr>
                <th> <input type="checkbox" class="registerBan-cb-all"></th>
                <th>별명(아이디)</th>
                <th>신청등급</th>
                <th>현재등급</th>
                <th>방문수</th>
                <th>게시글 수</th>
                <th>댓글 수</th>
                <th>가입일</th>
                <th>신청일</th>
            </tr>
        </thead>
        
        <tbody>
        <c:forEach var="dto" items="${list }">
            <tr>
                <td align="center"><input type="checkbox" class="registerBan-cb-item" name="temp" value="${dto.userId}+${dto.boardNum }"></td>
                <td>${dto.userId} (${dto.cafeUserNickname })</td>
                <td>${dto.upCutName }</td>
                <td>${dto.cutName }</td>
                <td>${dto.cafeUserVisit }</td>
                <td>${dto.cafeUserWrite }</td>
                <td>${dto.cafeUserReply }</td>
                <td>${dto.cafeUserRegdate }</td>
                <td>${dto.boardSavedate }</td>
            </tr>
        </c:forEach>
        </tbody>
        
        <tfoot>
            <tr>
            	<th> &nbsp;&nbsp; <input type="checkbox" class="registerBan-cb-all"> </th>
                <th colspan="8">
					선택 멤버를  &nbsp;
					<input type="button" value="등업 수락" id="gradeUp" onclick="manageMember(this.id)"> &nbsp;
					<b>ㅣ&nbsp; </b>
					<input type="button" value="등업 거절" id="gradeReject" onclick="manageMember(this.id)"> &nbsp;
                </th>
            </tr>
        </tfoot>
    </table>
    </form>
    
		<form action="gradeUpMembers" id="f-gradeUp" method="post">
			<input type="hidden" value="" name="gradeUpMembers" id="gradeUpMembers">
			<input type="hidden" value="${cafeId }" name="cafeId">
		</form>	
		<form action="gradeRejectMembers" id="f-gradeReject" method="post">
			<input type="hidden" value="" name="gradeRejectMembers" id="gradeRejectMembers">
			<input type="hidden" value="${cafeId }" name="cafeId">
		</form>
