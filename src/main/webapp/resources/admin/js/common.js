/**
 * 관리자 공통 js 파일
 */
 
// 모달 출력 
function showModal() {
	var modalMask = document.querySelector('.modalMask');
	var modalBody = document.querySelector('.modalBody');
	var windowWidth = window.outerWidth;
	var windowHeighth = window.outerHeight;
	var modalWidth = 0;
	var modalHeight = 0;
 
	modalMask.style.display = 'block';
	
	modalWidth = modalBody.offsetWidth;
	modalHeight = modalBody.offsetHeight;
	
	modalBody.style.position = 'absolute';
 	modalBody.style.left = (windowWidth/2 - modalWidth/2) + 'px';
 	modalBody.style.top = (windowHeighth/2 - modalHeight/2) + 'px';
}

// 모달 닫기
function hideModal() {
	var modalMask = document.querySelector('.modalMask');
	
	modalMask.style.display = 'none';
}