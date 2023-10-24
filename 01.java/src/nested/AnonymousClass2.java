package nested;

interface AA{
	public abstract void abc();
}

class BB implements AA {
	public void abc() {
		System.out.println("입력 매개변수 전달");
	}
}

class CC {
	void cde(AA a) {
		a.abc();
	}
}

public class AnonymousClass2 {
	public static void main(String[] args) {
		CC c = new CC();
		AA a = new BB();
		c.cde(a);	// 방법 1 : 클래스명 O + 참조변수명 O
		c.cde(new BB());	// 방법 2 : 클래스명 O + 참조변수명 X
	}
}
