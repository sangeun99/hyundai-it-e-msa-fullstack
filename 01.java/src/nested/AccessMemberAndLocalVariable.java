package nested;

class E {
	int a = 3;

	void abc() {
		int b = 5;
		class F {
			void bcd() {
				System.out.println(a);
				System.out.println(b);
				a = 5;
//				b = 7; // 에러: 로컬 클래스에서 사용하는 지역 변수는 자동으로 final 선언됨 
			}
		}
		F ff = new F();
		ff.bcd();
	}
}

public class AccessMemberAndLocalVariable {
	public static void main(String[] args) {
		E e = new E();
		e.abc();
	}
}
