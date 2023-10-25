package javaio;

import java.io.File;
import java.io.IOException;

public class CreateFileObject {
	public static void main(String[] args) {
		// 1-1. C드라이브 내에 temp 폴더가 없을 때 생성
		File tempDir = new File("C:\\Users\\um_se\\test");
		if (!tempDir.exists())
			tempDir.mkdir();
		System.out.println(tempDir.exists());
		
		// 1-2. 파일 객체 생성(실제 파일 생성)
		File newFile = new File("C:\\Users\\um_se\\test\\newFile.txt");
		if (!newFile.exists())
			try {
				newFile.createNewFile();
			} catch (IOException e) {}
		System.out.println(newFile.exists());
		
		// 2. 파일 구분자
		File newFile2 = new File("C:/Users/um_se/test/newFile.txt");
		File newFile3 = new File("C:" + File.separator + "Users" + File.separator + "um_se" + File.separator + "test" + File.separator + "newFile.txt");
		
		System.out.println(newFile2.exists());
		System.out.println(newFile3.exists());
		System.out.println();
		
		// 3-1. 절대 경로
		String dirPath = "C:/Users/um_se/test";
		File newFile4 = new File(dirPath + "/newFile1.txt");
		File newFile5 = new File(dirPath + "/abc/newFile.txt");
		System.out.println(newFile4.getAbsolutePath());
		System.out.println(newFile5.getAbsolutePath());
		
		// 3-2. 상대 경로
		// 현재 위치
		System.out.println(System.getProperty("user.dir"));
		File newFile6 = new File("newFile1.txt");
		File newFile7 = new File("bcd/newFile2.txt");
		System.out.println(newFile6.getAbsolutePath());
		System.out.println(newFile7.getAbsolutePath());
	}
}
