<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 통합게시판 -->
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
				<input type="text" class="ipt_type" name="boardMenuName" value="${menuDTO.boardMenuName}" onkeyup="changeMenuValue()" onchange="changeMenuValue()">
			</td>
		</tr>
		<tr>
			<th style="padding: 4px 0px 0px;">메뉴 설명</th>
			<td style="padding: 0px 0px 14px;">
				<input type="text" class="ipt_type2" name="boardMenuDesc" value="${menuDTO.boardMenuDesc}" onkeyup="changeMenuValue()" onchange="changeMenuValue()"></td>
		</tr>
		<tr>
			<th scope="row" colspan="2" class="line"></th>
		</tr>
		<tr>
			<th scope="row">권한 설정</th>
			<td class="">
				<div class="type_box">
					<p class="">
						<strong>글쓰기</strong>
						<select style="width: 145px;" name="boardWriteAuth" onchange="changeMenuValue()">
							<c:forEach var="grade" items="${gradeList}">
							<option	value="${grade.cafeUserGrade}"${menuDTO.boardWriteAuth eq grade.cafeUserGrade ? ' selected' : ''}>${grade.cutName}</option>
							</c:forEach>
							<option value="999"${menuDTO.boardWriteAuth eq 999 ? ' selected' : ''}>카페매니저</option>
						</select> 이상
					</p>
					<p>
						<strong>댓글쓰기</strong>
						<select style="width: 145px;" name="boardReplyAuth" onchange="changeMenuValue()">
							<c:forEach var="grade" items="${gradeList}">
							<option	value="${grade.cafeUserGrade}"${menuDTO.boardReplyAuth eq grade.cafeUserGrade ? ' selected' : ''}>${grade.cutName}</option>
							</c:forEach>
							<option value="999"${menuDTO.boardWriteAuth eq 999 ? ' selected' : ''}>카페매니저</option>
						</select> 이상
					</p>
					<p class="p_last">
						<strong>읽기</strong>
						<select style="width: 145px;" name="boardReadAuth" onchange="changeMenuValue()">
							<c:forEach var="grade" items="${gradeList}">
							<option	value="${grade.cafeUserGrade}"${menuDTO.boardReadAuth eq grade.cafeUserGrade ? ' selected' : ''}>${grade.cutName}</option>
							</c:forEach>
							<option value="999"${menuDTO.boardWriteAuth eq 999 ? ' selected' : ''}>카페매니저</option>
						</select> 이상
					</p>
				</div>
			</td>
		</tr>
		<tr>
			<th scope="row" colspan="2" class="line"></th>
		</tr>
		<tr>
			<th scope="row" class="solo">공개설정</th>
			<td class="solo">
				<p class="ra_tx_area">
					<span class="in_ra">
						<input id="defaultWriteOpenType1" type="radio" class="check" name="boardPublicFlag" value="Y" 
							onchange="changeMenuValue()"${menuDTO.boardPublicFlag eq 'Y' ||  menuDTO.boardPublicFlag eq null ? ' checked' : ''}>
						<label for="defaultWriteOpenType1">전체공개</label>
					</span>
					<span>
							<input id="defaultWriteOpenType2" type="radio" class="check" name="boardPublicFlag" value="N"
						onchange="changeMenuValue()"${menuDTO.boardPublicFlag eq 'N' ? ' checked' : ''}>
						<label for="defaultWriteOpenType2">멤버공개</label>
					</span>
				</p>
				<p class="p_type">
					게시글 공개 범위를 전체로 기본 설정합니다.<br>단, 작성자가 게시글 작성 시 변경할 수 있습니다.
				</p>
				<p class="p_type" style="display: none;">
					게시글 공개 범위를 카페 멤버로 기본 설정합니다.<br>단, 작성자가 게시글 작성 시 변경할 수 있습니다.
				</p></td>
		</tr>
		<tr>
			<th scope="row" colspan="2" class="line"></th>
		</tr>
		<tr>
			<th scope="row" class="solo">좋아요 기능</th>
			<td class="solo">
				<input id="in_type6" name="boardLikesFlag" type="checkbox" class="check" value="Y"
					onchange="changeMenuValue()"${menuDTO.boardLikesFlag eq 'Y' ||  menuDTO.boardLikesFlag eq null ? ' checked' : ''}>
				<label for="in_type6">사용</label>
			</td>
		</tr>
		<tr style="display:none;">
			<th scope="row" class="solo4">게시글 설정</th>
			<td class="solo4"><div class="ch_view">
					<p>
						<input id="in_type6_1" type="checkbox" class="check"><label
							for="in_type6_1" class="blind">좋아요 게시판 상단 올라가도록 설정 사용</label>
						'좋아요' 점수가 <select disabled="disabled"><option value="1">
								1점</option>
							<option value="2">2점</option>
							<option value="3">3점</option>
							<option value="4">4점</option>
							<option value="5">5점</option>
							<option value="6">6점</option>
							<option value="7">7점</option>
							<option value="8">8점</option>
							<option value="9">9점</option>
							<option value="10">10점</option>
							<option value="15">15점</option>
							<option value="20">20점</option>
							<option value="25">25점</option>
							<option value="30">30점</option>
							<option value="35">35점</option>
							<option value="40">40점</option>
							<option value="45">45점</option>
							<option value="50">50점</option>
							<option value="55">55점</option>
							<option value="60">60점</option>
							<option value="65">65점</option>
							<option value="70">70점</option>
							<option value="75">75점</option>
							<option value="80">80점</option>
							<option value="85">85점</option>
							<option value="90">90점</option>
							<option value="95">95점</option>
							<option value="100">100점</option></select> 이상인 글 중
					</p>
					<div style="margin-left: 19px; line-height: 24px;">
						<select disabled="disabled"><option value="1">
								상위 1개</option>
							<option value="2">상위 2개</option>
							<option value="3">상위 3개</option>
							<option value="4">상위 4개</option>
							<option value="5">상위 5개</option></select> 가 게시판 상단에 올라가도록 설정합니다.
					</div>
				</div></td>
		</tr>
		<tr style="display:none;">
			<th scope="row" colspan="2" class="line"></th>
		</tr>
		<tr style="display:none;">
			<th scope="row">형태</th>
			<td class=""><p class="ra_tx_area" style="margin-top: 2px;">
					<span class="in_ra"><input id="ra_type2" type="radio"
						class="check" value="WEBZINE"><label for="ra_type2">카드형</label></span><span
						class="in_ra"><input id="ra_type3" type="radio"
						class="check" value="ALBUM"><label for="ra_type3">앨범형</label></span><span><input
						id="ra_type4" type="radio" class="check" value="NORMAL"><label
						for="ra_type4">게시판형</label></span>
				</p></td>
		</tr>
		<tr style="display:none;">
			<th scope="row" class="dh_p2">글양식 사용</th>
			<td class="dh_p"><select style="width: 242px;"><option
						value="0">사용안함</option>
					<option value="17987">양식1</option></select><a href="#"
				class="btn_modification">수정하기</a>
			<p>&nbsp;</p></td>
		</tr>
		<tr style="display:none;">
			<th scope="row" colspan="2" class="line"></th>
		</tr>
		<tr style="display:none;">
			<th scope="row" class="solo">말머리</th>
			<td class="solo">
				<input id="in_type7" type="checkbox" class="check" name="boardPrefixesFlag" value="Y"
					onchange="changeMenuValue()"${menuDTO.boardPrefixesFlag eq 'Y' ||  menuDTO.boardPrefixesFlag eq null ? ' checked' : ''}>
				<label for="in_type7">사용</label>
			</td>
		</tr>
		<tr>
			<th scope="row" colspan="2" class="line"></th>
		</tr>
	</tbody>
</table>
</form>