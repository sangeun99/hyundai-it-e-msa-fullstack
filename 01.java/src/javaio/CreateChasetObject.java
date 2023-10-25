package javaio;

import java.nio.charset.Charset;

public class CreateChasetObject {
	public static void main(String[] args) {
		Charset c1 = Charset.defaultCharset();
		Charset c2 = Charset.forName("MS949");
		Charset c3 = Charset.forName("UTF-8");
		System.out.println(c1);
		System.out.println(c2);
		System.out.println(c3);
		System.out.println();
		System.out.println(Charset.isSupported("MS949"));
		System.out.println(Charset.isSupported("UTF-8"));						
	}
}
