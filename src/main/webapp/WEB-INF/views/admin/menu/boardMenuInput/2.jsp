<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<form name="menuInfoForm" id="menuInfoForm_${menuDTO.boardOrder}">
<table border="1" cellspacing="0" width="100%" summary="메뉴관리 설정">
	<caption style="display: none;">메뉴관리 설정 정보</caption>
	<colgroup>
		<col width="130">
		<col width="*">
	</colgroup>
	<tbody>
		<tr>
			<th>메뉴명</th>
			<td>
				<input type="text" class="ipt_type" name="boardMenuName" value="${menuDTO.boardMenuName}" onkeyup="changeMenuValue()">
			</td>
		</tr>
		<tr>
			<th style="padding: 4px 0px 0px;">메뉴 설명</th>
			<td style="padding: 0px 0px 14px;">
				<input type="text" class="ipt_type2" name="boardMenuDesc" value="${menuDTO.boardMenuDesc}" onkeyup="changeMenuValue()"></td>
		</tr>
		<tr>
			<td scope="row" colspan="2" class="line"></td>
		</tr>
		<tr>
			<th scope="row">권한 설정</th>
			<td class="">
				<div class="type_box">
					<p class="">
						<strong>글쓰기</strong>
						<select style="width: 145px;" name="boardWriteAuth" onchange="changeMenuValue()">
							<option	value="1">새싹멤버</option>
							<option value="110">일반멤버</option>
							<option value="120">성실멤버</option>
							<option value="130">열심멤버</option>
							<option value="140">우수멤버</option>
							<option value="150">감사멤버</option>
							<option value="888">카페스탭</option>
							<option value="999">카페매니저</option>
						</select> 이상
					</p>
					<p>
						<strong>댓글쓰기</strong>
						<select style="width: 145px;" name="boardReplyAuth" onchange="changeMenuValue()">
							<option value="1">새싹멤버</option>
							<option value="110">일반멤버</option>
							<option value="120">성실멤버</option>
							<option value="130">열심멤버</option>
							<option value="140">우수멤버</option>
							<option value="150">감사멤버</option>
							<option value="888">카페스탭</option>
							<option value="999">카페매니저</option></select> 이상
					</p>
					<p class="p_last">
						<strong>읽기</strong>
						<select style="width: 145px;" name="boardReadAuth" onchange="changeMenuValue()">
							<option value="0">전체공개</option>
							<option value="1">새싹멤버</option>
							<option value="110">일반멤버</option>
							<option value="120">성실멤버</option>
							<option value="130">열심멤버</option>
							<option value="140">우수멤버</option>
							<option value="150">감사멤버</option>
							<option value="888">카페스탭</option>
							<option value="999">카페매니저</option>
						</select> 이상
					</p>
				</div>
			</td>
		</tr>
		<tr>
			<td scope="row" colspan="2" class="line"></td>
		</tr>
	</tbody>
</table>
</form>