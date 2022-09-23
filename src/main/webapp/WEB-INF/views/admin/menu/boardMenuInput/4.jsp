<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<form name="menuInfoForm" id="menuInfoForm_${menuDTO.boardOrder}">
<table border="1" cellspacing="0" width="100%">
	<caption>
		<span class="blind" style="display: none;">메뉴관리 설정 정보</span>
	</caption>
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
			<th scope="row" colspan="2" class="line"></th>
		</tr>
		<tr>
			<th scope="row">등업신청 조건</th>
			<td class="last"><p class="p_type3">
					멤버등급관리에서 설정할 수 있습니다.<br>
					<a
						href="https://cafe.naver.com/ManageMemberLevel.nhn?clubid=30790472"
						target="_blank" class="btn_go2">등급 조건 관리</a>
				</p></td>
		</tr>
		<tr>
			<th scope="row" colspan="2" class="line"></th>
		</tr>
		<tr>
			<th scope="row">등업게시판 공지</th>
			<td class="last"><p style="padding-top: 2px;">
					<input id="member1" type="checkbox" class="check"><label
						for="member1" class="ls">등업게시판 상단에 항상 노출되는 메시지를 작성합니다.</label>
				</p>
				<textarea disabled="disabled" unselectable="on"
					class="text unselectable" style="width: 294px; height: 79px;"></textarea>
				<p class="thm tr">
					<em>0</em> / 160byte
				</p></td>
		</tr>
		<tr>
			<th scope="row" colspan="2" class="line"></th>
		</tr>
	</tbody>
</table>
</form>