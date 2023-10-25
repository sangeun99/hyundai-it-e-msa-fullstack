package lambda;

interface C1 {
	int[] abc(int len);
}

public class RefOfArrayConstructor {
	public static void main(String[] args) {
		// 1. 익명 이너 클래스
		C1 c1 = new C1() {
			@Override
			public int[] abc(int len) {
				return new int[len];
			}			
		};
		
		// 2. 람다식
		C1 c2 = (int len) -> new int[len];
		
		// 3. 배열의 생성자 참조
		C1 c3 = int[]::new;
		int[] array1 = c1.abc(3);
		System.out.println(array1.length);
		int[] array2 = c2.abc(3);
		System.out.println(array2.length);
		int[] array3 = c3.abc(3);
		System.out.println(array3.length);
	}
}
