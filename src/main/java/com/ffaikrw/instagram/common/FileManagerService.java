package com.ffaikrw.instagram.common;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

public class FileManagerService {
	
	public final static String FILE_UPLOAD_PATH = "D:\\정혜원\\SpringProject\\Instagram\\upload\\images/";
	
	private static Logger logger = LoggerFactory.getLogger(FileManagerService.class);
	
	public static String saveFile(int userId, MultipartFile file) {
		
		// 1. 파일 경로
		String directoryName = userId + "_" + System.currentTimeMillis() + "/";
		
		String filePath = FILE_UPLOAD_PATH + directoryName;
		
		
		// 2. 디렉토리 생성
		File directory = new File(filePath);
		
		if (directory.mkdir() == false) {
			logger.error("FileManagerService-saveFile : 디렉토리 생성 에러");
			return null;
		}
		
		
		// 3. 파일 저장
		try {
			byte[] bytes = file.getBytes();
			Path path = Paths.get(filePath + file.getOriginalFilename());
			Files.write(path, bytes);
		} catch (IOException e) {
			e.printStackTrace();
			logger.error("FileManagerService-saveFile : 파일 저장 에러");
			return null;
		}
		
		return "/images/" + directoryName + file.getOriginalFilename();
		
	}
	
}
