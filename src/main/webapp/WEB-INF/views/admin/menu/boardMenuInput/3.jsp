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
			<th scope="row" colspan="2" class="line"></th>
		</tr>
		<tr>
			<th scope="row">형태</th>
			<td class="solo"><p class="ra_tx_area" style="margin-top: 2px;">
					<span class="in_ra"><input id="ra_type2" type="radio"
						class="check" value="STAFFWEBZINE"><label for="ra_type2">카드형</label></span><span
						class="in_ra"><input id="ra_type3" type="radio"
						class="check" value="STAFFALBUM"><label for="ra_type3">앨범형</label></span><span><input
						id="ra_type4" type="radio" class="check" value="STAFFNORMAL"><label
						for="ra_type4">게시판형</label></span>
				</p></td>
		</tr>
		<tr>
			<th scope="row" colspan="2" class="line"></th>
		</tr>
	</tbody>
</table>
</form>