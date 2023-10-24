package lambda;

@FunctionalInterface
interface AA {
	void abc();
}

class BB {
	void bcd() {
		System.out.println("메서드");
	}
}

public class RefOfInstanceMethod {
	public static void main(String[] args) {
		// 1. 익명 이너 클래스
		AA a1 = new AA() {
			@Override
			public void abc() {
				BB b = new BB();
				b.bcd();
			}
		};
		
		// 2. 람다식으로 표현
		AA a2 = () -> {
			BB b = new BB();
			b.bcd();
		};
		
		// 3. 정의된 인스턴스 메서드 참조
		BB b = new BB();
		AA a3 = b::bcd;
		a1.abc();
		a2.abc();
		a3.abc();
		
	}
}
