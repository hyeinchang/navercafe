<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<c:set var="address" value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}"/>
<style>
.CreateCafe .createCafeForm { background: #fff; border-radius: 6px; padding: 10px 15px 25px;
}
.CreateCafe .cafe_input { width: 100%; box-sizing: border-box;}
.CreateCafe .cafe_input th {
	padding: 16px;
    border-bottom: 1px solid #eaeaea;
    text-align: left;
    vertical-align: top;
}
.CreateCafe .cafe_input td {
    padding: 16px;
    border-bottom: 1px solid #eaeaea;
    font-size: 13px;
}
.CreateCafe .cafe_input .input_title {
    font-size: 14px;
}
.CreateCafe .cafe_input .input_title .mandatory {
    margin-left: 2px;
    color: #03c75a;
}
</style>
  	<!-- Page Wrapper -->
    <div id="wrapper">
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
					
            	<!-- Page Heading -->
               	<h1 class="h3 text-gray-800 cstmTitle">카페 만들기</h1>
               	
               	<!-- cstmContent1 -->
               	<div class="cstmContent1 CreateCafe">
               	
               		<form class="createCafeForm" name="createCafeForm">
               			<input type="hidden" name="userId" value="${loginId}">
                    	<table cellspacing="0" class="cafe_input">
						<caption>
							<span class="blind" style="display:none;">카페 만들기 입력 양식</span>
						</caption>
						<colgroup>
							<col width="122">
							<col width="*">
						</colgroup>
						<tbody>
							<tr class="cafe_name">
								<th scope="row"><div class="input_title">
										<strong class="tit">카페이름<span class="mandatory">*</span></strong>
									</div></th>
								<td><div class="input_area">
										<div class="FormInputText" byte="0">
											<input type="text" placeholder="카페 이름을 입력해주세요" title="카페이름"
												class="input_text input_txt">
										</div>
									</div>
									
									</td>
							</tr>
							<tr class="cafe_url">
								<th scope="row"><div class="input_title">
										<strong class="tit">카페주소<span class="mandatory">*</span></strong>
										
									</div></th>
								<td><div class="input_area">
										<label for="cafe_addr">https://cafe.naver.com/</label>
										<div class="FormInputText" id="cafe_addr" byte="0">
											<input type="text" placeholder="카페 주소를 입력해주세요" title="카페주소"
												class="input_text input_txt">
										</div>
										<span class="btn_box"><button class="btn_auto">자동생성</button></span>
									</div>
									
									</td>
							</tr>
							<tr class="cafe_icon">
								<th scope="row"><div class="input_title off">
										<strong class="tit">카페아이콘<span class="mandatory"></span></strong>
										
									</div></th>
								<td><div class="SectionCreateCafeIcon">
										<div class="thmb">
											<button type="button" title="카페아이콘 등록">
												<svg width="112" height="112" viewBox="0 0 112 112" fill="none"
													xmlns="http://www.w3.org/2000/svg">
													<mask id="mask">
													<path fill-rule="evenodd" clip-rule="evenodd"
														d="M112 56.108C112 47.2456 111.238 39.1218 109.971 32.6038C109.957 32.4935 109.95 32.3802 109.936 32.2685C109.912 32.0751 109.891 31.8803 109.862 31.6869C109.762 30.986 109.645 30.2896 109.503 29.6023C109.498 29.5766 109.491 29.5524 109.486 29.5283C109.348 28.8621 109.185 28.205 109.007 27.554C108.96 27.3818 108.909 27.2096 108.86 27.0359C108.704 26.4936 108.533 25.9573 108.353 25.4256C108.306 25.2882 108.262 25.1492 108.212 25.0133C107.734 23.6749 107.177 22.3758 106.545 21.119C106.487 21.0042 106.428 20.8895 106.369 20.7762C106.077 20.2127 105.772 19.6568 105.451 19.11C105.418 19.0511 105.384 18.9907 105.349 18.9318C104.607 17.6856 103.786 16.4907 102.896 15.3518L102.767 15.1886C101.401 13.4575 99.8761 11.8608 98.2108 10.4183C98.2002 10.4107 98.1881 10.4017 98.1775 10.3911C96.4819 8.92439 94.6423 7.62072 92.6815 6.49989C90.898 5.22951 88.072 4.08305 84.4913 3.11479C84.2837 3.0589 84.0777 3.00301 83.867 2.95014C76.8179 1.13295 66.9791 0 56.0659 0C44.83 0 34.7306 1.20243 27.645 3.11479C27.5344 3.145 27.4238 3.17213 27.3147 3.20235C23.8841 4.15248 21.1762 5.26883 19.4443 6.50447C19.4109 6.52259 19.3776 6.54672 19.3427 6.56635C18.8775 6.83372 18.4245 7.12078 17.9729 7.41081C17.7835 7.53014 17.5926 7.6449 17.4062 7.77028C16.9955 8.04369 16.5985 8.33525 16.2 8.62528C15.9833 8.78238 15.7636 8.93489 15.5515 9.09652C15.1999 9.36842 14.859 9.65247 14.5165 9.93494C14.2726 10.1374 14.0256 10.3352 13.7877 10.5422C13.4952 10.8005 13.2119 11.0693 12.927 11.3367C12.6573 11.5904 12.3845 11.8382 12.1224 12.0995C11.8845 12.3367 11.6572 12.5859 11.4238 12.8306C11.1344 13.1373 10.8419 13.4424 10.5616 13.7597C10.3752 13.9741 10.1979 14.1947 10.0161 14.4137C9.71001 14.7778 9.40392 15.1418 9.1145 15.5179C8.97055 15.7037 8.83569 15.897 8.69779 16.0874C8.38564 16.5103 8.07652 16.9318 7.78407 17.3684C7.71891 17.465 7.65679 17.5647 7.59466 17.6629C7.57041 17.7022 7.54617 17.74 7.52041 17.7777C7.50526 17.8034 7.4901 17.8275 7.47343 17.8517C7.16583 18.329 6.86277 18.8079 6.57638 19.2988C6.56123 19.329 6.54153 19.3547 6.52486 19.3849C5.67933 20.5631 4.88986 22.2051 4.16858 24.2111C3.86855 24.974 3.59125 25.7474 3.34577 26.5359C3.32001 26.6159 3.30183 26.6976 3.27607 26.7791C2.78814 28.3848 2.41235 30.0419 2.1593 31.7367C0.81523 38.359 0 46.7305 0 55.892C0 64.7544 0.763707 72.8782 2.02898 79.3962C2.04262 79.5065 2.05019 79.6198 2.06383 79.7316C2.08959 79.925 2.10929 80.1198 2.13808 80.3116C2.23809 81.0141 2.35629 81.7103 2.49721 82.3976C2.50175 82.4233 2.50933 82.4475 2.51388 82.4717C2.65328 83.1378 2.81542 83.7949 2.99271 84.4459C3.0412 84.6181 3.0912 84.7905 3.13969 84.9642C3.29728 85.5065 3.46699 86.0427 3.64731 86.5744C3.69429 86.7118 3.73975 86.8508 3.78824 86.9867C4.26555 88.3251 4.8247 89.6226 5.45506 90.8809C5.51416 90.9957 5.57326 91.1105 5.63235 91.2238C5.92329 91.7873 6.22786 92.3431 6.54911 92.8899C6.58396 92.9488 6.61578 93.0093 6.65214 93.0682C7.39464 94.3144 8.21593 95.5093 9.10541 96.6482L9.23421 96.8114C10.5995 98.5425 12.1254 100.138 13.7892 101.582C13.7998 101.589 13.8119 101.598 13.8225 101.609C15.5181 103.076 17.3577 104.379 19.3185 105.5C21.1035 106.77 23.928 107.917 27.5087 108.884C27.7163 108.941 27.9239 108.997 28.133 109.05C35.1836 110.867 45.0224 112 55.9341 112C67.17 112 77.2694 110.798 84.3565 108.884C84.4656 108.855 84.5762 108.828 84.6868 108.798C88.1159 107.847 90.8237 106.731 92.5557 105.496C92.5891 105.477 92.6224 105.453 92.6573 105.434C93.1225 105.166 93.577 104.879 94.0286 104.589C94.218 104.47 94.4089 104.354 94.5953 104.23C95.0044 103.956 95.403 103.665 95.8015 103.375C96.0167 103.218 96.2379 103.065 96.4485 102.903C96.8016 102.632 97.141 102.348 97.4835 102.065C97.7274 101.863 97.9744 101.665 98.2123 101.456C98.5063 101.2 98.7881 100.931 99.0745 100.663C99.3427 100.409 99.6155 100.162 99.8776 99.9004C100.116 99.6632 100.344 99.4141 100.576 99.1694C100.866 98.8627 101.16 98.5576 101.438 98.2404C101.625 98.0259 101.804 97.8054 101.985 97.5863C102.292 97.2223 102.596 96.8583 102.886 96.4821C103.029 96.2948 103.164 96.1029 103.304 95.9126C103.616 95.4896 103.925 95.0682 104.216 94.6316C104.283 94.5334 104.343 94.4353 104.405 94.3371C104.431 94.2978 104.455 94.26 104.48 94.2207C104.495 94.1966 104.511 94.1725 104.527 94.1483C104.834 93.671 105.139 93.1921 105.424 92.7011C105.44 92.6709 105.46 92.6437 105.475 92.615C106.321 91.4368 107.11 89.7949 107.831 87.7889C108.131 87.0275 108.409 86.2526 108.654 85.4641C108.68 85.384 108.7 85.3024 108.724 85.2209C109.213 83.6136 109.588 81.9581 109.841 80.2632C111.185 73.641 112 65.2695 112 56.108Z"
														fill="#F5F6F8"></path></mask>
													<image mask="url(#mask)"
														xlink:href="https://ssl.pstatic.net/static/cafe/cafe_pc/default/cafeicon_default_112x112.png"
														width="112" height="112" alt="이미지를 등록하세요"></image></svg>
											</button>
										</div>
										<p class="cafe_icon_guide">
											모바일에서 우리 카페를 표현할 카페 아이콘을 등록해주세요.<br>등록하신 아이콘은 모바일 웹, 카페 앱 및
											PC 카페 &gt; 네임 카페 등에 활용됩니다.
										</p>
									</div>
									
									</td>
							</tr>
							<tr class="cafe_public_type">
								<th scope="row"><div class="input_title">
										<strong class="tit">카페 공개 설정<span class="mandatory">*</span></strong>
										
									</div></th>
								<td><ul class="txt_area">
										<li><div class="FormInputRadio">
												<input id="publicCafe" type="radio" name="publicCafe"
													class="input_radio" value="false"><label
													for="publicCafe" class="label"> 공개 카페 (바로 가입) </label>
											</div>
											<p class="info">누구나 바로 가입</p></li>
										<li><div class="FormInputRadio">
												<input id="publicCafe2" type="radio" name="publicCafe"
													class="input_radio" value="false"><label
													for="publicCafe2" class="label"> 공개 카페 (가입 승인) </label>
											</div>
											<p class="info">매니저 승인 후 가입</p></li>
										<li><div class="FormInputRadio">
												<input id="privateCafe" type="radio" name="publicCafe"
													class="input_radio" value="false"><label
													for="privateCafe" class="label"> 비공개 카페 (초대 승인) </label>
											</div>
											<p class="info">매니저 초대를 통해 가입</p></li>
									</ul>
									<p class="txt">신규 카페의 경우 개설 후 24시간 경과 후에 검색에 반영됩니다.</p>
									
									</td>
							</tr>
							<tr class="cafe_use_name">
								<th scope="row"><div class="input_title">
										<strong class="tit">이름 사용 여부<span class="mandatory">*</span></strong>
										
									</div></th>
								<td><div class="txt_area">
										<div class="FormInputRadio">
											<input id="useNick" type="radio" name="useName"
												class="input_radio" value="false"><label for="useNick"
												class="label"> 별명 사용 </label>
										</div>
										
										<p class="txt" style="display: none;">멤버관리메뉴에 이름이 공개됩니다.</p>
									</div>
									
									</td>
							</tr>
							<tr class="cafe_member_list">
								<th scope="row"><div class="input_title">
										<strong class="tit">멤버 목록<span class="mandatory">*</span></strong>
										
									</div></th>
								<td><div class="txt_area">
										<div class="FormInputRadio">
											<input id="publicMemberList" type="radio" name="memberList"
												class="input_radio" value="true"><label
												for="publicMemberList" class="label"> 공개 </label>
										</div>
										<div class="FormInputRadio">
											<input id="privateMemberList" type="radio" name="memberList"
												class="input_radio" value="false"><label
												for="privateMemberList" class="label"> 비공개 </label>
										</div>
										<p class="txt">멤버목록을 매니저, 부매니저, 멤버등급스탭 이상만 열람할 수 있습니다.</p>
									</div>
									
									</td>
							</tr>
							
							<tr class="cafe_description">
								<th scope="row"><div class="input_title">
										<strong class="tit">카페 설명<span class="mandatory">*</span></strong>
										
									</div></th>
								<td><div class="input_area">
										<div class="FlexableTextArea" byte="0">
											<textarea placeholder="카페 설명을 입력해주세요."
												class="textarea_input input_txt" style="height: 60px;"></textarea>
										</div>
										<span class="byte">0/100</span>
									</div>
									<p class="txt">입력한 내용이 카페 메인, 검색결과등의 카페리스트에 반영 됩니다.</p>
									</td>
							</tr>
							<tr class="cafe_captcha">
								<th scope="row"><div class="input_title">
										<strong class="tit">보안 절차<span class="mandatory">*</span></strong>
										
									</div></th>
								<td><div class="SectionCreateCafeCaptcha">
										<div class="captcha_area">
											<img
												src="https://captcha.nid.naver.com/nhncaptchav4.gif?key=p8kZfM51uYqmsv1F&amp;0&amp;1"
												width="200" height="125" alt="">
											
											<div class="captcha_inner">
												<p class="captcha_description">
													네이버 카페는 프로그램을 이용한 자동 개설을 방지하기 위해서 보안절차를 거치고 있습니다.<br> 왼쪽
													이미지를 보이는 대로 입력해주세요.
													
												</p>
												<div class="input_text_area">
													<div class="FormInputText">
														<input type="text" placeholder="" title="그림문자 입력"
															class="input_text input_txt">
													</div>
													<button class="captcha_btn btn_re">새로고침</button>
													<input type="hidden">
													<button class="captcha_btn btn_voice">음성으로 듣기</button>
													
												</div>
												
											</div>
										</div>
									</div>
									
									</td>
							</tr>
							<tr class="cafe_accept">
								<th scope="row"><div class="input_title">
										<strong class="tit">정책 동의<span class="mandatory">*</span></strong>
									</div></th>
								<td><div class="privacy_policy">
										<div class="FormInputCheck">
											<input id="chk_ok_privacy" type="checkbox" class="input_check"><label
												for="chk_ok_privacy" class="label"> 카페 개인정보보호정책에 동의합니다. </label>
										</div>
										
										<a href="#" class="more">자세히보기</a>
									</div></td>
							</tr>
						</tbody>
					</table> 
					</form>
             		
             		<div class="btnArea">
             			<a href="#" class="btn btn-primary btn-icon-split">
                              <span class="icon text-white-50">
                                   <i class="fas fa-check"></i>
                              </span>
                              <span class="text">저장하기</span>
                          </a>
             		</div>
               	</div>
				<!-- End of cstmContent1 -->	
					
            </div>
            <!-- End of Main Content -->
         