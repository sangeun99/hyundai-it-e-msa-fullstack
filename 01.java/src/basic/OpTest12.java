package basic;

public class OpTest12 {
	public static void main(String[] args) {
		int n = 0;
		System.out.println( n > 0 ? n % 2 == 0 ? "양수/짝수" : "양수/홀수" :
							n < 0 ? "음수" :
									"양수도 음수도 아님");
	}
}
