<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="com.oreilly.servlet.MultipartRequest, com.oreilly.servlet.multipart.DefaultFileRenamePolicy, java.util.*, java.io.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<style type="text/css">
	/* NHN Web Standard 1Team JJS 120106 */ 
	/* Common */
	body,p,h1,h2,h3,h4,h5,h6,ul,ol,li,dl,dt,dd,table,th,td,form,fieldset,legend,input,textarea,button,select{margin:0;padding:0}
	body,input,textarea,select,button,table{font-family:'돋움',Dotum,Helvetica,sans-serif;font-size:12px}
	img,fieldset{border:0}
	ul,ol{list-style:none}
	em,address{font-style:normal}
	a{text-decoration:none}
	a:hover,a:active,a:focus{text-decoration:underline}
	
	/* Contents */
	.blind{visibility:hidden;position:absolute;line-height:0}
	/*#pop_wrap{width:383px} 2022-09-22 chi9148 수정 */
	#pop_header{height:26px;padding:14px 0 0 20px;border-bottom:1px solid #ededeb;background:#f4f4f3}
	.pop_container{padding:11px 20px 0}
	#pop_footer{margin:21px 20px 0;padding:10px 0 16px;border-top:1px solid #e5e5e5;text-align:center}
	h1{color:#333;font-size:14px;letter-spacing:-1px}
	.btn_area{word-spacing:2px}
	.pop_container .drag_area{overflow:hidden;overflow-y:auto;position:relative;width:341px;height:129px;margin-top:4px;border:1px solid #eceff2}
	.pop_container .drag_area .bg{display:block;position:absolute;top:0;left:0;width:341px;height:129px;background:#fdfdfd url(../../img/photoQuickPopup/bg_drag_image.png) 0 0 no-repeat}
	.pop_container .nobg{background:none}
	.pop_container .bar{color:#e0e0e0}
	.pop_container .lst_type li{overflow:hidden;position:relative;padding:7px 0 6px 8px;border-bottom:1px solid #f4f4f4;vertical-align:top}
	.pop_container :root .lst_type li{padding:6px 0 5px 8px}
	.pop_container .lst_type li span{float:left;color:#222}
	.pop_container .lst_type li em{float:right;margin-top:1px;padding-right:22px;color:#a1a1a1;font-size:11px}
	.pop_container .lst_type li a{position:absolute;top:6px;right:5px}
	.pop_container .dsc{margin-top:6px;color:#666;line-height:18px}
	.pop_container .dsc_v1{margin-top:12px}
	.pop_container .dsc em{color:#13b72a}
	.pop_container2{padding:46px 60px 20px}
	.pop_container2 .dsc{margin-top:6px;color:#666;line-height:18px}
	.pop_container2 .dsc strong{color:#13b72a}
	.upload{margin:0 4px 0 0;_margin:0;padding:6px 0 4px 6px;border:solid 1px #d5d5d5;color:#a1a1a1;font-size:12px;border-right-color:#efefef;border-bottom-color:#efefef;length:300px;}
	:root  .upload{padding:6px 0 2px 6px;}
	
	/* 2022-09-22 chi9148 추가*/
	 div.fileUpload {width:100%; margin: 0 auto; border-radius: 10px;color: #ddd;text-align:center;}
	 div.fileUpload span.fileAdd {border: 1px solid;width: 50px; margin: 100px auto;border-radius: 5px;display:inline-block; font-weight: bold;font-size: 30px; }
	</style>
	
	<script type="text/javascript" src="${contextPath}/resources/js/smarteditor_custom.js" charset="utf-8"></script>  
	<script type="text/javascript">
		function fn_imageUp() {
			document.editor_upimage.submit();
		}
	</script>
</head>
<body>
	<div id="pop_wrap">
		<!-- header -->
	    <div id="pop_header">
	        <h1>사진 첨부하기</h1>
	    </div>
	    <!-- //header -->
	    <!-- container -->
		
	    <!-- [D] HTML5인 경우 pop_container 클래스와 하위 HTML 적용
		    	 그밖의 경우 pop_container2 클래스와 하위 HTML 적용      -->
		<div id="pop_container2" class="pop_container2" style="display:none;">
	    	
	    	<!-- content -->
			<form id="editor_upimage" name="editor_upimage" action="file_uploader.jsp" method="post" enctype="multipart/form-data" onSubmit="return false;">
	        <div id="pop_content2">
				<input type="file" class="upload" id="uploadInputBox" name="Filedata">
	            <p class="dsc" id="info"><strong>10MB</strong>이하의 이미지 파일만 등록할 수 있습니다.<br>(JPG, GIF, PNG, BMP)</p>
	        </div>
			</form>
			
			<div id="pop_footer">
			    <div class="btn_area">
		            <a href="javascript:fn_imageUp();"><img src="../../img/photoQuickPopup/btn_confirm.png" width="49" height="28" alt="확인" id="btn_confirm"></a>
		            <a href="#"><img src="../../img/photoQuickPopup/btn_cancel.png" width="48" height="28" alt="취소" id="btn_cancel"></a>
		        </div>
	    	</div>
	        <!-- //content -->
	
	    </div>
	    <div id="pop_container" class="pop_container">
	    	<!-- content -->
	        <!-- <div id="pop_content">
		        <p class="dsc"><em id="imageCountTxt">0장</em>/10장 <span class="bar">|</span> <em id="totalSizeTxt">0MB</em>/50MB</p>
	        	[D] 첨부 이미지 여부에 따른 Class 변화 
	            	 첨부 이미지가 있는 경우 : em에 "bg" 클래스 적용 //첨부 이미지가 없는 경우 : em에 "nobg" 클래스 적용  
					 
	            <div class="drag_area" id="drag_area">
					<ul class="lst_type" >
					</ul>
	            	<em class="blind">마우스로 드래그해서 이미지를 추가해주세요.</em><span id="guide_text" class="bg"></span>
	            </div>
				<div style="display:none;" id="divImageList"></div>
	            <p class="dsc dsc_v1"><em>한 장당 10MB, 1회에 50MB까지, 10개</em>의 이미지 파일을<br>등록할 수 있습니다. (JPG, GIF, PNG, BMP)</p>
	        </div> -->
			<form id="editor_upimage5" name="editor_upimage5" action="file_uploader.jsp" method="post" enctype="multipart/form-data" onSubmit="return false;">
	        <div id="pop_content2">
	        	<div id="fileArea" class="fileUpload" title="업로드하실 파일을 드래그해주십시오." ondrop="console.log(event)">
					<span class="fileAdd">+</span>
	            </div>
	            <input type="file" class="upload" id="uploadInputBox" name="Filedata" onchange="validateFile()">
	            <p class="dsc" id="info"><strong>10MB</strong>이하의 이미지 파일만 등록할 수 있습니다.<br>(JPG, GIF, PNG, BMP)</p>
	        </div>
			</form>
			
			<div id="pop_footer">
		    <div class="btn_area">
	            <a href="javascript:fn_imageUp5();"><img src="../../img/photoQuickPopup/btn_confirm.png" width="49" height="28" alt="확인" id="btn_confirm"></a>
	            <a href="javascript:fn_close();"><img src="../../img/photoQuickPopup/btn_cancel.png" width="48" height="28" alt="취소" id="btn_cancel"></a>
	        </div>
	    </div>
	        <!-- //content -->
	    </div>
	
	    <!-- //container -->
	    <!-- footer -->
	    
	    <!-- //footer -->
	</div>
	<!-- <script type="text/javascript" src="jindo.min.js" charset="utf-8"></script> -->
	<!-- <script type="text/javascript" src="jindo.fileuploader.js" charset="utf-8"></script> -->
	<!-- <script type="text/javascript" src="attach_photo.js" charset="utf-8"></script> -->
	<script type="text/javascript">
		/* 2022-09-22 chi9148 수정 및 추가 */
		document.body.onload = setFileAreaEvent;
			
		function setFileAreaEvent()	{
			var fileArea = document.getElementById('fileArea');
			
		 	// 파일 드래그 영역에 파일이 들어왔을 때
		 	fileArea.ondragover = function() {
		     	event.preventDefault();
			}

		 	// 파일 드래그 영역에 파일을 드롭했을 때
		 	fileArea.ondrop = function(e) {
		     	event.preventDefault();
		     	saveDragFiles(event.dataTransfer.files);
		 	}
		 	
		 	//드래그 파일 영역에 드롭된 파일을 input에 저장
			function saveDragFiles(files) {
				if(validateFile_drag(files)) {
			    	var editorForm = document.editor_upimage5;
			    	var fileData = editorForm.Filedata;
			    	
			    	fileData.files = files;
			 	}
			}
		}
		
		//드롭한 파일 유효성 확인
		function validateFile_drag(files) {
			var file = null;
			
			// 파일여부 확인
			if(!files || files.length == 0) {
				alert('파일이 아닙니다.');
			    return false;
			}

			// 한 개의 파일만 업로드
			if(files.length > 1) {
				alert('한개의 파일만 등록할 수 있습니다.');
				return false;
			}

			file = files[0];

			// 이미지 파일만 업로드
			if(file.type.toLowerCase().indexOf('image') < 0) {
				alert('이미지 파일만 등록할 수 있습니다.');
				return false;
			}
			
			return true;
		}
		
		// editor를 사용하는 페이지에 editorFileForm에 파일을 복사해놓고 저장할 때 업로드
		function fn_imageUp5() {
			//document.editor_upimage5.submit();
			var orgPage = window.opener.parent;
			var editorFileForm = orgPage.document.editorFileForm;
			var cloneFile = null;
			var index = 0;
			
			if(!editorFileForm) {
				editorFileForm = document.createElement('form');
				editorFileForm.id = 'editorFileForm';
				editorFileForm.name = 'editorFileForm';
				editorFileForm.style.display = 'none';
				orgPage.document.body.appendChild(editorFileForm);
			}
			
			index = editorFileForm.length;
			cloneFile = document.editor_upimage5.Filedata.cloneNode(true);
			cloneFile.dataset.index = index;
			editorFileForm.appendChild(cloneFile);
			readImageSrc(cloneFile.files[0], index);
			fn_close();
		}
		
		function validateFile() {
			var target = event.target;
			var files = target.files;
			var check = true;
			
			if(files.length != 1) {
				alert('한개의 파일만 등록할 수 있습니다.');
				check = false;
			}
			
			if(files[0].type.indexOf('image') < 0) {
				alert('이미지 파일만 등록할 수 있습니다.');
				check = false;
			}
			
			if(!check) {
				target.files = null;
				target.value = '';
				target.focus();
			}
		}
		
		function readImageSrc(file, index) {
			var fileReader = new FileReader();
	
			fileReader.readAsDataURL(file);		
			fileReader.onload = function() {
				var orgPage = window.opener.parent;
				var src = fileReader.result;
				var sHTML = '<img src="'+ src + '" class="' + tempEditorImageClass + '" data-index="' + index + '">';
				
				orgPage.pasteHTML_custom(sHTML);
			}
	 	}
		
		function fn_close() {
			window.close();
		}
		/* end 2022-09-22 chi9148 수정 및 추가  */
	</script>
</body>
</html>
