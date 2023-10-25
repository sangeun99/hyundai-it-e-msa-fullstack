package lambda;

interface A0 {
	void abc(B0 b, int k);
}

class B0 {
	void bcd(int k) {
		System.out.println(k);
	}
}

public class RefOfInstanceMethod_Type2_1 {
	public static void main(String[] args) {
		// 익명 이너 클래스
		A0 a1 = new A0() {
			@Override
			public void abc(B0 b, int k) {
				b.bcd(k);
			}
		};
		
		// 람다식
		A0 a2 = (B0 b, int k) -> { b.bcd(k); };
		
		// 직접 정의한 인스턴스 메서드 참조
		A0 a3 =  B0::bcd;
		a1.abc(new B0(), 0);
		a2.abc(new B0(), 0);
		a3.abc(new B0(), 0);
	}
}
