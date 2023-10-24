package basic;

public class OpTest4 {
	public static void main(String[] args) {
		int a = 10; // 1010
		int b = 4; // 100
		
		System.out.println(a & b);
		System.out.println(a | b);
		System.out.println(a ^ b);
		
		
		int i = 10;
		int j = 5;
		int temp;
		
//		temp = i;
//		i = j;
//		j = temp;
		
		i ^= j;
		j ^= i;
		i ^= j;
		
		System.out.println(i);
		System.out.println(j);
		
		int n = 10;
		System.out.println(n >> 2);
		System.out.println(n << 2);
		System.out.println(n >>> 2); // 부호까지 시프트
	}
}
