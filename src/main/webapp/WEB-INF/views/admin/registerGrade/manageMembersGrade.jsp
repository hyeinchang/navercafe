<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"> </script>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<style>
	.cutdesc {
		width : 599px;
		margin-bottom: 5px;
	}
	
	tbody .text4 {
		width : 60px;
	}
	td p input {
		font-size: 9pt;
		text-align: right;
	}
	td p {
		margin-bottom : 5px; 
	}
	
	.makethemgrey {
		background-color: #868e96;
	}
	
	.nav-pills .nav-item .active {
		font-weight: bold;
	}
	


</style>



<script>
	$(function () {
		
		// 등업방식 change 에 따른 컨디션 블럭 및 메세지 변경
		$('select').on('change', function() {
			var num = this.id.charAt(this.id.length-1)
			var cdn = 'condition'+num;
			var cdnmsg = 'conditionMessage'+num;
			
			if( this.value == 1) {
				$('#'+cdn).hide()
			} else if ( this.value == 2){
				$('#'+cdn).show()
				$('#'+cdnmsg).text('후 만족 시 자동등업')
			} else {
				$('#'+cdn).show()
				$('#'+cdnmsg).text('후 만족 시 등업 신청 가능')
			}
			
		});
		
	})
	
	function changetoAdd(obj) { // -삭제 버튼 클릭 시
		var dID = obj.closest('td').id; //삭제버튼 상위td id
		var num = dID.charAt(dID.length-1)
		var aID = 'addbtn'+num			//추가버튼 상위td id
		var delmsg = 'deletedMessage'+num //삭제 메세지 id
		var cdn = 'condition'+num		//컨디션블럭 id
		var trB = 'trBlock'+num			//tr블럭 id
		var remove = 'cutRemoved'+num		//삭제여부 히든값 id
		
		
		$('#'+dID).hide() //삭제 버튼 숨기기
		$('#'+aID).show() //추가 버튼 보이기
		
		$('#'+delmsg).show() //삭제 메세지 보이기
		$('#'+cdn).hide() // 컨디션 블럭 전체숨기기
		
		$('#'+remove).val('true') //삭제여부 값 true
		
		// 전체 input disable 및 select disable 
		$('#'+trB).children('td').children('input').prop('readonly', true)
		$('#'+trB).children('td').children('input').addClass('makethemgrey');
		$('#'+trB).children('td').children('select').prop('disabled', true)
		
		
		// 히든값  두개 및 추가버튼 able 
		let inleng = $('#'+trB).children('input').length
		/*
		$('#'+trB).children('td').children('input').eq(inleng-1).prop('disabled', false)
		$('#'+trB).children('td').children('input').eq(inleng-2).prop('disabled', false)
		$('#'+trB).children('td').children('input').eq(inleng-3).prop('disabled', false)
		*/
		
	}
	
	function changetoDel(obj) { // + 추가 버튼 클릭 시
		var aID = obj.closest('td').id;
		var num = aID.charAt(aID.length-1)
		var dID = 'deletebtn'+num
		var delmsg = 'deletedMessage'+num
		var cdn = 'condition'+num
		var trB = 'trBlock'+num
		var remove = 'cutRemoved'+num
		
		$('#'+aID).hide()
		$('#'+dID).show()
		
		$('#'+delmsg).hide()
		$('#'+cdn).show()
		
		$('#'+remove).val('false') 
		
		// input 및  셀렉트 전부 활성화
		$('#'+trB).children('td').children('input').prop('readonly', false)
		$('#'+trB).children('td').children('select').prop('disabled', false)
		$('#'+trB).children('td').children('input').removeClass('makethemgrey');
		
	}

	let types = [];


</script>

  	<!-- Page Wrapper -->
    <div id="wrapper">
		<!-- Content Wrapper -->
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
								<a class="nav-link active" aria-current="page" href="${contextPath }/admin/manageMembersGrade">등급 조건 관리</a> 
							</li>
							<li class="nav-item"> 
								<a class="nav-link" href="${contextPath }/admin/manageGradeUpApplies">등급 신청 관리</a> 
							</li>
						</ul>
					</div>
				</div>
               	
               		<form name="f1" id="f1" method="post" action="modifyRegisterInfo">
                    	<div class="form-group">
                    		 <ul>
                    		 	<li> 카페 멤버별 등급 조건을 관리합니다. 멤버의 등업 방식으로 자동등업이나 등업 게시판을 설정할 수 있습니다. </li>
                    		 	<li> 등업게시판 사용 시 메뉴관리에서 등업신청 게시판을 추가해주시기 바랍니다.</li>
                    		 </ul>
                    		 <hr>
                        </div>
                        

                        
                        <div class="form-group">
                        	<table class="table table-borderless">
                        		<colgroup>
								<col width="33">
								<col width="135">
								<col width="599">
								<col width="101">
								<col width="*">
								</colgroup>
  								<thead>
									<tr>
										<th scope="col"><strong class="d-none">등급아이콘</strong></th>
										<th scope="col"><strong>등급명</strong></th>
										<th scope="col"><strong>설명</strong></th>
										<th scope="col"><strong class="">등업방식 </strong></th>
										<th scope="col"><strong class="	d-none">삭제</strong></th>
									</tr>
								</thead>
									
								<tbody id="tbody">
									<tr>
										<td> <img id="iconImg1" src="https://cafe.pstatic.net/levelicon/1/1_1.gif" width="11px" height="11px"> </td>
										<td><input id="conditionName1" type="text" name="cutName" value="새싹멤버"  maxlength="10" ></td>
										<td><input class="cutdesc" id="conditionDesc1" type="text" name="cutDesc" value="가입 후 막 활동을 시작하는 멤버" maxlength="50">
										</td>
											<input type="hidden" name="cafeUserGrade" value="1" > 
											<input type="hidden" name="cutBoard" value="0" > 
											<input type="hidden" name="cutReply" value="0" > 
											<input type="hidden" name="cutVisit" value="0" > 
											<input type="hidden" name="cutRemoved" value="0" >
											<input type="hidden" name="cutType" value="1">
									</tr>
									
									<c:forEach var="dto" items="${list }" varStatus="loop">
										<tr id="trBlock${loop.count+1}">
											<td><img id="iconImg${loop.count+1}" src="https://cafe.pstatic.net/levelicon/1/1_1${loop.count}0.gif" width="11" height="11"> </td>
											<td><input id="conditionName${loop.count+1 }" type="text" name="cutName" value="${dto.cafeUserGrade }"  maxlength="10" ></td>
											<td><input class="cutdesc" id="conditionDesc${loop.count+1}" type="text" name="cutDesc" value="${dto.cutDesc }" maxlength="50" class="text2">
												<p id="condition${loop.count+1}" class="detail" style="">                    
													<label for="sum_write">게시글</label>
													<input type="text" name="cutBoard" id="cutBoard${loop.count+1}" class="text4" value="${dto.cutBoard }" maxlength="5"> 개,&nbsp;&nbsp;
													<label for="sum_reply">댓글</label>
													<input type="text" name="cutReply" id="cutReply${loop.count+1}" class="text4" value="${dto.cutReply }" maxlength="5"> 개,&nbsp;&nbsp;
													<label for="sum_visit">방문</label>
													<input type="text" name="cutVisit" id="cutVisit${loop.count+1}" class="text4" value="${dto.cutVisit }" maxlength="5"> 회&nbsp;&nbsp;
													<span id="conditionMessage${loop.count+1}"> 후 만족 시 자동등업 </span>
												</p>
												<p id="deletedMessage${loop.count+1}" style="display:none;" align="center">해당등급이 삭제 되었습니다.</p>
											</td>
											<td>
												<select id="levelUpMethod${loop.count+1}" name="cutType" class="">
													<option value="1">설정안함</option>
													<option value="2">자동등업</option>
													<option value="3">등업게시판</option>
												</select>
											</td>
											<td id="deletebtn${loop.count+1}"> 
												<input type="button" value="- 삭제" id="" class="btn btn-secondary btn-sm" onclick="changetoAdd(this)" > 
											</td>
											<td id="addbtn${loop.count+1}" style="display:none"> 
												<input type="button" id="" class="btn btn-secondary btn-sm" value="+ 추가" onclick="changetoDel(this)"> 
											</td>
												<input type="hidden" name="cutRemoved" value="${dto.cutRemoved }" id="cutRemoved${loop.count+1}">
												<input type="hidden" name="cafeUserGrade" value="${loop.count+1}">
										</tr>
										
										<script>
											// types 배열에 cutType 저장
											var tempcutType = ${dto.cutType};
											types.push(tempcutType);
										</script>
										
                        			</c:forEach>
                        			
								</tbody>
							</table>
							
							<script>
								//levelUpMethod 셀렉트 밸류값에 따라 선택지정
								for(i = 0; i < 5; i++) { $('#levelUpMethod'+(i+2)).val(types[i]); }
							</script>	
							
                        </div>
                        
             		<div class="btnArea">
             			<a href="#" class="btn btn-primary btn-icon-split" onclick="submitform()">
                              <span class="icon text-white-50">
                                   <i class="fas fa-check"></i>
                              </span>
                              <span class="text">저장하기</span>
                          </a>
             		</div>
                        
                     </form>
                     
                    <script>
                  	
	                 	function submitform() {
	                 		var dataList = new Array();
	                     	var inputList = $('#f1').serializeArray();
	                     	
	                     	for(i = 0; i < inputList.length; i++ ){
	
	                     		if(i % 8 == 0) {
	                     			var obj = new Object()
	                     		}
	                     		
	                     		obj[inputList[i].name] = inputList[i].value
	                     		
	                     		if(i % 8 == 0) {
	                     			dataList.push(obj);
	                     		}
	                     		
	                     	}
	                     	
	                     	var stringified = JSON.stringify(dataList)
	                 		console.log(stringified);
	                 		console.log(dataList);
	                 		
	                 		$.ajax({
	                 			type : 'post',
	                 			contentType : 'application/json; charset=utf-8',
	                 			url : '${contextPath}/admin/modifyRegisterInfo',
	                 			dataType : 'text',
	                 			data : JSON.stringify({data : dataList}),
	                 			success : function(data) {
	                 				console.log(data);
	                 			},
	                 			error : function(request,status,error) {
	                 				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	                 			}
	                 		});
	                 	}
                     </script>
                     
            </div>
            <!-- End of Main Content -->
         