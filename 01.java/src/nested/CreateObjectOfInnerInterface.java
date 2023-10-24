package nested;

class A2 {
	interface B2 {
		public abstract void bcd();
	}
}

class C2 implements A2.B2 {
	public void bcd() {
		System.out.println("이너 인터페이스 구현 클래스 생성");
	}
}

public class CreateObjectOfInnerInterface {
	public static void main(String[] args) {
		C2 c = new C2();
		c.bcd();
		A2.B2 b = new A2.B2() {
			public void bcd() {
				System.out.println("익명 이너 클래스로 객체 생성");
			}
		};
		b.bcd();
	}
}
