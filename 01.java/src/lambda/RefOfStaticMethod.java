package lambda;

interface A2 {
	void abc();
}
class B2 {
	static void bcd() {
		System.out.println("메서드");
	}
}

public class RefOfStaticMethod {
	public static void main(String[] args) {
		// 1. 익명 이너 클래스
		A2 a1 = new A2() {
			@Override
			public void abc() {
				B2.bcd();
			}
		};
		
		// 2. 람다식으로 표현
		A2 a2 = () -> {B2.bcd();};
		
		// 3. 정적 메서드 참조
		A2 a3 = B2::bcd;
		a1.abc();
		a2.abc();
		a3.abc();		
	}
}
