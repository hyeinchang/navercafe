<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	.join_info{
		display: table;
		width: 100%;
		table-layout: fixed; padding: 20px 0;
		border-bottom: 1px solid #ebecef;
	}
	.join_info_head{
		display: table-cell; width: 108px; vertical-align: top;
	}
	.join_info_body{
		display: table-cell;
	}
	.input_text{
		width: 256px;
		height: 36px;
		border-radius: 6px;
		padding: 0 38px 0 12px;
		border: 0;
		font-size: 14px;
		color: #000000;
		background-color: #f5f6f8;
	}
	.btn_close{
		position: absolute;
		top: 10px; right: 10px;
		display: inline-block;
		width: 16px; height: 16px;
		background: none;
		
		background-image: url(https://ca-fe.pstatic.net/web-pc/static/img/sprite_icon_354827.svg#icon_search_delete-usage);
		
	}
	.qna_area{
		display: block; width: 100%; height: 60px;
		margin-top: 9px;
		padding: 9px 18px 11px 12px;
		box-sizing: border-box;
		border-radius: 6px;
		border: 0;
		font-size: 13px;
		line-height: 20px;
		color: #000000;
		background-color: #f5f6f8;
		resize: vertical;
	}
	.wqe{
		word-wrap : break-word;
		word-break : keep-all;
	}
	.signbutton{
		display: inline-block;
		border-radius: 6px;
		box-sizing: border-box;
		font-weight: 700;
		text-align: center;
		vertical-align: top;
		background: rgba(3,199,90,0.12);
		text-decoration: none;
		cursor: pointer;
		min-width: 46px;
		height: 36px; padding: 0 12px;
		font-size: 13px;
		line-height: 36px;
	}
</style>
<div	class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent"
	${cafeDTO.cafeLayout > 0 ? '' : 'style="float:right;"'} >
	
	<h2>
		<b>카페 가입하기</b>
	</h2>
	<p>카페 가입을 위한 정보를 입력해주세요.</p>
	<div style="margin-top: 30px; padding: 8px 32px 32px; border: 1px solid #ebecef; line-height: 20px; border-radius: 10px;">
		<form action="cafeRegApp" method="post" name="signupForm">
			<input type="hidden" value="${cafeId}" name="cafeId">
			<input type="hidden" value="${loginId}" name="userId">
			<div class="join_info">
				<div class="join_info_head">
					<strong style="line-height: 20px;">카페설명</strong>
				</div>
				<div class="join_info_body">
					카페설명 내용~
				</div>
			</div>
			<div class="join_info">
				<div class="join_info_head">
					<strong style="line-height: 20px;">가입안내</strong>
				</div>
				<div class="join_info_body">
					가입안내 내용~
				</div>
			</div>
			<!-- 카페 가입 설명, 안내  -->
			<div class="join_info">
				<div class="join_info_head">
					<strong style="line-height: 20px;">닉네임</strong>
				</div>
				<div class="join_info_body">
					<div style="position: relative; display: inline-block; margin: 0; padding: 0;">
						<input class="input_text" type="text" placeholder="닉네임" name="cafeUserNickname">
						<button type="button" class="btn_close"></button>
					</div>
				</div>
			</div>
			<div class="join_info">
				<div class="join_info_head">
					<strong style="line-height: 20px;">가입질문</strong>
				</div>
				<div class="join_info_body">
					<div>
						<strong style="line-height: 20px;">질문1</strong>
						<textarea class="qna_area" rows="2" cols="60" name="answer1"></textarea>
					</div>
					<div>
						<label style="cursor: default;">질문2</label>
						<textarea class="qna_area" rows="2" cols="60" name="answer2"></textarea>
					</div>
					<div>
						<label class="wqe">질문3</label>
						<textarea class="qna_area" rows="2" cols="60" name="answer3"></textarea>
					</div>
				</div>
			</div>
			<div style="margin-top: 16px; text-align: center;">
				<button class="signbutton" type="submit">
					<span style="color: #009f47">동의 후 가입하기</span>
				</button>
			</div>
		</form>
	</div>
	
</div>
<script type="text/javascript">
 var nick = document.getElementById("nickName"); 
	function reset(){
	nick.value() = "";
 }
</script>
<!-- end content -->