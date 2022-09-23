<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
.mailInfoMessage .mailInfoContent {font-size:0.9rem;}
.contact-form .form-group > input[type="text"] ,
.contact-form .form-group > textarea {width:100%;}
</style>

  	<!-- Page Wrapper -->
    <div id="wrapper">
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
					
            	<!-- Page Heading -->
               	<h1 class="h3 text-gray-800 cstmTitle">전체 멤버에게 메일 보내기</h1>
               	
               	<!-- cstmContent1 -->
				<div class="cstmContent1" style="width:800px;">
					<div id="message"></div>
		          	<form class="contact-form" role="form" name="emailForm" action="sendAllMail" method="POST">
						<input type="hidden" name="cafeId" value="${emailDTO.cafeId}">
						<input type="hidden" name="cafeName" value="${emailDTO.cafeName}">
						
			          	<div class="form-group">
			              	<input type="text" class="form-control" name="subject" placeholder="메일 제목을 입력해주십시오." data-rule="minlen:4">
			              	<div class="validate"></div>
			            </div>
			
			            <div class="form-group">
			              	<textarea class="form-control" name="content" placeholder="메일 내용을 입력해주십시오." rows="12" cols="100" data-rule="required"></textarea>
			              	<div class="validate"></div>
			            </div>
		
			            <div class="loading"></div>
			            <div class="error-message"></div>
			            <div class="sent-message"></div>
			            <div class="mailInfoMessage">
			            	<p class="mailInfoTittle"><b>${emailDTO.cafeName}</b>드림</p>
			            	<ul class="mailInfoContent">
			            		<li>카페 멤버수가 많을 경우 전체 메일 발송이 다소 지연될 수 있습니다.</li>
			            		<li>멤버들의 이용 환경 및 기타 원인으로(휴면계정,스팸메일 등록 등)전체메일이 전달되지 않을 수 있으며,<br>
									홍보성 전체메일, 동일한 전체메일을 반복 발송할 경우 스팸메일로 간주되어 발송되지 않을 수 있습니다.</li>
			            		<li>보내기 버튼은 반드시 한 번만 눌러주시고, 전송이 완료될 때까지 잠시만 기다려 주세요.</li>
			            		<li>전체멤버에게 메일 발송은 카페별로 1일 1회로 제한됩니다.</li>
			            	</ul>
			            </div>
			            
		          	</form>
		          
			       	<div class="btnArea">
	           			<a href="javascript:sendEmail()" class="btn btn-primary btn-icon-split">
	                    	<span class="icon text-white-50">
	                        	<i class="fas fa-check"></i>
	                        </span>
	                        <span class="text">보내기</span>
	                     </a>
	           		</div>  
		
		        </div>
				<!-- End of cstmContent1 -->	
			
			</div>
			<!-- End of Main Content -->
			
<script type="text/javascript">
	function sendEmail() {
		var emailForm = document.emailForm;
		
		for(var i=0;i<emailForm.length;i++) {
			var element = emailForm[i];
			
			if(element.name && element.placeholder && element.value == '') {
				alert(element.placeholder);
				element.focus();
				return;
			}
		}
		
		emailForm.submit();
	}
</script>			