package com.project.Member;

import org.springframework.stereotype.Service;
import java.io.File;
import java.io.IOException;
import org.springframework.web.multipart.MultipartFile;


@Service
public class FileUpload {

	private final String uploadPath = "G://upload";
	private String[] extArr = {"jpg","png","jpeg","bmp","gif"};
	
	public void Fileupload() {
		File dir = new File(uploadPath);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}
	
	private boolean isImgFile(String fileName) {
		for(String ext: extArr) {
			if(fileName.endsWith(ext)) {
				return true;
			}
		}
		return false;
	}
	
	public boolean uploadFile(MultipartFile file) throws IllegalStateException, IOException {
		Fileupload();
		File target = new File(uploadPath, file.getOriginalFilename());
		if(isImgFile(file.getOriginalFilename())) {
			file.transferTo(target);
		}
		return target.exists();
	}
}
