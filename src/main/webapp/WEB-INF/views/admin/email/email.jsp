<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Content Wrapper -->
<div id="content-wrapper" class="d-flex flex-column">

<!-- Main Content -->
<div id="content">

		    <div class="container clearfix">
		          <h4 class="title">전체 멤버에게 메일 보내기</h4>
		          <div id="message"></div>
		          <form class="contact-form php-mail-form" role="form" action="sendAllMail" method="POST">
		
		            <div class="form-group">
		              <input type="text" name="subject" class="form-control" id="contact-subject" placeholder="제목" data-rule="minlen:4" data-msg="제목을 적어주세요">
		              <div class="validate"></div>
		            </div>
		
		            <div class="form-group">
		              <textarea class="form-control" name="content" id="content" placeholder="" rows="12" data-rule="required" data-msg="내용을 작성해주세요"></textarea>
		              <div class="validate"></div>
		            </div>
		
		            <div class="loading"></div>
		            <div class="error-message"></div>
		            <div class="sent-message"></div>
		            <div> cafeName 드림 </div>
		            <div>
		            	<ul>
		            		<li>카페 멤버수가 많을 경우 전체 메일 발송이 다소 지연될 수 있습니다.</li>
		            		<li>멤버들의 이용 환경 및 기타 원인으로(휴면계정,스팸메일 등록 등)전체메일이 전달되지 않을 수 있으며,<br>
								홍보성 전체메일, 동일한 전체메일을 반복 발송할 경우 스팸메일로 간주되어 발송되지 않을 수 있습니다.</li>
		            		<li>보내기 버튼은 반드시 한 번만 눌러주시고, 전송이 완료될 때까지 잠시만 기다려 주세요.</li>
		            		<li>전체멤버에게 메일 발송은 카페별로 1일 1회로 제한됩니다.</li>
		            	</ul>
		            </div>
		
		            <div class="form-send">
		              <button type="submit" class="btn btn-large btn-primary" >보내기</button>
		            </div>
		
		          </form>
		        </div>
		
		        <div class="clearfix"></div>
		        <div class="divider"></div>

</div>
<!-- End of Main Content -->