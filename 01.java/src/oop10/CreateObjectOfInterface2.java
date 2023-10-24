package oop10;

interface A{
	int a = 3;
	void abc();
}

public class CreateObjectOfInterface2 {
	public static void main(String[] args) {
		A a1 = new A() {
			public void abc() {
				System.out.println("익명 이너 클래스를 이용한 객체 생성");
			}
		};
		A a2 = new A() {
			public void abc() {
				System.out.println("익명 이너 클래스를 이용한 객체 생성");
			}
		};
		a1.abc();
		System.out.println(a1.a);
		a2.abc();
		System.out.println(a2.a);
	}
}
