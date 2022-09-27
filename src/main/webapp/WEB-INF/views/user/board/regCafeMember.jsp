<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function readURL(input){
		var file = input.files[0]//파일에 대한 정보
		if(file != ''){
			var reader = new FileReader();
			reader.readAsDataURL(file);//읽고
			reader.onload = function (e){//로드한 값을 표현한다
				$('#preview').attr('src',e.target.result);
			}
		}
	}
</script>
<body>
<div align="center">
	<h1>카페 회원 추가용</h1>
<form action="regSave" method="post" enctype="multipart/form-data">
	카페아이디<input type="text" name="cafeId"><br>
	유저아이디<input type="text" name="userId"><br>
	닉네임<input type="text" name="cafeUserNickname"><br>
	프로필 사진
	<b>이미지파일 첨부</b><br>
	<input type="file" name="cafeUserImageNum" onchange="readURL(this)">
	<img id="preview" src="#" width=100 height=100 alt="선택된 이미지가 없습니다"><hr>
	<input type="submit" value="회원생성">
	<input type="button" value="목록보기" onclick="history.back()">
</form>

</div>





</body>
</html>