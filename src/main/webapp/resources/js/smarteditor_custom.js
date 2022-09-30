/**
 * smarteditor custom js 파일
 */
 
 // editor image 임시저장을 위한 img class명 전역변수
 var tempEditorImageClass = '__temp__00000';
 
 /* method  > updateEditorContent : smarteditor 이미지 업로드, 경로 수정
 * prameter > contentAreaId : editor 적용하는 textarea id(name)
 * prameter > contextPath : contextPath
 * prameter > editorDirectory : smarteditor directory 하위 폴더
 */
 function updateEditorContent(contentAreaId, contextPath, editorDirectory) {
	var editorFileForm = document.getElementById('editorFileForm');
	var chtml = document.createElement('html');
	var tempImageList = null;
	
	chtml.innerHTML = oEditors[0].getContents();
	tempImageList = chtml.getElementsByClassName(tempEditorImageClass);
	
	if(editorFileForm && tempImageList && tempImageList != null) {
		var uploadUrl = '/file/upload/smarteditor';
		var downloadUrl = '/file/download/smarteditor';
		var uploadData = new FormData(); 
		var xhr = new XMLHttpRequest();
		
		if(contextPath) {
			uploadUrl = contextPath + uploadUrl;
			downloadUrl = contextPath + downloadUrl;
		}
	
		if(editorDirectory) {
			uploadData.append('editorDirectory', editorDirectory);
		}
		
		for(var i=0;i<tempImageList.length;i++) {
			var tempImage = tempImageList[i];
			var imageIndex = Number(tempImage.dataset.index);
			var editorFile = editorFileForm[imageIndex];

			uploadData.append('editorImage' + i, editorFile.files[0]);
		}
		
		
		xhr.open('post', uploadUrl, false);
		xhr.onreadystatechange = function() {
			if(xhr.readyState == 4 && xhr.status == 200) {
				var result = JSON.parse(xhr.response);
				
				if(Number(result.state) == 1) {
					var fileDTOList = result.fileDTOList;			
					
					// src 변경
					for(var i=0;i<tempImageList.length;i++) {
						var tempImage = tempImageList[i];
						var fileDTO = fileDTOList[i];
						var fileMap = new Map(Object.entries(fileDTO));
						var params = '';
						
						fileMap.forEach(function(val, key) {
							if(key && val && val.length > 0 && val != 0) {
								params += params.length > 0 ? '&' : '';
								params += key + '=' + val; 
							}
						});
						
						tempImage.src = downloadUrl + '?' + params;
					}
					
					// class 삭제
					while(tempImageList.length > 0) {
						var target = tempImageList[tempImageList.length-1];
						
						target.removeAttribute('data-index');
						
						if(target.className == tempEditorImageClass) {
							target.removeAttribute('class');
						} else {
							target.className.replace(tempEditorImageClass, '');
						}
					}//while
				}//if
			}//if
		}
		xhr.send(uploadData);
	}
	
	oEditors[0].setContents(chtml.innerHTML);
	oEditors.getById[contentAreaId].exec("UPDATE_CONTENTS_FIELD", [ ]);
}