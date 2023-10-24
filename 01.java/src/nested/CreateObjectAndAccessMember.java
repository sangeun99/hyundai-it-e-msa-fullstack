package nested;

class C {
	int a = 3;
	static int b = 4;

	void method1() {
		System.out.println("instance method");
	}

	static void method2() {
		System.out.println("static method");
	}

	static class D {
		void bcd() {
//			System.out.println(a); // 에러 : static이 아닌 필드는 접근 불가능
			System.out.println(b);
//			method1();  // 에러 : static이 아닌 메서드는 접근 불가능
			method2();
		}
	}
}

public class CreateObjectAndAccessMember {
	public static void main(String[] args) {
		C.D d = new C.D();
		d.bcd();
	}
}
