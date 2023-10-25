package javaio;

import java.io.File;

public class FileMethod {
	public static void main(String[] args) {
		String dirPath = "C:/Users/um_se/test";
		// C드라이브 내에 temp 폴더가 없을 때 생성
		File tempDir = new File(dirPath);
		if (!tempDir.exists())
			tempDir.mkdir();
		
		// 1. 파일 객체 생성
		File file = new File("C:/Windows");
		
		// 2. 파일 메서드
		System.out.println("절대 경로: " + file.getAbsolutePath());
		System.out.println("폴더(?): " + file.isDirectory());
		System.out.println("파일(?): " + file.isFile());
		System.out.println("파일/폴더명: " + file.getName());
		System.out.println("부모 폴더: " + file.getParent());
		File newFile1 = new File(dirPath + "/abc");
		System.out.println(newFile1.mkdir());
		File newFile2 = new File(dirPath + "/bcd/cde");
		System.out.println(newFile2.mkdir());
		System.out.println(newFile2.mkdirs());
		File[] fnames = file.listFiles();
		for (File fname: fnames) {
			System.out.println((fname.isDirectory()? "폴더: ": "파일: ") + fname.getName());
		}
	}
}