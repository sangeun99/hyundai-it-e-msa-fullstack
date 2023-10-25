package javaio;

import java.io.UnsupportedEncodingException;

public class EUCKRvsMS949 {
	public static void main(String[] args) throws UnsupportedEncodingException {
		// EUC-KR vs MS949
		byte[] b1 = "a".getBytes("EUC-KR");
		byte[] b2 = "a".getBytes("MS949");
		
		System.out.println(b1.length);
		System.out.println(b2.length);
		System.out.println(new String(b1, "EUC-KR"));
		System.out.println(new String(b2, "MS949"));
		System.out.println();
		
		byte[] b3 = "가".getBytes("EUC-KR");
		byte[] b4 = "가".getBytes("MS949");
		
		System.out.println(b3.length);
		System.out.println(b4.length);
		System.out.println(new String(b3, "EUC-KR"));
		System.out.println(new String(b4, "MS949"));
		System.out.println();
		
		byte[] b5 = "뷁".getBytes("EUC-KR");
		byte[] b6 = "뷁".getBytes("MS949");
		
		System.out.println(b5.length);
		System.out.println(b6.length);
		System.out.println(new String(b5, "EUC-KR"));
		System.out.println(new String(b6, "MS949"));
		System.out.println();
		
	}
}
