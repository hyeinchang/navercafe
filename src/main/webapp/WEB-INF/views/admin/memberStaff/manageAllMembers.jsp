<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper -->
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.js"> </script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.min.js" integrity="sha384-ODmDIVzN+pFdexxHEHFBQH3/9/vQ9uori45z4JjnFsRydbmQbmL5t1tQ0culUzyK" crossorigin="anonymous"></script>
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
		
		$('#certReason').keyup(function() {
			$('#r4').prop('checked', 'checked');
			var cont = $('#certReason').val()	
			$('#r4').val(cont);
		})
		
		$(".rr01").change(function() {
			if (this.checked) {
				$('#certReason').val('');
			}
		})
		
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

		if(id === 'deport') {
			$('#deportMembers').val(checkObjval);
			$('#selectedNum').text(checkObj.length);
			$("#deportModal").modal('show');
				
			var idArray = checkObjval.split('/');
			idArray.forEach(function(item) {
				$('#idListHere').append('<li>'+item+'</li>')
			})
			
		} else if (id === "email") {
			$('#emailMembers').val(checkObjval);
			document.getElementById('f-email').submit();
		} else if (id === "modify") {
			$('#modifyMembers').val(checkObjval);
			var gr = $('#cafeUserGrade').val()
			$('#gradeLevel').val(gr);
			document.getElementById('f-modify').submit();
		}
		return;
	}
	
	function deportSubmit() {
		document.getElementById('f-deport').submit();
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
                <td align="center"><input type="checkbox" class="registerBan-cb-item" name="temp" value="${dto.userId }"></td>
                <td>${dto.userId} (${dto.cafeUserNickname})</td>
                <td>${dto.cafeUserGrade }</td>
                <td>${dto.cafeUserRegdate }</td>
                <td>최종방문일..?</td>
                <td>${dto.cafeUserVisit }</td>
                <td>${dto.cafeUserWrite} </td>
                <td>${dto.cafeUserReply }</td>
            </tr>
        </c:forEach>
        </tbody>
        
        <tfoot>
            <tr>
            	<th> &nbsp;&nbsp; <input type="checkbox" class="registerBan-cb-all"> </th>
                <th colspan="7">
					선택 멤버를 
					<select id="cafeUserGrade">
						<c:forEach var="grades" items="${gradeList }" varStatus="loop">
							<option value="${loop.count}">${grades}</option>
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
	<input type="hidden" value=${cafeId } name="cafeId">
	
<!-- 모달 영역 -->
<div class="modal fade" id="deportModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel" align="center"> <b>강제 탈퇴 멤버</b></h4>
			</div>
			<div class="modal-body">
				<div class="input-group">
					<span> 선택된 인원 수 : &nbsp;</span>
					<span id="selectedNum"></span>
				</div>
				<ul id="idListHere"> </ul>
				
  				<span class="input-group-addon" id="sizing-addon2"><b>강제탈퇴 사유</b></span> <hr style="margin: 7px;">
					<input type="radio" class="rr01" id="r1" name="reason" value="성인/도박 등 불법광고 및 스팸활동" checked> <label for="r1"> 성인/도박 등 불법광고 및 스팸활동 </label><br>
					<input type="radio" class="rr01" id="r2" name="reason" value="바람직하지 않은 행동 (광고, 도배, 욕설 등)"> <label for="r2"> 바람직하지 않은 행동 (광고, 도배, 욕설 등) </label> <br>
					<input type="radio" class="rr01" id="r3" name="reason" value="우리 카페 내 자체 운영 원칙에 위배되는 활동"> <label for="r3"> 우리 카페 내 자체 운영 원칙에 위배되는 활동 </label> <br>
					<input type="radio" id="r4" name="reason" value="" id="emptyRadio"> <label for="r4"> 기타 </label> <br>
				<div class="input-group">
	  				<input type="text" class="form-control" placeholder="기타 - 한글 25자 이내로 작성해주세요" aria-describedby="sizing-addon2" id="certReason">
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" onclick="deportSubmit()">확인</button>
				<button type="button" class="btn btn-default" data-bs-dismiss="modal">취소</button>
			</div>
		</div>
	</div>
</div>

</form>
<form action="emailMembers" id="f-email" method="post">
	<input type="hidden" value="" name="emailMembers" id="emailMembers">
	<input type="hidden" value=${cafeId } name="cafeId">
</form>
<form action="modifyMembers" id="f-modify" method="post">
	<input type="hidden" value="" name="modifyMembers" id="modifyMembers">
	<input type="hidden" value=${cafeId } name="cafeId">
	<input type="hidden" value="" name="gradeLevel" id="gradeLevel">
</form>
    	</div>
    </div>
</div>
<!-- End of Main Content -->