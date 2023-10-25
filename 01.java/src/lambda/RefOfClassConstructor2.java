package lambda;

interface A6 {
	B6 abc(int k);
}

class B6 {
	B6(){
		System.out.println("첫 번째 생성자");
	}
	B6(int k){
		System.out.println("두 번째 생성자");
	}
}

public class RefOfClassConstructor2 {
	public static void main(String[] args) {
		// 1. 익명 이너 클래스
		A6 a1 = new A6() {
			@Override
			public B6 abc(int k) {
				return new B6(k);
			}			
		};
		
		// 2. 람다식
		A6 a2 = (int k) -> new B6(k);
		
		// 3. 클래스 생성자 참조
		A6 a3 = B6::new;
		
		a1.abc(3);
		a2.abc(3);
		a3.abc(3);		
	}
}
