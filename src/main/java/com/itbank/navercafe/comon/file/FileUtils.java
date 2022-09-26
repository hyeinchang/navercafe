package com.itbank.navercafe.comon.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.itbank.navercafe.comon.file.dto.FileDTO;
import com.itbank.navercafe.comon.file.dto.FileResult;
import com.itbank.navercafe.comon.file.service.FileService;

@Component
public class FileUtils {
	@Autowired FileService fileService;
	//@Value("${navercafe.file.upload_path}")
	private String upload_path;
	private final String PATH_DELIMITER = "/";
	
	public void test(MultipartFile multipartFile) throws IllegalStateException, IOException {
		String testPath = upload_path+"/test";
		File file = new File(testPath);
		boolean exists = file.exists() ? true : file.mkdirs();
		
		if(exists) {
			multipartFile.transferTo(new File(testPath + "/" + multipartFile.getOriginalFilename()));
		}
		
		System.out.println(file.isDirectory());
		System.out.println(file.exists());
		System.out.println("upload_path ---- " + upload_path);
	}
	
	// 파일 다중 업로드
	public FileResult uploadFile(MultipartHttpServletRequest multiRequest, String directory, boolean onlyFile) {
		FileResult fileResult = new FileResult();
		String uploadPath = "";
		
		try {
			uploadPath = getUploadPath(directory);
			
			if(onlyFile) {	// 파일만 업로드할 경우(DB 저장X)
				if(checkDirectory(uploadPath)) {
					Iterator<String> fileNames =  multiRequest.getFileNames();
					
					while(fileNames.hasNext()) {
						String fileName = fileNames.next();
						MultipartFile multipartFile = multiRequest.getFile(fileName);
						uploadFile(multipartFile, directory, fileName);
					}
					
					fileResult.setState(fileResult.SUCCESS);
				} else {
					fileResult.setState(fileResult.FAIL);
				}
			} else {
				uploadFile(multiRequest, directory);
			}
		} catch(Exception e) {
			fileResult.setState(fileResult.FAIL);
			e.printStackTrace();
		}
		
		return fileResult;
	}

	
	// 파일 다중 업로드
	public FileResult uploadFile(MultipartHttpServletRequest multiRequest, String directory) {
		FileResult fileResult = new FileResult();
		String uploadPath = "";
		
		try {
			uploadPath = getUploadPath(directory);
			
			if(checkDirectory(uploadPath)) {
				Iterator<String> fileNames =  multiRequest.getFileNames();
				ArrayList<FileDTO> fileDTOList = new ArrayList<>();
				int uploadCount = 0;
				int fileCount = 0;
				
				while(fileNames.hasNext()) {
					String fileName = fileNames.next();
					MultipartFile multipartFile = multiRequest.getFile(fileName);
					FileResult uploadResult = uploadFile(multipartFile, directory);
					
					if(uploadResult.getState() == fileResult.SUCCESS) {
						FileDTO fileDTO = uploadResult.getFileDTO();
						
						fileResult.setFileDTO(fileDTO);
						fileDTOList.add(fileDTO);
						uploadCount++;
					}
					fileCount++;
				}
				
				fileResult.setFileDTOList(fileDTOList);
				
				// 가져온 파일의 개수와 업로드한 파일의 개수 비교
				if(uploadCount == fileCount) {
					fileResult.setState(fileResult.SUCCESS);
				} else {
					fileResult.setState(fileResult.FAIL);
				}
			} else {
				fileResult.setState(fileResult.FAIL);
			}
		} catch(Exception e) {
			fileResult.setState(fileResult.FAIL);
			e.printStackTrace();
		}
		
		return fileResult;
	}
	
	// 파일만 업로드
	public FileResult uploadFile(MultipartFile multipartFile, String directory, String storedFileName) {
		FileResult fileResult = new FileResult();
		String uploadPath = "";
		
		try {
			uploadPath = getUploadPath(directory);
			multipartFile.transferTo(new File(uploadPath + PATH_DELIMITER + storedFileName));
			fileResult.setState(fileResult.SUCCESS);
		} catch(Exception e) {
			fileResult.setState(fileResult.FAIL);
			e.printStackTrace();
		}
		
		return fileResult;
	}
	
	// 파일 업로드 후 파일 정보를 FileDTO에 저장
	public FileResult uploadFile(MultipartFile multipartFile, String directory) {
		FileResult fileResult = new FileResult();
		String uploadPath = "";		
		String orgFileName = "";
		String storedFileName = "";

		try {
			uploadPath = getUploadPath(directory);
			
			if(checkDirectory(uploadPath)) {
				orgFileName = multipartFile.getOriginalFilename();
				storedFileName = getStoredFileName(orgFileName);
				fileResult = uploadFile(multipartFile, uploadPath, directory, orgFileName, storedFileName);
			} else {
				fileResult.setState(fileResult.FAIL);
			}
		} catch(Exception e) {
			fileResult.setState(fileResult.FAIL);
			e.printStackTrace();
		}
		
		return fileResult;
	}
	
	// 파일 업로드 후 파일 정보를 FileDTO에 저장
	public FileResult uploadFile(MultipartFile multipartFile, String uploadPath, String directory, String orgFileName, String storedFileName) {
		FileResult fileResult = new FileResult();
		FileDTO fileDTO = new FileDTO();
		
		
		try {
			multipartFile.transferTo(new File(uploadPath + PATH_DELIMITER + storedFileName));
			
			fileDTO.setFileDirectory(directory);
			fileDTO.setFileOrgName(orgFileName);
			fileDTO.setFileStoredName(storedFileName);
			
			fileResult.setFileDTO(fileDTO);
			fileResult.setState(fileResult.SUCCESS);
		} catch(Exception e) {
			fileResult.setState(fileResult.FAIL);
			e.printStackTrace();
		}
		
		return fileResult;
	}
	
	// DB에서  파일 num 또는 reference num으로 파일정보를 찾아 다운로드
	public void download(HttpServletResponse response,  int fileNum) throws IOException {
		try {
			FileDTO fileDTO = fileService.selectAttachFile(fileNum);
			
			if(fileDTO != null) {
				String orgFileName = fileDTO.getFileOrgName();
				String storedFileName = fileDTO.getFileStoredName();
				String directory = fileDTO.getFileDirectory();
				
				download(response, directory, storedFileName, orgFileName);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} 
	}
	
	// DB에서 FileDTO로 파일정보를 찾아 다운로드
	public void download(HttpServletResponse response, FileDTO pfileDTO) throws IOException {		
		try {
			FileDTO fileDTO = fileService.selectAttachFile(pfileDTO);
			
			if(fileDTO != null) {
				String orgFileName = fileDTO.getFileOrgName();
				String storedFileName = fileDTO.getFileStoredName();
				String directory = fileDTO.getFileDirectory();
				
				download(response, directory, storedFileName, orgFileName);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} 
	}
	
	
	// DB에서 FileDTO로 파일정보를 찾아 다운로드
	public void download(HttpServletResponse response, FileDTO pfileDTO, boolean onlyFile) throws IOException {		
		try {
			FileDTO fileDTO = pfileDTO;
			
			if(!onlyFile) {
				fileDTO = fileService.selectAttachFile(pfileDTO);
			}
			
			if(fileDTO != null) {
				String orgFileName = fileDTO.getFileOrgName();
				String storedFileName = fileDTO.getFileStoredName();
				String directory = fileDTO.getFileDirectory();
				
				download(response, directory, storedFileName, orgFileName);
			}
		} catch(Exception e) {
			e.printStackTrace();
		} 
	}
	
	// 파일 다운로드
	public void download(HttpServletResponse response, String directory, String storedFileName, String orgFileName) throws IllegalStateException, IOException {
		FileInputStream fis = null;
		
		try {
			if(checkDirectory(directory)) {
				File file = new File(getUploadPath(directory) + PATH_DELIMITER + storedFileName);
				fis = new FileInputStream(file);
				
				response.setHeader("Content-Disposition", "attachment; fileName=" + orgFileName);

				FileCopyUtils.copy(fis, response.getOutputStream());
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 파일 명으로 해당 디렉토리의 파일 다운로드
	public void download(HttpServletResponse response, String directory, String fileName) throws IllegalStateException, IOException {
		FileInputStream fis = null;
		
		try {
			if(checkDirectory(directory)) {
				File file = new File(getUploadPath(directory) + PATH_DELIMITER + fileName);
				fis = new FileInputStream(file);
				
				response.setHeader("Content-Disposition", "attachment; fileName=" + fileName);

				FileCopyUtils.copy(fis, response.getOutputStream());
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			fis.close();
		}	
	}
	
	// 파일 옮기기
	public void moveFile(String afterDirectory, String beforeDirectory, String fileName) throws IllegalStateException, IOException {
		try {
			if(checkDirectory(beforeDirectory) && checkDirectory(afterDirectory)) {
				Path beforePath = Paths.get(getUploadPath(beforeDirectory) + PATH_DELIMITER + fileName);
				Path afterPath = Paths.get(getUploadPath(afterDirectory) + PATH_DELIMITER + fileName);
				
				Files.move(beforePath, afterPath, StandardCopyOption.REPLACE_EXISTING);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 경로의 / 중복 삭제
	public String cleanPath(String path) {
		String result = "";
		
		try {
			if(path != null) {
				String[] pathArr = null;
				
				pathArr = path.split(PATH_DELIMITER);
				
				for(int i=0; i<pathArr.length; i++) {
					String pathPart = pathArr[i];
					
					if(pathPart.length() > 0) {
						result += result.length() > 0 ? PATH_DELIMITER + pathPart : pathPart;
					}
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 저장 파일명 반환
	public String getStoredFileName(String orgFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String result = "";
		
		try {
			if(orgFileName != null && orgFileName.length() > 0) {
				int dotLastIndex = orgFileName.lastIndexOf(".");
				String fileName = orgFileName.substring(0, dotLastIndex);
				String ext = orgFileName.substring(dotLastIndex);
				
				result = fileName + "_" + sdf.format(new Date()) + ext;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 업로드 경로 반환
	public String getUploadPath(String directory) {
		String result = upload_path;
		
		try {
			if(directory != null && directory.length() > 0) {
				directory = cleanPath(directory);
				result += PATH_DELIMITER + directory;
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 디렉토리 존재 여부 확인
	public boolean checkDirectory(String directoryPath) {
		boolean result = false;
		File dir = null;
		
		try {
			dir = new File(directoryPath);
			result = dir.exists() ? true : dir.mkdirs();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	

	public String getUpload_path() {
		return upload_path;
	}

	public void setUpload_path(String upload_path) {
		this.upload_path = upload_path;
	}
}
