package basic;

public class ForTest2 {
	public static void main(String[] args) {
		int sum = 0;
		int sum_3 = 0;
		for (int i = 1; i <= 1000; i++) {			
			sum += i;
			if (i % 3 == 0) {
				sum_3 += i;
			}
		}
		System.out.println(sum);
		System.out.println(sum_3);
	}
}
