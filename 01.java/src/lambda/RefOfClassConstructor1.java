package lambda;

interface A5 {
	B5 abc();
}

class B5 {
	B5(){
		System.out.println("첫 번째 생성자");
	}
	B5(int k){
		System.out.println("두 번째 생성자");
	}
}

public class RefOfClassConstructor1 {
	public static void main(String[] args) {
		// 1. 익명 이너 클래스
		A5 a1 = new A5() {
			@Override
			public B5 abc() {
				return new B5();
			}			
		};
		
		// 2. 람다식
		A5 a2 = () -> new B5();
		
		// 3. 클래스 생성자 참조
		A5 a3 = B5::new;
		
		a1.abc();
		a2.abc();
		a3.abc();		
	}
}
