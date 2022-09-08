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
	
    $('#allMembers').DataTable({
    	
	"columnDefs": [
        { orderable: false, "width": "10px", "targets": 0 },
        { orderable: true, "targets": 1 }
      ] ,
    "order": [[ 3, 'desc' ]], 	// 방문일 기준 기본 정렬값 desc 설정 
    "autoWidth": false,
    language : {
        "decimal":        "",
        "emptyTable":     "데이터가 없습니다 :(",
        "info":           " 총 _TOTAL_ 명 중 _START_ - _END_ 명 ",
        "infoEmpty":      " 인원이 없습니다 :( ",
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
			checkObjval = checkObj.value;
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

		if(id === 'deport') {
			console.log('디포트래!')
			$('#deportMembers').val(checkObjval);
			document.getElementById('f-deport').submit();
		} else if (id === "email") {
			console.log('이메일 보내줘')
			$('#emailMembers').val(checkObjval);
			document.getElementById('f-email').submit();
		} else if (id === "modify") {
			console.log('등급 변경해줘')
			$('#modifyMembers').val(checkObjval);
			document.getElementById('f-modify').submit();
		}
		
		return;
		
	}
	
</script>


<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
<div id="content">

           <!-- Page Heading -->
           <div class="d-sm-flex align-items-center justify-content-between mb-4">
               <h1 class="h3 mb-0 text-gray-800">전체 멤버 관리</h1>
           </div>
           
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
				<div class="table-responsive">
	<table id="allMembers" class="display compact" style="width:100%">
        <thead>
            <tr>
                <th> <input type="checkbox" class="registerBan-cb-all"></th>
                <th>별명(아이디)</th>
                <th>멤버등급</th>
                <th>가입일</th>
                <th>최종방문일</th>
                <th>방문수</th>
                <th>게시글 수</th>
                <th>댓글 수</th>
            </tr>
        </thead>
        
        <tbody>
        <c:forEach var="dto" items="${list }">
            <tr>
                <td align="center"><input type="checkbox" class="registerBan-cb-item" name="temp" value="${dto.userName }"></td>
                <td>${dto.userName }</td>
                <td>${dto.userLevel }</td>
                <td>${dto.userPoint }</td>
                <td>${dto.userEmail }</td>
                <td>${dto.userId }</td>
                <td>2121212</td>
                <td>${dto.userLevel }</td>
            </tr>
        </c:forEach>
        </tbody>
        
        <tfoot>
            <tr>
            	<th> &nbsp;&nbsp; <input type="checkbox" class="registerBan-cb-all"> </th>
                <th colspan="7">
					선택 멤버를 
					<select>
							<option>응애멤버1</option>
							<option>응애멤버2</option>
							<option>응애멤버3</option>
						<c:forEach var="gradeList" items=""> 
						</c:forEach>
					</select>
					(으)로
					<input type="button" value="변경" id="modify" onclick="manageMember(this.id)"> &nbsp;
					<b>ㅣ&nbsp; </b>
					<input type="button" value="강제탈퇴" id="deport" onclick="manageMember(this.id)"> &nbsp;
					<b>ㅣ&nbsp; </b>
					<input type="button" value="메일" id="email" onclick="manageMember(this.id)">
                </th>
            </tr>
        </tfoot>
    </table>
    
<form action="deportMembers" id="f-deport" method="post">
	<input type="hidden" value="" name="deportMembers" id="deportMembers">
</form>
<form action="emailMembers" id="f-email" method="post">
	<input type="hidden" value="" name="emailMembers" id="emailMembers">
</form>
<form action="modifyMembers" id="f-modify" method="post">
	<input type="hidden" value="" name="modifyMembers" id="modifyMembers">
</form>
    	</div>
    </div>
</div>
<!-- End of Main Content -->