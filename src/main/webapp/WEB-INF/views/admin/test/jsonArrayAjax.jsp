<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html><%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

  	<!-- Page Wrapper -->
    <div id="wrapper">
		<!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

		
      		<ul id="testUl">		
      			<li>
      				<form name="testForm" id="testForm1">
      				<input type="text" name="hello" value="hello1">
      				<input type="text" name="bye" value="bye1">
      				</form>
      			</li>
      			
      			
      			<li>
      				<form name="testForm" id="testForm2">
      				<input type="text" name="hello" value="hello2">
      				<input type="text" name="bye" value="bye2">
      				</form>
      			</li>
      			
      		
      			<li>
      				<form name="testForm" id="testForm3">
      				<input type="text" name="hello" value="hello3">
      				<input type="text" name="bye" value="bye3">
      				</form>
      			</li>
      			<li>
      				<form name="testForm" id="testForm4">
      				<input type="text" name="hello" value="hello4">
      				<input type="text" name="bye" value="bye4">
      				</form>
      			</li>
      		</ul>
      		
<script type="text/javascript">


var data = JSON.stringify(testList);
var params = {};

console.log("testList : " + testList)
console.log("data : " + data);
$.ajax({
	type : 'post'
	, contentType : 'application/json'
	, url : '${contextPath}/admin/deco/test'
	, traditional : true
	, dataType : 'json'
	//, data : {data : JSON.stringify(params)}
	, data : data
	, success : function(testList) {
		console.log(data);
	}
});

</script>           
