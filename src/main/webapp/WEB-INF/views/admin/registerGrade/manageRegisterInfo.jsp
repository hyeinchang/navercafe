<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<script>
	
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
               	
               		<form class="cafeRegisterInfo">
                    	<div class="form-group">
                    		<label>가입 안내</label>
                    		 <textarea class="form-control" placeholder="" cols="150" rows="5" name="registerGuide"></textarea>
                    		 <ul>
                    		 	<li>입력한 내용은 멤버의 카페 가입 시 안내 문구로 활용됩니다. </li>
                    		 	<li>HTML 태그는 사용하실 수 없습니다.</li>
                    		 </ul>
                    		 <hr>
                        </div>
                        
                        <div class="form-group">
                        	<div>
                        		<input type="radio" name="join_question" value="false"> 
                        		가입 질문을 사용하지 않습니다
                        	</div>
                        	<div>
                        		<input type="radio" name="join_question" value="true">
                        		가입 질문을 사용합니다.
                        	</div>
                        	
                        	<br>
                        	<div align="center">
                        	<a href="#" class="btn btn-secondary btn-icon-split">
                            	<span class="icon text-white-50">
                                    <i class="fas fa-arrow-right"></i>
                                </span>
                                <span class="text">질문 추가하기 </span>
                                    </a>
                        	</div>
                        	<br>
                        	
                        	<div>
                        		<span>질문 1.</span> 
                        		<input type="text" placeholder="질문을 입력해 주세요" size="100" name="">
                        		<input type="button" value="삭제">
                        		<br>
                        	</div>
                        	
                        	<ul id="description_list">
                        		<li>가입 질문은 3개까지 가능하며, 답변 내용은 전체 멤버 관리의 멤버별 상세 정보 보기에서 확인 할 수 있습니다.</li>
                        		<li>카페 멤버의 개인정보(성명, 연락처, 주소, 학교, 직장명, 출생지 등)를 확인할 수 있는 질문은 <br>
                        			타인의 사생활을 침해할 수 있으며, 카페 운영 목적과 무관하게 임의로 수집 및 이용한 개인정보는 <br>
									법률적 문제가 발생할 수 있으므로 카페 가입 질문은 최소한의 내용으로 작성해주시기 바랍니다. </li>
                        	</ul>
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
				<!-- End of cstmContent1 -->	
					
            </div>
            <!-- End of Main Content -->
         