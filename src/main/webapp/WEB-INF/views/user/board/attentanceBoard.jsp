<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<style>

</style>
	<div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${_cafeDTO.cafeLayout eq 'left' ? '' : 'style="float:right;"'}>
       	<section class="section1">
		    <div class="container clearfix">
		      <div class="title">
		       	<h4>
		          <span>${boardMenuName}</span>
		        </h4>
		      </div>
		      <div class="col-lg-10 col-md-10 col-sm-10 clearfix">
		      	<!-- 출석부 -->
				<div class="article-attendance">
					<div class="box_calendar">
						<strong class="tit_calendar">${dateInfo.year}년  <fmt:formatNumber value="${dateInfo.month}" pattern="00"/>월</strong> <a
							href="javascript:moveDate('${dateInfo.prevMonthText}')"
							class="link_page link_prev">이전달</a> <a
							href="javascript:moveDate('${dateInfo.nextMonthText}')"
							class="link_page link_next">다음달</a>
						<ul class="list_day">
							<c:forEach var="date" begin="1" end="${dateInfo.lastDate}">
							<fmt:formatNumber var="monthText" value="${dateInfo.month}" pattern="00"/>
							<fmt:formatNumber var="dateText" value="${date}" pattern="00"/>
							<c:set var="classOn" value="${date == dateInfo.date ? ' class=\"on\"' : ''}"/>
							<c:set var="searchDate" value="${dateInfo.year}-${monthText}-${dateText}"/>
							<c:choose>
							<c:when test="${dateInfo.isAfter(searchDate, dateInfo.todayText)}">
							<li>${dateText}</li>
							</c:when>
							<c:otherwise>
							<li${classOn}>
								<a href="javascript:moveDate('${searchDate}')"
								class="link_day">${dateText}</a>
							</li>
							</c:otherwise>
							</c:choose>
							</c:forEach>
						</ul>
					</div>
				
					<div class="box_mission col-lg-10"${_cafeDTO.countMap.totalCafeMember != userCount ? ' style="display:none;"' : ''}>
						<strong class="tit">축하합니다!</strong>
						<p class="txt">오늘은 멤버전원이 출석 체크를 하셨습니다.</p>
					</div>

					<c:if test="${dateInfo.targetDateText eq dateInfo.todayText}">
					<div class="box_write col-lg-10">
						<!--  출석부 작성 부분-->
				        <div class="memo-board">
				            <form name="attendanceForm" id="attendanceForm" method="post" action="">
				            	<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
				            	<input type="hidden" name="userId" value="${_cafeDTO.loginUser.userId}">
				            	<input type="hidden" name="boardMenuNum" value="${menuDTO.boardMenuNum}">
				            	<input type="hidden" name="boardTitle" value="${menuDTO.boardMenuName}의 게시글">

				              	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				                	<textarea class="form-control memo-board-content" name="boardContent" rows="6" placeholder="글을 입력해 주세요."></textarea>
				                	<div class="set_attach">
										오늘의 출첵 멤버 : <strong class="count">${userCount}</strong>명
										<button type="button" id="btn-submit-attendance" class="btn_submit" onclick="writeBoard()">출석하기</button>
									</div>
				              	</div>
				           </form>
					    </div>
				      	<!-- 출석부 메모 작성 부분 -->
					</div>
					</c:if>
				
					<div class="attendance_lst_section col-lg-10">
						<ul class="list_attendance">
							<c:if test="${boardList eq null || boardList.size() == 0}">
							<p style="text-align:center;">등록된 게시글이 없습니다.</p>
							</c:if>
							<c:forEach var="board" items="${boardList}">			
							<li>
								<div class="box_user">
									<table role="presentation" cellspacing="0">
										<tbody>
											<tr>
												<td class="pc2w">
													<a href="javascript:alert('준비중')">
													<c:choose>
													<c:when test="${board.cafeUserImageNum > 0}">
														<img src="${contextPath}/file/download?cafeUserImageNum=${board.cafeUserImageNum}" class="profileImg-small"
															onerror="${contextPath}/resources/img/Users-Folder-icon.png" alt="프로필 이미지">
													</c:when>	
													<c:otherwise>
														<img src="${contextPath}/resources/img/Users-Folder-icon.png" class="profileImg-small" alt="프로필 이미지 없음">
													</c:otherwise>
													</c:choose>	
													</a>
													</td>
												<td class="p-nick">
													<a href="#" class="user_nickname">${board.cafeUserNickname}</a>
													<c:if test="${(board.cafeUserGrade >= 0 && board.cafeUserGrade <= 5) || board.cafeUserGrade == 999}">
			              							<img src="${contextPath}/resources/img/grade/icon/level${board.cafeUserGrade}.gif">
			              							</c:if>
			              						</td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="cmt">
									<c:forEach var="rank" items="${rankList}" varStatus="status">
									<c:set var="index" value="${status.index}"/>
									<c:if test="${index == 0 && rank == board.boardNum}">
									<em class="rank1">1등</em>
									</c:if>
									<c:if test="${index == 1 && rank == board.boardNum}">
									<em class="rank2">2등</em>
									</c:if>
									<c:if test="${index == 2 && rank == board.boardNum}">
									<em class="rank3">3등</em>
									</c:if>
									</c:forEach>
									
									<p class="txt">${board.boardContent}</p>
									<span class="date"><fmt:formatDate value="${board.boardSaveDate}" pattern="YYYY.MM.dd. HH:mm"/></span> 
									<a href="javascript:deleteBoard(${board.boardNum})" class="del">삭제</a>
								</div>
							</li>
							</c:forEach>
						</ul>
						
						<!-- 페이징  -->
						<div class="paging" align="center">
							<c:if test="${menuDTO.totalPage > 0}">
							<ul class="pagination">
								<li><a href="javascript:movePage(1)">&lt;&lt;</a></li>
						      	<li><a href="javascript:movePage(${menuDTO.startPage > 1 ? menuDTO.startPage-1 : 1})">&lt;</a></li>
					          	<c:forEach var="page" begin="${menuDTO.startPage}" end="${menuDTO.endPage}">
					            <li${menuDTO.page eq page ? ' class="active"' : ''}><a href="javascript:movePage(${page})">${page}</a></li>
					          	</c:forEach>
					          	<li><a href="javascript:movePage(${menuDTO.endPage < menuDTO.totalPage ? menuDTO.endPage+1 : menuDTO.totalPage })">&gt;</a></li>
					          	<li><a href="javascript:movePage(${menuDTO.totalPage})">&gt;&gt;</a></li>
							</ul>
							</c:if>
						</div>
												
					</div>
				</div>
				<!-- end 출석부 -->
				
		      </div>
		      <!-- end content -->
		    </div>
		    <!-- end container -->
		  </section>
      </div>
      <!-- end content -->
<form name="boardListForm">
	<input type="hidden" name="cafeId" value="${_cafeDTO.cafeId}">
   	<input type="hidden" name="boardMenuNum" value="${menuDTO.boardMenuNum}">
	<input type="hidden" name="searchDate" value="${menuDTO.searchDate}">
	<input type="hidden" name="page" value="${menuDTO.page}">
</form>
<script type="text/javascript">
	//게시글 수정
	function writeBoard() {
		var form = document.attendanceForm;
		var xhr = new XMLHttpRequest();
		var boardContent = form.boardContent;
		var data = new Object();
		
		if(boardContent.value == '') {
			alert('내용을 입력해주세요.');
			boardContent.focus();
			return;
		}
		
		data = getData(form);
		
		xhr.open('post', '${contextPath}/user/board/writeBoard', false);
		xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
		xhr.setRequestHeader('Content-Type', 'application/json');
		
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
	 			var message = '';
	 			
	 			if(Number(xhr.response) == 1) {
	 				movePage(1);
	 			} else {
	 				alert('저장에 실패했습니다.');
	 			}
			}
		}
		
		xhr.send(JSON.stringify(data));
	}
	
	// form data를 object로 반환
	function getData(form) {
		var data = new Object();
		
		for(var i=0;i<form.length;i++) {
			var element = form[i];
			
			if(element.name && element.value) {
				data[element.name] = element.value;
			}
		}
		
		return data;
	}
	// 게시글 삭제
	function deleteBoard(boardNum) {
		if(confirm('게시글을 삭제하시겠습니까?')) {
			var xhr = new XMLHttpRequest();
			var data = {'boardNum' : boardNum};
			
			xhr.open('post', '${contextPath}/user/board/deleteBoard', false);
			xhr.setRequestHeader('X-Requested-With', 'XMLHttpRequest');
			xhr.setRequestHeader('Content-Type', 'application/json');
			
			xhr.onreadystatechange = function() {
				if(xhr.readyState == 4 && xhr.status == 200) {
		 			if(Number(xhr.response) == 1) {
		 				movePage(0);
		 			} else {
		 				alert('삭제에 실패했습니다.');
		 			}
				}
			}
			
			xhr.send(JSON.stringify(data));
		}
	}
	
	// 날짜 이동
	function moveDate(date) {
		var form = document.boardListForm;
		
		form.action = '${contextPath}/user/board/goBoardList';
		form.searchDate.value = date;
		form.page.value = 1;
		form.submit();
	}
	
	// 페이지 이동
	function movePage(page) {
		var form = document.boardListForm;
		
		form.action = '${contextPath}/user/board/goBoardList';
		
		if(page > 0) {
			form.page.value = page;
		} 
		form.submit();
	}
</script>      