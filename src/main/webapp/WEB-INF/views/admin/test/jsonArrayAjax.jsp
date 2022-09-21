<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
var testList = new Array();
var testFormList = document.testForm;

for(var i=0; i<testFormList.length; i++) {
	var testForm = testFormList[i];
	var obj = new Object();
	
	for(var j=0; j<testForm.length; j++) {
		var element = testForm[j];
		
		if(element.name) {
			obj[element.name] = element.value;
		}
	}
	testList.push(obj);
}

var data = JSON.stringify(testList);

console.log("testList : " + testList);
console.log("data : " + data);

// controller에서 jsonsimple, gson 라이브러리 사용
$.ajax({
	type : 'post'
	, contentType : 'application/json'
	, url : '${contextPath}/admin/test/jsonArrayAjax/act'
	//, traditional : true
	, dataType : 'json'
	, data : data
	, success : function(data) {
		console.log('act1');
		console.log(data);
	}
});


// DTO에 List<DTO> 형식의 변수 생성하여 controller에서 list를 변수로 받는 형식
$.ajax({
	type : 'post'
	, contentType : 'application/json'
	, url : '${contextPath}/admin/test/jsonArrayAjax/act2'
	//, traditional : true
	, dataType : 'json'
	, data : JSON.stringify({testDTOList : testList})
	, success : function(data) {
		console.log('act2');
		console.log(data);
	}
});

// controller에서 Map<String, List<DTO>> 형식으로 파라미터를 받는 방식
$.ajax({
	type : 'post'
	, contentType : 'application/json'
	, url : '${contextPath}/admin/test/jsonArrayAjax/act3'
	//, traditional : true
	, dataType : 'json'
	, data : JSON.stringify({data : testList})
	, success : function(data) {
		console.log('act3');
		console.log(data);
	}
});

</script>           
