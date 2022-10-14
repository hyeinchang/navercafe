<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="article-attendance">
	<div class="box_calendar">
		<strong class="tit_calendar">2022년 10월</strong> <a
			href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=9"
			onclick="targetChangeForMacSafari('/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=9');return false;"
			class="link_page link_prev">이전달</a> <a
			href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=11"
			onclick="targetChangeForMacSafari('/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=11');return false;"
			class="link_page link_next">다음달</a>
		<ul class="list_day">
			<!-- [D]선택한 날짜 li에 on 추가 -->
			<li><a
				href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=10&amp;search.attendday=1"
				class="link_day">1</a></li>
			<li><a
				href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=10&amp;search.attendday=2"
				class="link_day">2</a></li>
			<li><a
				href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=10&amp;search.attendday=3"
				class="link_day">3</a></li>
			<li><a
				href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=10&amp;search.attendday=4"
				class="link_day">4</a></li>
			<li><a
				href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=10&amp;search.attendday=5"
				class="link_day">5</a></li>
			<li><a
				href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=10&amp;search.attendday=6"
				class="link_day">6</a></li>
			<li><a
				href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=10&amp;search.attendday=7"
				class="link_day">7</a></li>
			<li><a
				href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=10&amp;search.attendday=8"
				class="link_day">8</a></li>
			<li><a
				href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=10&amp;search.attendday=9"
				class="link_day">9</a></li>
			<li><a
				href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=10&amp;search.attendday=10"
				class="link_day">10</a></li>
			<li><a
				href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=10&amp;search.attendday=11"
				class="link_day">11</a></li>
			<li><a
				href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=10&amp;search.attendday=12"
				class="link_day">12</a></li>
			<li><a
				href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=10&amp;search.attendday=13"
				class="link_day">13</a></li>
			<li class="on"><a
				href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendyear=2022&amp;search.attendmonth=10&amp;search.attendday=14"
				class="link_day">14</a></li>
			<li><a class="link_day">15</a></li>
			<li><a class="link_day">16</a></li>
			<li><a class="link_day">17</a></li>
			<li><a class="link_day">18</a></li>
			<li><a class="link_day">19</a></li>
			<li><a class="link_day">20</a></li>
			<li><a class="link_day">21</a></li>
			<li><a class="link_day">22</a></li>
			<li><a class="link_day">23</a></li>
			<li><a class="link_day">24</a></li>
			<li><a class="link_day">25</a></li>
			<li><a class="link_day">26</a></li>
			<li><a class="link_day">27</a></li>
			<li><a class="link_day">28</a></li>
			<li><a class="link_day">29</a></li>
			<li><a class="link_day">30</a></li>
			<li><a class="link_day">31</a></li>
		</ul>
	</div>

	<div class="box_mission">
		<strong class="tit">축하합니다!</strong>
		<p class="txt">오늘은 멤버전원이 출석 체크를 하셨습니다.</p>
	</div>

	<div class="box_write">
		<form name="attendanceFrm" method="post" action="/AttendancePost.nhn">
			<input type="hidden" name="attendancePost.cafeId" value="30790472">
			<input type="hidden" name="attendancePost.menuId" value="8">
			<input type="hidden" name="attendancePost.page" value="1"> <input
				type="hidden" name="attendancePost.emotion" id="emotion" value="11">
			<fieldset>
				<legend class="blind">글쓰기</legend>
				<textarea id="cmtinput" class="tf_write"
					name="attendancePost.content" placeholder="글을 입력해 주세요."></textarea>
				<div class="set_attach">
					오늘의 출첵 멤버 : <em class="count">1명</em> <a href="#"
						id="btn-add-attendance-mission" class="link_mission">출석미션등록</a>

					<button type="button" id="btn-submit-attendance" class="btn_submit">출석하기</button>
				</div>
			</fieldset>
		</form>
	</div>


	<div class="attendance_lst_section">
		<ul class="list_attendance">

			<li>
				<div class="box_user">
					<table role="presentation" cellspacing="0">
						<tbody>
							<tr>
								<td class="pc2w"><a
									href="/ca-fe/cafes/30790472/members/m4SQM-XAnabHnOAYALhViA"><img
										src="https://blogpfthumb-phinf.pstatic.net/MjAyMjA2MjJfNiAg/MDAxNjU1ODYwNDIyMjU4.rHuEetuInw67U4iZV-bPXd1wkdQo0LuvStqrd-ZYEpsg.QOGCxBcJCMgHhKaOtiyLvMEtF80Y0BkEvfnRl2TxgjUg.JPEG.chi9148/profileImage.jpg?type=c77_77"
										width="24" height="24"
										onerror="this.onerror='';this.src='https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png';"></a></td>
								<td class="p-nick"><a href="#" class="link_text"
									onclick="ui(event, 'm4SQM-XAnabHnOAYALhViA',3,'ㅇㅇ','30790472','ma', 'true', 'true', 'itbank9148', 'true', 'null'); return false;">ㅇㅇ</a><span
									class="mem-level"></span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="cmt">
					<p class="txt">4</p>
					<span class="date">2022.10.14. 15:15</span> <a
						href="javascript:deleteAttendanceLog(4);" class="del">삭제</a>
				</div>
			</li>

			<li>
				<div class="box_user">
					<table role="presentation" cellspacing="0">
						<tbody>
							<tr>
								<td class="pc2w"><a
									href="/ca-fe/cafes/30790472/members/m4SQM-XAnabHnOAYALhViA"><img
										src="https://blogpfthumb-phinf.pstatic.net/MjAyMjA2MjJfNiAg/MDAxNjU1ODYwNDIyMjU4.rHuEetuInw67U4iZV-bPXd1wkdQo0LuvStqrd-ZYEpsg.QOGCxBcJCMgHhKaOtiyLvMEtF80Y0BkEvfnRl2TxgjUg.JPEG.chi9148/profileImage.jpg?type=c77_77"
										width="24" height="24"
										onerror="this.onerror='';this.src='https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png';"></a></td>
								<td class="p-nick"><a href="#" class="link_text"
									onclick="ui(event, 'm4SQM-XAnabHnOAYALhViA',3,'ㅇㅇ','30790472','ma', 'true', 'true', 'itbank9148', 'true', 'null'); return false;">ㅇㅇ</a><span
									class="mem-level"></span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="cmt">
					<em class="rank3">3등</em>

					<p class="txt">3</p>
					<span class="date">2022.10.14. 15:15</span> <a
						href="javascript:deleteAttendanceLog(3);" class="del">삭제</a>
				</div>
			</li>

			<li>
				<div class="box_user">
					<table role="presentation" cellspacing="0">
						<tbody>
							<tr>
								<td class="pc2w"><a
									href="/ca-fe/cafes/30790472/members/m4SQM-XAnabHnOAYALhViA"><img
										src="https://blogpfthumb-phinf.pstatic.net/MjAyMjA2MjJfNiAg/MDAxNjU1ODYwNDIyMjU4.rHuEetuInw67U4iZV-bPXd1wkdQo0LuvStqrd-ZYEpsg.QOGCxBcJCMgHhKaOtiyLvMEtF80Y0BkEvfnRl2TxgjUg.JPEG.chi9148/profileImage.jpg?type=c77_77"
										width="24" height="24"
										onerror="this.onerror='';this.src='https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png';"></a></td>
								<td class="p-nick"><a href="#" class="link_text"
									onclick="ui(event, 'm4SQM-XAnabHnOAYALhViA',3,'ㅇㅇ','30790472','ma', 'true', 'true', 'itbank9148', 'true', 'null'); return false;">ㅇㅇ</a><span
									class="mem-level"></span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="cmt">
					<em class="rank2">2등</em>
					<p class="txt">2</p>
					<span class="date">2022.10.14. 15:15</span> <a
						href="javascript:deleteAttendanceLog(2);" class="del">삭제</a>
				</div>
			</li>

			<li>
				<div class="box_user">
					<table role="presentation" cellspacing="0">
						<tbody>
							<tr>
								<td class="pc2w"><a
									href="/ca-fe/cafes/30790472/members/m4SQM-XAnabHnOAYALhViA"><img
										src="https://blogpfthumb-phinf.pstatic.net/MjAyMjA2MjJfNiAg/MDAxNjU1ODYwNDIyMjU4.rHuEetuInw67U4iZV-bPXd1wkdQo0LuvStqrd-ZYEpsg.QOGCxBcJCMgHhKaOtiyLvMEtF80Y0BkEvfnRl2TxgjUg.JPEG.chi9148/profileImage.jpg?type=c77_77"
										width="24" height="24"
										onerror="this.onerror='';this.src='https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafe_profile_77.png';"></a></td>
								<td class="p-nick"><a href="#" class="link_text"
									onclick="ui(event, 'm4SQM-XAnabHnOAYALhViA',3,'ㅇㅇ','30790472','ma', 'true', 'true', 'itbank9148', 'true', 'null'); return false;">ㅇㅇ</a><span
									class="mem-level"></span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="cmt">
					<em class="rank1">1등</em>
					<p class="txt">안녕!</p>
					<span class="date">2022.10.14. 15:15</span> <a
						href="javascript:deleteAttendanceLog(1);" class="del">삭제</a>
				</div>
			</li>
		</ul>


		<div class="prev-next">
			<span class="blind">페이지 네비게이션</span> <span class="blind">페이지
				네비게이션</span> <a
				href="/AttendanceView.nhn?search.clubid=30790472&amp;search.menuid=8&amp;search.attendmonth=10&amp;search.totalCount=4&amp;search.attendday=14&amp;search.attendyear=2022&amp;search.page=1"
				class="on">1</a>
		</div>

		<!--// pagination -->
	</div>
</div>