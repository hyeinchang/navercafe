/**
 * naver cafe 사용자, 관리자 공통 js 파일
 */

// 오라클 기준 문자열 바이트 값 반환 
String.prototype.getBytes = function() {
	var str = this;
	var strBytes = 0;
	
	for(var i=0;i<str.length;i++) {
		if(escape(str.charAt(i)).length >= 3) {
			strBytes += 3;
		} else {
			strBytes += 1;
		}
	}
	
	return strBytes;
}

// 문자열이 숫자로만 되어있는지 반환
String.prototype.isOnlyNumber = function() {
	return /^[1-9]+$/gi.test(this);
}

// 문자열이 숫자와 영어로만 되어있는지 반환
String.prototype.isNumAndEng = function() {
	return /^[a-z|A-Z|1-9]+$/gi.test(this);
}

// 문자열이 영어로만 되어있는지 반환
String.prototype.isOnlyEng = function() {
	return /^[a-z|A-Z]+$/gi.test(this);
}

// 문자열이 한글로만 되어있는지 반환
String.prototype.isOnlyKor = function() {
	return /^[가-힣]+$/gi.test(this);
}