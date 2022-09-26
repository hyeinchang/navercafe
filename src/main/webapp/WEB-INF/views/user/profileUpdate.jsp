<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
프로필 사진, 중복확인<br>
유져닉네임
<div	class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent"
	${cafeDTO.cafeLayout > 0 ? '' : 'style="float:right;"'} >
	
	<h2>
		<b>프로필 수정</b>
	</h2>
	<div style="margin-top: 30px; padding: 8px 32px 32px; border: 1px solid #ebecef; line-height: 20px; border-radius: 10px;">
		<form action="profilesubmit" method="post" name="profilForm">
			<input type="hidden" value="${cafeId}" name="cafeId" id="cafeId">
			<input type="hidden" value="${loginId}" name="userId">
			<input type="hidden" value="${cafeMember.cafeUserNickname }" name="oldNick" id="oldNick">
			<div class="join_info">
				<div class="join_info_head">
					<strong style="line-height: 20px;">닉네임</strong>
				</div>
				<div class="join_info_body">
					<div style="position: relative; display: inline-block; margin: 0; padding: 0;">
						<input class="input_text" type="text" placeholder="닉네임" name="cafeUserNickname" id="cafeUserNickname" value="${cafeMember.cafeUserNickname }" onkeyup="idOverlap()">
						<span id="confirm"></span>
						<p style="font-size: 13px;">한글 1~10자, 영문 대소문자 2~20자, 숫자를 사용할 수 있습니다.(혼용가능)</p>
						<p style="font-size: 13px;">중복되지 않은 별명으로 변경해주세요.</p>
					</div>
				</div>
			</div>
			<div class="join_info">
				<div class="join_info_head">
					<strong style="line-height: 20px;">프로필 이미지</strong>
				</div>
				<div class="join_info_body">
					프로필 사진 등록!@!@
					<div style="position: relative; display: inline-block; margin: 0; padding: 0;">
						<input class="input_text" type="text" placeholder="닉네임" name="userNickname">
					</div>
					<p>프로필은 카페별로 설정가능합니다.</p>
				</div>
			</div>
			<div class="join_info">
				<div class="join_info_head">
					<strong style="line-height: 20px;">성별연령대공개</strong>
				</div>
				<div class="join_info_body">
					<div>
						<c:if test="${cafeMember.cafeUserGenderReveal eq 'Y' }">
							<input type="radio" name="cafeUserGenderReveal" checked="checked" value="Y">
							<label>허용</label>
							<input type="radio" name="cafeUserGenderReveal" value="N">
							<label>비허용</label>
						</c:if>
						<c:if test="${cafeMember.cafeUserGenderReveal eq 'N' }">
							<input type="radio" name="cafeUserGenderReveal"  value="Y">
							<label>허용</label>
							<input type="radio" name=cafeUserGenderReveal  checked="checked" value="N">
							<label>비허용</label>
						</c:if>
						<p>카페 운영진이 내 성별과 연령대를 확인할 수 있습니다.</p>
					</div>
				</div>
			</div>
			<div class="join_info">
				<div class="join_info_head">
					<strong style="line-height: 20px;">전체메일 수신</strong>
				</div>
				<div class="join_info_body">
					<div>
						<c:if test="${cafeMember.cafeUserEmailReceieve eq 'Y' }">
							<input type="radio" name="cafeUserEmailReceieve" checked="checked" value="Y">
							<label>허용</label>
							<input type="radio" name="cafeUserEmailReceieve"  value="N">
							<label>비허용</label>
						</c:if>
						<c:if test="${cafeMember.cafeUserEmailReceieve eq 'N' }">
							<input type="radio" name="cafeUserEmailReceieve"  value="Y">
							<label>허용</label>
							<input type="radio" name=cafeUserEmailReceieve  checked="checked" value="N">
							<label>비허용</label>
						</c:if>
						<p>카페 운영진이 보내는 메일을 수신합니다.</p>
					</div>
				</div>
			</div>
			<div style="margin-top: 16px; text-align: center;">
				<button class="btn" type="button" style="background-color: gray;">
					<span >취소</span>
				</button>
				<button class="btn" type="submit">
					<span >수정</span>
				</button>
			</div>
		</form>
	</div>
	<script type="text/javascript" src="resources/js/jquery3.6.0.js"></script>
	<script type="text/javascript">
		function idOverlap(){
			let idCheck = document.getElementById("cafeUserNickname").value;
			let oldNick = document.getElementById("oldNick").value;
			let cafeId = document.getElementById("cafeId").value;
			let confirm = document.getElementById("confirm");
			
			$.ajax({
				type : "POST",
				url : "nickCheck",
				data : {"id" : idCheck,"cafeId":cafeId,"oldNick":oldNick},
				dataType : "text",
				success : function(data){
					if(data=="OK"){
						confirm.style.color="#0000ff";
						confirm.innerHTML = "사용 가능한 닉네임 입니다.";
					}else{
						confirm.style.color="#ff0000";
						confirm.innerHTML = "사용 불가능한 닉네임 입니다.";
					}
				},
				error : function(){
					alert("에러ㅓㅓ")
				}
			});
		}
	</script>
</div>

