package com.hotel.dto;

import java.io.File;

public class FileDTO {
	private String path;
	private String fileName;
	private String type;
	
	public FileDTO(File file) {
		this.path = file.getAbsolutePath();
		this.fileName = file.getName();
		//파일 확장자 뽑음
		switch(fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase()) {
		case "png":
		case "bmp":
		case "gif":
		case "jpg":
			this.type = "image";
			break;
		default:
			this.type = "normal";
		}
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Override
	public String toString() {
		return "FileDTO [path=" + path + ", fileName=" + fileName + ", type=" + type + "]";
	}

	public FileDTO() {
	}
	
	
}



