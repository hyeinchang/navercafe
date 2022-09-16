<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://code.jquery.com/jquery-3.5.1.js"> </script>

<style>
	#question_ul li:not(:last-child) {
		margin-bottom: 5px;
	}
</style>

<script>
		
	$(document).ready(function () {
		
		console.log(${regiInfo.join_question})
		
		if( ${regiInfo.join_question} == true) {
			$('#join_qt02').attr('checked', 'checked')
			
			//isquestionnull 해결해야댐
			//console.log('${regiInfo.isQuestionNull}')
			
			if (${regiInfo.isQuestionNull} == true) {
				console.log('트루')
			}
			
		} else {
			$('#join_qt01').attr('checked', 'checked')
		}
		
		$(".checkC").change(function() {
			if( $("#join_qt01").is(':checked') ) {
				$('#question_option').hide();
				console.log('1번체크됨?')
			} else {
				$('#question_option').show();				
				console.log('2번체크됨?')
			}
			
			if( $('#question_ul').children().length == 3) {
				$('#addQuestionBtn').hide();
			} else {
				$('#addQuestionBtn').show();
			}
		})
		
		
	})
	
	
	var blockcount = $('#question_ul').children().length
	function addQuestionBlock() {
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
               	
               		<form class="modifyRegisterInfo">
                    	<div class="form-group">
                    		<label>가입 안내</label>
                    		 <textarea class="form-control" placeholder="" cols="150" rows="5" name="explanation"></textarea>
                    		 <ul>
                    		 	<li>입력한 내용은 멤버의 카페 가입 시 안내 문구로 활용됩니다. </li>
                    		 	<li>HTML 태그는 사용하실 수 없습니다.</li>
                    		 </ul>
                    		 <hr>
                        </div>
                        
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
                        	<hr>
                        </div>
                        
                        <div class="form-group">
                        	<label>카페 이름</label>
                            <input type="text" class="form-control form-control-user" placeholder="카페 이름을 입력해주십시오.">
                        </div>
                         <div class="form-group">
                        	<label>카페 소개</label>
                            <textarea class="form-control" placeholder="카페 소개를 입력해주십시오." cols="50" rows="5"></textarea>
                        </div>
                     </form>
             		
             		<div class="btnArea">
             			<a href="#" class="btn btn-primary btn-icon-split">
                              <span class="icon text-white-50">
                                   <i class="fas 	fa-check"></i>
                              </span>
                              <span class="text">저장하기</span>
                          </a>
             		</div>
               	</div>
               </div>
				<!-- End of cstmContent1 -->	
					
            </div>
            <!-- End of Main Content -->
         