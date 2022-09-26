<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
카페 멤버 정보<br><br>
<c:forEach var="dto" items="${cafeusers }">
	${dto.cafeId } : 카페아이디 <br>
	${dto.userId } : 유져아이디 <br>
	${dto.nickName } : 유져닉네임 <br>
	${dto.userImage } : 프로필사진 <br>
	${dto.userGrade } : 회원등급 <br>
	${dto.userVisit } : 방문횟수 <br>
	${dto.userWrite } : 글 작성횟수<br>
	${dto.userReply } : 댓글 작성 횟수 <br>
	${dto.userVisitCheck } : 출석횟수<br>
	${dto.userRegDate } : 카페가입일<br>
	${dto.userApplyDate } : 가입신청일 <br>
	${dto.userStatus } : 가입승인여부 <br>
</c:forEach> 
</body>
</html>