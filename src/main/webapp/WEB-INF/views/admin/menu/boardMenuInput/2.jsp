<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 간편게시판 > 사용 안함 -->
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
				<input type="text" class="ipt_type2" name="boardMenuDesc" value="${menuDTO.boardMenuDesc}" onkeyup="changeMenuValue()" onchange="changeMenuValue()">
			</td>
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
			<td scope="row" colspan="2" class="line"></td>
		</tr>
	</tbody>
</table>
</form>