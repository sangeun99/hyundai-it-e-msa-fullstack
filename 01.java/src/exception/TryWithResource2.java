package exception;

import java.io.IOException;
import java.io.InputStreamReader;

public class TryWithResource2 {
	
	public static void main(String[] args) {
		System.out.println("문자를 입력하세요 > ");
		try(InputStreamReader isr1 = new InputStreamReader(System.in)){
			char input = (char)isr1.read();
			System.out.println("입력 글자 : " + input);
		}
		catch (IOException e) {
			e.printStackTrace();
		}
	}

}
