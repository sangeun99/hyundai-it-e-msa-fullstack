package basic;

public class OpTest14 {
	public static void main(String[] args) {
		// 1 ~ 6 사이의 난수 발생
		for (int i = 0; i < 10; i++) {
			System.out.print((int)(Math.random() * 6) + 1 + " ");
		}
		System.out.println();
		
		// 4 ~ 15 사이의 난수 발생
		for (int i = 0; i < 100; i++) {
			System.out.print((int)(Math.random() * 12) + 4 + " ");
		}
		System.out.println();
		
		for (int i = 0; i < 100; i++) {
			System.out.print(((int)(Math.random() * 18) + 6) * 100 + " ");
		}
	}
}