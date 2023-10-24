package lambda;

interface A{
	void method1();
}

interface B{
	void method2(int a);
}

interface C{
	int method3();
}

interface D{
	double method4(int a, double b);
}

public class FunctionToLambdaExpression {
	public static void main(String[] args) {
		// 1. 입력x 리턴x
		A a1 = new A() {
			public void method1() {
				System.out.println("입력x 리턴x 함수");
			}
		};
		A a2 = () -> {System.out.println("입력x 리턴x 함수");};
		A a3 = () -> System.out.println("입력x 리턴x 함수");
		
		// 2. 입력o 리턴x
		B b1 = new B() {
			public void method2(int a) {
				System.out.println("입력o 리턴x 함수");
			}
		};
		B b2 = (int a) -> {System.out.println("입력o 리턴x 함수");};
		B b3 = (a) -> {System.out.println("입력o 리턴x 함수");};
		B b4 = (a) -> System.out.println("입력o 리턴x 함수");
		B b5 = a -> System.out.println("입력o 리턴x 함수");
		
		// 3. 입력x 리턴o
		C c1 = new C() {
			public int method3() {
				return 4;
			}
		};
		C c2 = () -> { return 4; };
		C c3 = () -> 4;
		
		// 4. 입력o 리턴o
		D d1 = new D() {
			public double method4(int a, double b) {
				return a + b;
			}
		};
		D d2 = (int a, double b) -> {return a+b;};
		D d3 = (a, b) -> { return a+b; };
		D d4 = (a, b) -> a+b;
	}
}
