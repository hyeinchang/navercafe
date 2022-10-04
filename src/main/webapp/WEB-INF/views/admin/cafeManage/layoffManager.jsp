<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="address" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}"/>

<Script>
	function changeManager() {
		var searchId = document.getElementById('searchResult');
		
		console.log(searchId)
	}
	
	function searchfor() {
		var select = $('#selectOpt').val()
		
		if(select == 'id') {
			var uid = $('#searchId').val();
			var cafeId = ${cafeId};
			var dataform = {'id' : uid, 'cafeId' : cafeId}
			
			$.ajax({
				type : 'get',
				contentType : 'application/json; charset=utf-8',
				url : '${contextPath}/admin/searchId',
				dataType : 'text',
				data : dataform,
				success : function(result) {
					$('#searchResult').text(result.substring(0, result.length-1));
					if(result.substring(result.length, result.length-1) == 1) {
						$('#notice').text('님은 우리카페의 회원입니다!')
					} else {
						$('#notice').text('님은 우리카페의 회원이 아닙니다.')
					}
				},
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		} else if (select == 'nickname') {
			var nick = $('#searchId').val();
			var cafeId = ${cafeId};
			var dataform = {'nickname' : nick, 'cafeId' : cafeId}		
			
			$.ajax({
				type : 'get',
				contentType : 'application/json; charset=utf-8',
				url : '${contextPath}/admin/searchNickname',
				dataType : 'text',
				data : dataform,
				success : function(result) {
					$('#searchResult').text(result.substring(0, result.length-1));
					if(result.substring(result.length, result.length-1) == 1) {
						$('#disableFlag').val('1');
						$('#notice').text('님은 우리카페의 회원입니다!');
						console.log('작동')
					} else {
						$('#notice').text('님은 우리카페의 회원이 아닙니다.');
						$('#disableFlag').val('0');
					}
				},
				error : function(request,status,error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
		}
		
	}
	
	function submitf() {
		var flag = $('#disableFlag').val()
		console.log(flag)
		if( flag == 0 ) {
			alert('매니저를 위임할 멤버를 검색 및 선택해주세요')
		} else {
			$('#f1').submit();
		}
	}
	
</Script>


  	<!-- Page Wrapper -->
    <div id="wrapper">
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
            
				<!-- Page Heading -->
               	<h1 class="h3 text-gray-800 cstmTitle">매니저 위임</h1>
               	<p class="mb-4">매니저 위임을 신청하시면, 위임 받을 멤버가 위임을 수락한 날부터 하루간의 유예기간 후에 위임이 완료되며, 진행상황이 카페 대문에 등록됩니다.</p>
              
                <!-- cstmContent1 -->
               	<div class="cstmContent1">
               		
               		<form class="form" id="f1" action="changeManager" method="post">
               			<input type="hidden" value="${cafeId }" name="cafeId">
						<div class="card mb-4">
							<div class="card-header">
								<b>매니저로 위임할 멤버 선택</b>
							</div>
							<div class="card-body">
								<div class="form-group">
		                    		<select name="" aria-controls="dataTable" class="custom-select form-control" id="selectOpt">
										<option value="id">아이디</option>
										<option value="nickname">별명</option>
									</select>
		                        	<input type="text" class="form-control form-control-user" placeholder="카페 아이디를 입력해주십시오." id="searchId" name="uid">
		                            <a href="#" class="btn btn-success btn-icon-split" onclick="searchfor()">
		                                <span class="icon text-white-50">
		                                    <i class="fas fa-check"></i>
		                                </span>
		                                <span class="text">검색</span>
		                         	</a>
	                       		</div>
								<div> <span id="searchResult"></span> <span id="notice"></span></div>
								아이디 해킹이나 카페 매매 등 비정상적, 불법으로 위임된 카페는 위임이 취소되거나, 아이디/카페 제재를 받으실 수 있습니다.
							</div>
						</div>
					</form>
					
             		<div class="btnArea">
             			<input type="hidden" value="" id="disableFlag">
             			<a href="#" class="btn btn-primary btn-icon-split" onclick="submitf()">
                              <span class="icon text-white-50">
                                   <i class="fas fa-check"></i>
                              </span>
                              <span class="text">매니저 위임하기</span>
                          </a>
             		</div>
               	</div>
 				<!-- End of cstmContent1 -->
 				
			</div>
			<!-- End of Main Content -->

