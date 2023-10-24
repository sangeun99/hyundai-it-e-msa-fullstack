package generic;

class AA {
	public <T extends Number> void method1(T t) {
		System.out.println(t.intValue());
	}
}

interface MyInterface{
	public abstract void print();
}

class BB {
	public <T extends MyInterface> void method1(T t) {
		t.print();
	}
}

public class BoundedTypeOfGenericMethod {
	public static void main(String[] args) {
		AA a = new AA();
		a.method1(5.8);
		
		BB b = new BB();
		b.method1(new MyInterface() {
			public void print() {
				System.out.println("print() 구현");
			}
		});
	}
}
