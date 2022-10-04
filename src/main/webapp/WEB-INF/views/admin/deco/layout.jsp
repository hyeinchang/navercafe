<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="layoutLocation" value="${contextPath}/resources/img/sample/layout"/>
<style>

</style>

  	<!-- Page Wrapper -->
    <div id="wrapper">
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
					
            	<!-- Page Heading -->
               	<h1 class="h3 text-gray-800 cstmTitle">카페 레이아웃</h1>
               	
               	<!-- cstmContent1 -->
               	<div class="cstmContent1">
               	
               		<form name="layoutForm">
               			<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
               			
	               		<div class="cstmGallery1">
	               			<ul>
	               				<li>
	               					<img src="${layoutLocation}/layout_right.png" alt="${layoutLocation}/layout_right.png"" width="450px" onclick="chooseLayout()" title="이미지 보기">
	               					<input type="radio" name="cafeLayout" value="right"${_cafeDTO.cafeLayout eq null || _cafeDTO.cafeLayout eq 'right' ? ' checked' : ''}>
	               				</li>
	               				<li>
	               					<img src="${layoutLocation}/layout_left.png" alt="${layoutLocation}/layout_left.png"" width="450px" onclick="chooseLayout()" title="이미지 보기">
	               					<input type="radio" name="cafeLayout" value="left"${_cafeDTO.cafeLayout eq 'left' ? ' checked' : ''}>
	               				</li>
	               			</ul>
	               		</div>
	              
	             		<div class="btnArea">
	             			<a href="javascript:saveLayout()" class="btn btn-primary btn-icon-split">
	                              <span class="icon text-white-50">
	                                   <i class="fas fa-check"></i>
	                              </span>
	                              <span class="text">저장하기</span>
	                          </a>
	             		</div>
       				</form>
       				
               	</div>
				<!-- End of cstmContent1 -->	
					
            </div>
            <!-- End of Main Content -->
             
 <script type="text/javascript">
 	function chooseLayout() {
 		event.target.nextElementSibling.checked = true;
	}	

 	function saveLayout() {
 		var layoutForm = document.layoutForm;
 		var xhr = new XMLHttpRequest();
 	 	var data = {cafeId : layoutForm.cafeId.value, cafeLayout : layoutForm.cafeLayout.value};
 	 	
 	 	xhr.open('post', '${contextPath}/admin/deco/saveLayout', true);
 	 	xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
 		xhr.setRequestHeader('Content-Type', 'application/json');
 		
 	 	xhr.onreadystatechange = function() {
 	 		if(xhr.readyState == 4 && xhr.status == 200) {
 	 			var message = '';
 	 			
 	 			if(Number(xhr.response) == 1) {
 	 				message = '저장되었습니다.';
 	 			} else {
 	 				message = '저장에 실패했습니다.';
 	 			}
 	 			
 	 			alert(message);
 	 		}
 	 	}
 	 	
 	 	xhr.send(JSON.stringify(data));
 	} 	
 </script>           
