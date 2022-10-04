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
	return /^[\d]+$/gi.test(this);
}

// 문자열이 숫자와 영어로만 되어있는지 반환
String.prototype.isNumAndEng = function() {
	return /^[\w]+$/gi.test(this);
}

// 문자열이 영어로만 되어있는지 반환
String.prototype.isOnlyEng = function() {
	return /^[a-z|A-Z]+$/gi.test(this);
}

// 문자열이 한글로만 되어있는지 반환
String.prototype.isOnlyKor = function() {
	return /^[가-힣]+$/gi.test(this);
}

// 맨 마지막 글자에 받침이 있는지 찾아서 있다면 true, 없다면 false 를 반환
function isEndWithConsonant(korStr) {
    const finalChrCode = korStr.charCodeAt(korStr.length - 1)
    // 0 = 받침 없음, 그 외 = 받침 있음
    const finalConsonantCode = (finalChrCode - 44032) % 28
    return finalConsonantCode !== 0
};

// 을/를 덧붙히기
String.prototype.appendER = function() {
    return this + (isEndWithConsonant(this) ? "을" : "를")
};

// 은/는 덧붙히기
String.prototype.appendEN = function() {
    return this + (isEndWithConsonant(this) ? "은" : "는")
};