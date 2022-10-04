<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"> </script>

<style>
	#question_ul li:not(:last-child) {
		margin-bottom: 5px;
	}
	table tr {
		border-bottom: 1px solid #dcdcdc;
	}
	table th {
		color : rgb(60,60,60);
		vertical-align: top;
		padding-top: 20px;
		padding-bottom: 10px;
	}
	table td {
		padding-top: 20px;
		padding-bottom: 10px;
	}
</style>

<script>
		
	$(document).ready(function () {
		
		var jq = ${regiInfo.join_question}; //질문 사용 여부
		var qQty = ${regiInfo.questionQty}; //저장된 질문 개수
		
		if (jq == true) {
			$('#join_qt02').attr('checked', 'checked');
			
			for(i = 1; i <= qQty; i++) {
				addQuestionBlock(); //저장된 질문 개수따라 질문 블럭 생성
			}
			
			// 질문 블럭 내용채우기
			if(qQty == 3) {
				$('#q1content').val('${regiInfo.q1Content}')
				$('#q2content').val('${regiInfo.q2Content}')
				$('#q3content').val('${regiInfo.q3Content}')
			} else if (qQty == 2) {
				$('#q1content').val('${regiInfo.q1Content}')
				$('#q2content').val('${regiInfo.q2Content}')				
			} else if (qQty == 1) {
				$('#q1content').val('${regiInfo.q1Content}')
			}			
			
		} else {
			$('#join_qt01').attr('checked', 'checked');
			$('#question_option').hide();
		}
		
		
		// 페이지 로드당시 나이제한 정보 default값 
		var year1 = ${regiInfo.selectYear1};
		var year2 = ${regiInfo.selectYear2};
		$('#selectYear1').val(year1)
		$('#selectYear2').val(year2)
		
		var agecon = '${regiInfo.ageCondition}';
		if ( agecon == 'true') {
			$('#ageCondition02').prop('checked', 'checked');
		} else {
			$('#ageCondition01').prop('checked', 'checked');
		}
		
		//성별값으로 radio default 선택
		var gencon = '${regiInfo.cafeJoinGender}';
		if(gencon == "both") {
			$('#genderCondition01').prop('checked', 'checked');
		} else if(gencon == 'male') {
			$('#genderCondition02').prop('checked', 'checked');
		} else if(gencon == 'female') {
			$('#genderCondition03').prop('checked', 'checked');
		}
		
		$(".checkC").change(function() {
			if ( $("#join_qt01").is(':checked') ) {
				$('#question_option').hide();
			} else {
				$('#question_option').show();				
			}
			
			if ( $('#question_ul').children().length == 3) {
				$('#addQuestionBtn').hide();
			} else {
				$('#addQuestionBtn').show();
			}
		})
		
		$('.selectYear').change(function() {
			$('#ageCondition02').prop('checked', 'checked');
		})
	
	})
	
	var blockcount = $('#question_ul').children().length
	function addQuestionBlock() { //질문 추가 버튼 
		$('#question_ul').append('<li id="q'+(blockcount+1)+'li"> <div> <span id="q'+(blockcount+1)+'sp">스팬</span> <input type="text" id="q'+(blockcount+1)+'content" placeholder="질문을 입력해 주세요" size="100" name="q'+(blockcount+1)+'Content"> <input id="q'+(blockcount+1)+'btn" type="button" value="삭제" onclick="deleteBtn(q'+(blockcount+1)+'li)"> </div> </li>');
		$('#q'+(blockcount+1)+'sp').text('질문 '+(blockcount+1)+'.')
		blockcount = $('#question_ul').children().length
		
		if(blockcount == 3) {
			$('#addQuestionBtn').hide();
		}
	}
	
	function deleteBtn(obj) {
		var removedLiNum = parseInt(obj.id[1]);
		
		if( removedLiNum < 3) {
			var forNum;
			if (removedLiNum == 1) {
				forNum = 2;
			} else if (removedLiNum == 2) {
				forNum = 1;
			}
			
			for(i = 0; i<forNum; i++) {
				// 리스트 아이디 변경
				$('#q'+(removedLiNum+1)+'li').attr("id", 'q'+(removedLiNum)+'li')
				// 리스트 버튼 onclick, id 변경
				$('#q'+(removedLiNum+1)+'btn').attr("onclick", 'deleteBtn('+'q'+(removedLiNum)+'li'+')')
				$('#q'+(removedLiNum+1)+'btn').attr("id", 'q'+(removedLiNum)+'btn')
				// 스팬 내용, id변경
				$('#q'+(removedLiNum+1)+'sp').text('질문 '+(removedLiNum)+'.')
				$('#q'+(removedLiNum+1)+'sp').attr("id", 'q'+(removedLiNum)+'sp')
				// input name, id 변경
				$('#q'+(removedLiNum+1)+'content').attr("name", 'q'+(removedLiNum)+'content')
				$('#q'+(removedLiNum+1)+'content').attr("id", 'q'+(removedLiNum)+'content')
				removedLiNum++;
			}
		}
		
		obj.remove();
		blockcount--;
		
		if(blockcount < 3) {
			$('#addQuestionBtn').show();
		}
		
	}
	
	function cancelmod() {
		if(window.confirm('지금까지 편집한 내용을 취소하시겠습니까?')) {
			window.location.reload();
		}
	}
	
	function submitf() {
		if( $('#ageCondition02').is(':checked')) {
			if( $('#selectYear1').val() == '-1' || $('#selectYear2').val() == '-1') {
				alert('가입조건에서 생년기준을 선택해주세요')
			} else {
				$('#modifyRegisterInfo').submit();
			}
		} else {
			$('#modifyRegisterInfo').submit();
		}
	}
	
</script>


  	<!-- Page Wrapper -->
    <div id="wrapper">
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
					
            	<!-- Page Heading -->
               	<h1 class="h3 text-gray-800 cstmTitle">가입 정보관리</h1>
               	
               	<!-- cstmContent1 -->
               	<div class="cstmContent1">
               		
               		<form id="modifyRegisterInfo" method="post" action="modifyRegisterInfo">
               		<input type="hidden" name="cafeId" value="${cafeId }">
               		<table>
               			<colgroup>
               				<col width="191">
               				<col width="*">
               			</colgroup>
               			
               			<tr>
                    		<th> 
                    			<label>가입 안내</label>
                    		</th>
                    		
                    		<td>
		                    	<div class="form-group">
		                    		 <textarea class="form-control" placeholder="" cols="150" rows="5" name="explanation">${regiInfo.explanation}</textarea>
		                    		 <ul>
		                    		 	<li>입력한 내용은 멤버의 카페 가입 시 안내 문구로 활용됩니다. </li>
		                    		 	<li>HTML 태그는 사용하실 수 없습니다.</li>
		                    		 </ul>
		                        </div>
                        	</td>
                       </tr>
                        
                       <tr>
                       		<th>
                       			<label>가입 질문</label>
                       		</th>
                       	
                       		<td>
	                       	 	<div class="form-group">
	                        	<div>
	                        		<input type="radio" id="join_qt01" name="join_question" value="false" class="checkC"> 
	                        		<label for="join_qt01"> 가입 질문을 사용하지 않습니다 </label>
	                        	</div>
	                        	<div>
	                        		<input type="radio" id="join_qt02" name="join_question" value="true" class="checkC">
	                        		<label for="join_qt02"> 가입 질문을 사용합니다. </label>
	                        	</div>
	                        	
	                        	<div id="question_option">
	                        	
	                        		<ul id="question_ul">
	                        		</ul>
		                        	
		                        	<div align="center" id="addQuestionBtn">
			                        	<a href="#" class="btn btn-secondary btn-icon-split" onclick="addQuestionBlock()">
			                            	<span class="icon text-white-50">
			                                    <i class="fas fa-arrow-right"></i>
			                                </span>
			                                <span class="text">질문 추가하기 </span>
			                                    </a>
		                        	</div>
		                        	
			                        <br>
		                        	<ul id="description_list">
		                        		<li>가입 질문은 3개까지 가능하며, 답변 내용은 전체 멤버 관리의 멤버별 상세 정보 보기에서 확인 할 수 있습니다.</li>
		                        		<li>카페 멤버의 개인정보(성명, 연락처, 주소, 학교, 직장명, 출생지 등)를 확인할 수 있는 질문은 <br>
		                        			타인의 사생활을 침해할 수 있으며, 카페 운영 목적과 무관하게 임의로 수집 및 이용한 개인정보는 <br>
											법률적 문제가 발생할 수 있으므로 카페 가입 질문은 최소한의 내용으로 작성해주시기 바랍니다. </li>
		                        	</ul>
	                        	</div>
	                       		</div>
                        	</td>
                        </tr>
                        
                        <tr>
                        	<th>
                        		<label> 가입 조건 성별 </label>
                        	</th>
                        
                        	<td>
                      	  		<div class="form-check form-check-inline">
	                            	<label for="genderCondition01" class="form-check-label">모두&nbsp;</label> 
	                            	<input type="radio" name="cafeJoinGender" value="both" id="genderCondition01" class="form-check-input" checked="checked">&nbsp;
	                            	<label for="genderCondition02" class="form-check-label">남자만&nbsp;</label> 
	                            	<input type="radio" name="cafeJoinGender" value="male" id="genderCondition02" class="form-check-input">&nbsp;
	                             	<label for="genderCondition03" class="form-check-label">여자만&nbsp;</label> 
	                             	<input type="radio" name="cafeJoinGender" value="female" id="genderCondition03" class="form-check-input">
	                        	</div>
	                        </td>
                        </tr>
                        
                        <tr>
                        	<th>
                        		<label> 가입 조건 연령 </label>
                        	</th>
                        	
                        	<td>
                        		<input type="radio" name="ageCondition" id="ageCondition01" value="false" checked="checked">
                        		<label for="ageCondition01"> 모두 </label>  &nbsp;
                        		<input type="radio" name="ageCondition" id="ageCondition02" value="true">
                        		<select name="selectYear1" class="selectYear" id="selectYear1">
                        			<option value="-1">선택</option> 
                        			<option value="1950">제한없음</option> 
                        			<c:forEach begin="1950" end="2022" var="i">
                        				<option value="${3972 - i}"> ${3972 - i} </option>
                        			</c:forEach>
                        		</select>
                        		<label> 년부터 </label>
                        		<select name="selectYear2" class="selectYear" id="selectYear2">
                        			<option value="-1">선택</option> 
                        			<option value="2022">제한없음</option> 
                        			<c:forEach begin="1950" end="2022" var="i">
                        				<option value="${3972 - i}"> ${3972 - i} </option>
                        			</c:forEach>
                        		</select>
                        		<label> 년 까지 출생한 사람만 </label>
                        		
                        		<ul>
                        			<li>카페 운영 목적에 따라 "가입조건 연령"을 설정할 수 있습니다.</li>
                        			<li>이는 띠 모임, 동창 등 특정 연령(대)의 커뮤니티 활동을 지원하는 기능 입니다.</li>
                        			<li>단, 음란물이나 기타 청소년에게 유해한 정보를 공유하는 것은 자제 부탁 드립니다.</li>
                        		</ul>
                        	</td>
                        </tr>
                     </table>
                     
                     </form>
             		
             		<div class="btnArea">
             			<a href="#" class="btn btn-secondary btn-icon-split" onclick="cancelmod()">
                              <span class="icon text-white-50">
                                   <i class="fa-solid fa-x"></i>
                              </span>
                              <span class="text">취소</span>
                          </a>
             			<a href="#" class="btn btn-primary btn-icon-split" onclick="submitf()">
                              <span class="icon text-white-50">
                                   <i class="fas fa-check"></i>
                              </span>
                              <span class="text">저장하기</span>
                          </a>
             		</div>
               	</div>
				<!-- End of cstmContent1 -->	
					
            </div>
            <!-- End of Main Content -->
         