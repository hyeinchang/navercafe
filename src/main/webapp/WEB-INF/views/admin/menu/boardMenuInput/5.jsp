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
				<br>
				<span class="p_type2">
					<input id="member1" type="checkbox"class="check" name="boardPublicFlag" value="N" onchange="changeMenuValue()">
					<label for="member1">멤버에게만 공개</label>
				</span>
			</td>
		</tr>
		<tr>
			<th scope="row" colspan="2" class="line"></th>
		</tr>
	</tbody>
</table>
</form>