package nested;

interface A3 {
	public abstract void abc();
}

class C3 {
	void cde(A3 d) {
		d.abc();
	}
}

public class AnonymousClass3 {
	
	public static void main(String[] args) {
		C3 e = new C3();
		A3 d = new A3() {
			public void abc() {
				System.out.println("입력매개변수 전달");
			}
		};
		e.cde(d);
		e.cde(new A3() {
			public void abc() {
				System.out.println("입력매개변수 전달");
			}
		});
	}

}
