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

console.log("testList : " + testList)
console.log("data : " + data);

$.ajax({
	type : 'post'
	, contentType : 'application/json'
	, url : '${contextPath}/admin/test/jsonArrayAjax/act'
	//, traditional : true
	, dataType : 'json'
	, data : data
	, success : function(data) {
		console.log(data);
	}
});

</script>           
