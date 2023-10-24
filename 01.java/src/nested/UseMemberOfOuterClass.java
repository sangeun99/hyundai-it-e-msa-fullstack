package nested;

class ClassA {
	int a = 3;
	int b = 4;

	void abc() {
		System.out.println("A 클래스 메서드");
	}

	class ClassB {
		int a = 5;
		int b = 6;

		void abc() {
			System.out.println("B 클래스 메서드");
		}

		void bcd() {
			System.out.println(a);
			System.out.println(b);
			abc();

			System.out.println(ClassA.this.a);
			System.out.println(ClassA.this.b);
			ClassA.this.abc();
		}
	}
}

public class UseMemberOfOuterClass {
	public static void main(String[] args) {
		ClassA a = new ClassA();
		ClassA.ClassB b = a.new ClassB();
		b.bcd();
	}
}
