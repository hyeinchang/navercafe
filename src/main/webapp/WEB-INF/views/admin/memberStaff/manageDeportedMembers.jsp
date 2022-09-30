<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"> </script>
<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>

<script>
$(document).ready(function () {
	
    $('#deportedMembers').DataTable({
    	
	"columnDefs": [
        { orderable: false, "width": "10px", "targets": 0 },
        { orderable: true, "targets": 1 }
      ] ,
    "order": [[ 3, 'desc' ]], 	// 방문일 기준 기본 정렬값 desc 설정 
    "autoWidth": false,
    language : {
        "decimal":        "",
        "emptyTable":     "가입 불가로 지정된 회원이 없습니다.",
        "info":           "Showing _START_ to _END_ of _TOTAL_ entries",
        "infoEmpty":      "Showing 0 to 0 of 0 entries",
        "infoFiltered":   "(filtered from _MAX_ total entries)",
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
		} else {
			alert('멤버를 선택하세요')
			return;
		}

		if(id === 'unban') {
			if(window.confirm("재가입이 가능하도록 처리 하겠습니까?")) {
				console.log('가입불가 해제!')
				$('#unbanMembers').val(checkObjval);
				document.getElementById('f-unban').submit();
			}
		} if(id === 'ban') {
			if(window.confirm("가입불가 처리 하시겠습니까?")) {
				console.log('가입불가 지정!')
				$('#banMembers').val(checkObjval);
				document.getElementById('f-ban').submit();
			}
		}	
		
		return;
		
	}
	
</script>


<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
<div id="content">
           <!-- Page Heading -->
           <div class="d-sm-flex align-items-center justify-content-between mb-4">
               <h1 class="h3 mb-0 text-gray-800">강제탈퇴 멤버 관리</h1>
           </div>
           		<div>운영자가 강제 탈퇴시킨 멤버로 3개월간만 보관되며, 멤버 스스로 탈퇴한 기록은 남지 않습니다. <br>
				카페 멤버를 가입 불가처리하면 자동으로 탈퇴 처리됩니다. 멤버에 대한 강제탈퇴는 전체 멤버 관리에서 하실 수 있습니다.</div>
           <hr>
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
				<div class="table-responsive">
	<table id="deportedMembers" class="display compact" style="width:100%">
        <thead>
            <tr>
                <th> <input type="checkbox" class="registerBan-cb-all"></th>
                <th>아이디</th>
                <th>사유</th>
                <th>처리일</th>
                <th>처리자</th>
                <th>가입 불가 여부</th>
            </tr>
        </thead>
        
        <tbody>
        <c:forEach var="dto" items="${list }">
            <tr>
                <td align="center"><input type="checkbox" class="registerBan-cb-item" name="temp" value="${dto.userId }"></td>
                <td>${dto.userId }</td>
                <td>${dto.reason }</td>
                <td>${dto.regdate }</td>
                <td>처리자?</td>
                <td>가입불가?</td>
            </tr>
        </c:forEach>
        </tbody>
        
        <tfoot>
            <tr>
            	<th> &nbsp;&nbsp; <input type="checkbox" class="registerBan-cb-all"> </th>
                <th colspan="5">
					선택 멤버를 
					<input type="button" value="가입불가 해제" id="unban" onclick="manageMember(this.id)"> &nbsp;
					<input type="button" value="가입불가" id="ban" onclick="manageMember(this.id)"> &nbsp;
                </th>
            </tr>
        </tfoot>
    </table>
    
<form action="unbanMembers" id="f-unban" method="post">
	<input type="hidden" value="" name="unbanMembers" id="unbanMembers">
	<input type="hidden" value="${cafeId}" name="cafeId">
</form>
<form action="banMembers" id="f-ban" method="post">
	<input type="hidden" value="" name="banMembers" id="banMembers">
	<input type="hidden" value="${cafeId}" name="cafeId">
</form>	
    	</div>
    </div>
</div>
<!-- End of Main Content -->