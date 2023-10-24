package basic;

import java.util.Scanner;

public class BaseballGame {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		int s, b, count;
		int c1, c2, c3;
		int h1, h2, h3;
		
		c1 = (int)(Math.random() * 10);
		do {
			c2 = (int)(Math.random() * 10);
		} while (c2 == c1);
		do {
			c3 = (int) (Math.random() * 10);
		} while (c3 == c1 || c2 == c1);
		
		count = 0;
		do {
			System.out.println("0-9 사이에 중복되지 않은 숫자 3개 입력 (ex. 1 2 3)");
			s = b = 0;
			h1 = sc.nextInt();
			h2 = sc.nextInt();
			h3 = sc.nextInt();
			
			if (h1 == c1) s++;
			else if (h1 == c2 || h1 == c3) b++;
			
			if (h2 == c2) s++;
			else if (h2 == c1 || h2 == c3) b++;
			
			if (h3 == c3) s++;
			else if (h3 == c1 || h3 == c2) b++;
			
			System.out.printf("%dS %dB\n", s, b);
			count++;			
		} while (s != 3);
		System.out.println("축하합니다! " + count + "번만에 맞추셨습니다.");
	}
}
