<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<Script>
	function changeManager() {
		var searchId = document.getElementById('searchResult');
		
		console.log(searchId)
	}
	
</Script>

		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
	<div class="col-lg-8">
	
		<!-- Basic Card Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">매니저 위임</h6>
			</div>
			<div class="card-body">
				매니저 위임을 신청하시면, 위임 받을 멤버가 위임을 수락한 날부터 하루간의 유예기간 후에 위임이 완료되며, 진행상황이 카페 대문에 등록됩니다.
			</div>
		</div>
				                            
		<form id="form1">
			<div class="card mb-4">
				<div class="card-header">
					<b>매니저로 위임할 멤버 선택</b>
				</div>
				<div class="card-body">
					<select>
						<option id="userid">아이디</option>
						<option id="usernickname">별명</option>
					</select>
					<input type="text">
					<input type="button" value="검색" onclick=""> <br>
					<div id="searchResult">11</div>
					
					아이디 해킹이나 카페 매매 등 비정상적, 불법으로 위임된 카페는 위임이 취소되거나, 아이디/카페 제재를 받으실 수 있습니다.
				</div>
			</div>
			
			<div align="center">
				<a href="#" onclick="changeManager()" class="btn btn-success btn-icon-split">
					<span class="icon text-white-50">
					<i class="fas fa-check"></i>
					</span>
					
					<span class="text"> 매니저 위임하기 </span>
				</a>
			</div>
		</form>
	</div>
	</div>
<!-- End of Main Content -->

