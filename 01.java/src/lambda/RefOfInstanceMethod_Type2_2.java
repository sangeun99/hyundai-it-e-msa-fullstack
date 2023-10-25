package lambda;

interface A3 {
	int abc(String str);
}

public class RefOfInstanceMethod_Type2_2 {
	public static void main(String[] args) {
		// 1. 익명 이너 클래스
		A3 a1 = new A3() {
			@Override
			public int abc(String str) {				
				return str.length();
			}			
		};
		
		// 2. 람다식
		A3 a2 = (String str) -> { return str.length(); };
		
		// 3. 자바가 제공하는 인스턴스 메서드 참조
		A3 a3 = String::length;
		
		System.out.println(a1.abc("안녕"));
		System.out.println(a2.abc("안녕"));
		System.out.println(a3.abc("안녕"));
	}

}
