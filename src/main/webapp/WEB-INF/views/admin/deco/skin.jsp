<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="skinLocation" value="${contextPath}/resources/img/sample/skin"/>
<style>

</style>

  	<!-- Page Wrapper -->
    <div id="wrapper">
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
					
            	<!-- Page Heading -->
               	<h1 class="h3 text-gray-800 cstmTitle">카페 스킨</h1>
               	
               	<!-- cstmContent1 -->
               	<div class="cstmContent1" style="width:1010px;">
               	
               		<form name="skinForm">
               			<input type="hidden" name="cafeId" value="${cafeDTO.cafeId}">
               			
	               		<div class="cstmGallery1">
	               			<ul>
	               				<c:forEach var="skin" items="${skinList}">
	               				<li>
	               					<div>${skin}</div>
	               					<img src="${skinLocation}/skin_${skin}.png" alt="${skinLocation}/skin_${skin}.png" width="300px" onclick="chooseSkin()" title="이미지 보기">
	               					<input type="radio" name="cafeSkin" value="${skin}"${cafeDTO.cafeSkin == skin ? ' checked' : ''}>
	               				</li>
	               				</c:forEach>
	               			</ul>
	               		</div>
	              
	             		<div class="btnArea">
	             			<a href="javascript:saveSkin()" class="btn btn-primary btn-icon-split">
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
 	// 해당 스킨 샘플 스킨 이미지 클릭시 이벤트
 	function chooseSkin() {
 		var modalContent = document.querySelector('.modalContent');
 		var img = document.createElement('img');
		var chooseSkin = event.target;
 		var imgPath = chooseSkin.src;
 		var imgSrcArr =  imgPath.split('/');
		var fileName = imgSrcArr[imgSrcArr.length-1];
		
 		img.src = imgPath;
 		img.alt = fileName;
 		img.title = fileName;
 		
 		modalContent.innerHTML = '';
 		modalContent.appendChild(img);
 		
 		showModal();
 		
 		chooseSkin.nextElementSibling.checked = true;
	}	
 	
 	// 스킨 저장
 	function saveSkin() {
 		var skinForm = document.skinForm;
 		var xhr = new XMLHttpRequest();
 	 	var data = {cafeId : skinForm.cafeId.value, cafeSkin : skinForm.cafeSkin.value};
 	 	
 	 	xhr.open('post', '${contextPath}/admin/deco/saveSkin', true);
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
