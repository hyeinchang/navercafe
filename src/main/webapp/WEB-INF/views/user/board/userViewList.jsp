<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<style type="text/css">
  	.userViewDiv{display: flex;padding-bottom: 10px;}
	.two{padding-left:20px; text-align: left;}
	.number{
		color:black; font-weight: bold;
	}
</style>

<div class="content col-lg-8 col-md-8 col-sm-8 col-xs-12 clearfix cstmContent" ${_cafeDTO.cafeLayout eq 'left' ? '' : 'style="float:right;"'}>
		<div align="center">

		<div class="userViewDiv">     
				<div class="one">
					<a href="#">
	          		<c:if test="${ getUserViewList.cafeUserImage == 0 }">
	          			<img src="<%=request.getContextPath()%>/resources/img/프로필.jpg"
	          			width="100px" class="img-circle alignleft" alt="">
	          		</c:if>
					<c:if test="${ getUserViewList.cafeUserImage  != 0 }">
						<img src="test_download?fileImageNum=${getUserViewList.cafeUserImage}" 
						width="100px" class="img-circle alignleft" alt="">
					</c:if>
	           		</a>
				</div>
	            
				<div class="two">
					<span style="font-size: 20pt; color:black; font-weight: bold;" >
					  ${getUserViewList.cafeUserNickname}(${getUserViewList.userId})
					</span><br>
					<span style="font-size: 15pt; color:black">
					    멤버 등급 표시 (안쪽에서 숫자에 따라서 등급 줘야할것같고)
				    </span><br>
				 	<span style="font-size: 10pt;">
				            방문 <span class="number">${getUserViewList.cafeUserVisit}</span>	
				            작성글 <span class="number">${getUserViewList.cafeUserWrite}</span>
				            작성 댓글 <span class="number">${getUserViewList.cafeUserReply}</span>
					</span>
				</div>
				
	       </div>
			<table border="1" width="1000px;">
		     		<tr>
		     			<th>보드 번호~~</th><th>제목~~~ </th>
		     			<th>날짜~~~</th><th>조회수~~</th>
		     		</tr>
	    	</table>
	     

     </div>
     
</div>