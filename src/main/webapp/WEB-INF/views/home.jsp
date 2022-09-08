<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<html>
<head>
	<title>Home</title>
	<script type="text/javascript" src="${contextPath}/resources/plugin/smart_editor2/js/HuskyEZCreator.js" charset="utf-8"></script>
	
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<textarea name="content" id="content"></textarea>
<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
oAppRef: oEditors,
elPlaceHolder: "content",
sSkinURI: "${contextPath}/resources/plugin/smart_editor2/SmartEditor2Skin.html",
fCreator: "createSEditor2"
});

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
function submitContents(elClickedObj) {
// 에디터의 내용이 textarea에 적용된다.
oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);
document.getElementById("form").submit();
// 에디터의 내용에 대한 값 검증은 이곳에서
// document.getElementById("textAreaContent").value를 이용해서 처리한다.

try {
elClickedObj.form.submit();
} catch(e) {

}
}

// textArea에 이미지 첨부
function pasteHTML(filepath){
var sHTML = '<img src="${contextPath}/resources/upload/'+filepath+'">';
oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
setTimeout(function(){
	oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	}, 10000);
}
</script>
</body>
</html>
