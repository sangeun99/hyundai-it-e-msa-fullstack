package exception;

import java.io.IOException;
import java.io.InputStreamReader;

public class ExceptionTest1 {
	public static void main(String[] args) {
		InputStreamReader isr = new InputStreamReader(System.in);
		try {
			isr.read();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
