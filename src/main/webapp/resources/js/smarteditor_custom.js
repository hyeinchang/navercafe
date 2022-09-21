/**
 * smarteditor 공통 js 파일
 */
 
 // smart editor 이미지 업로드, 경로 수정
 function updateEditorContent(contentId, contextPath, editorDirectory) {
	var editorFileForm = document.getElementById('editorFileForm');
	var chtml = document.createElement('html');
	var tempImageList = null;
	
	chtml.innerHTML = oEditors[0].getContents();
	tempImageList = chtml.getElementsByClassName('tempImage');
	
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
				}
			} 
		}
		xhr.send(uploadData);
	}
	
	oEditors[0].setContents(chtml.innerHTML);
	oEditors.getById[contentId].exec("UPDATE_CONTENTS_FIELD", [ ]);
}